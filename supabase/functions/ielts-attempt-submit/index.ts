// ielts-attempt-submit — analyze an already-uploaded IELTS attempt.
// Body: { attemptId, lessonId, part, audioObjectKey, prompt? } → { report }
//
// The mobile client uploads the audio to R2 first (presigned PUT), then
// passes the objectKey here. We pull the bytes from R2 and forward them
// as multipart to Modal /analyze-ielts-speaking, then persist scores +
// progress. Ported from `koras-web/.../ielts/attempt/submit/route.ts`.

import { handlePreflight, json, error } from "../_shared/cors.ts";
import { requireUser } from "../_shared/auth.ts";
import { hasProgramAccess } from "../_shared/programs.ts";
import { getObjectBytes } from "../_shared/r2.ts";
import { modalBaseUrl, modalUrl } from "../_shared/modal.ts";
import {
  IELTS_CRITERIA_LABELS,
  roundToNearestHalfBand,
  strongestAndWeakest,
  type IELTSCriterionKey,
} from "../_shared/ielts-scoring.ts";

const PROGRAM_ID = "ielts-speaking";
const VALID_PARTS = ["overview", "part_1", "part_2", "part_3", "mock"];

Deno.serve(async (req) => {
  const pre = handlePreflight(req);
  if (pre) return pre;

  const auth = await requireUser(req);
  if (auth.error) return auth.error;
  if (!(await hasProgramAccess(auth.supabase, auth.user.id, PROGRAM_ID))) {
    return error("Forbidden", 403);
  }

  let body: {
    attemptId?: string;
    lessonId?: string;
    part?: string;
    audioObjectKey?: string;
    prompt?: string;
    durationSeconds?: number;
  };
  try {
    body = await req.json();
  } catch {
    return error("Invalid JSON", 400);
  }

  const attemptId = body.attemptId;
  if (!attemptId || !/^[0-9a-f-]{36}$/i.test(attemptId)) {
    return error("Invalid attemptId", 400);
  }
  const part = body.part ?? "";
  if (!VALID_PARTS.includes(part)) return error("Invalid part", 400);
  const lessonId = body.lessonId || "ielts-practice";
  const prompt = body.prompt ?? "";
  const audioObjectKey = body.audioObjectKey;
  if (!audioObjectKey) return error("Missing audioObjectKey", 400);

  // Confirm the attempt belongs to the caller (RLS-scoped read).
  const { data: attempt } = await auth.supabase
    .from("ielts_lesson_attempts")
    .select("id")
    .eq("id", attemptId)
    .maybeSingle();
  if (!attempt) return error("Attempt not found", 404);

  const base = modalBaseUrl();
  if (!base) return error("Backend not configured.", 500);

  const audio = await getObjectBytes(audioObjectKey);
  if (!audio) return error("Could not read your recording from storage.", 500);

  let report: Record<string, unknown>;
  try {
    const form = new FormData();
    form.append(
      "audio",
      new Blob([audio.body], { type: audio.contentType }),
      "audio.webm",
    );
    form.append("lesson_id", lessonId);
    form.append("part", part);
    form.append("prompt", prompt);
    form.append("attempt_id", attemptId);
    form.append("user_id", auth.user.id);

    const res = await fetch(modalUrl(base, "/analyze-ielts-speaking"), {
      method: "POST",
      body: form,
    });
    if (!res.ok) {
      const detail = await res.text().catch(() => "");
      throw new Error(`Modal IELTS analysis failed (${res.status}): ${detail}`);
    }
    report = (await res.json()) as Record<string, unknown>;
  } catch (err) {
    console.error("[ielts-attempt-submit] analysis failed", err);
    return error(
      err instanceof Error ? err.message : "Could not analyse your answer. Please try again.",
      502,
    );
  }

  const criteriaScores = (report.criteriaScores as Record<string, number>) ?? {};
  const korasMetrics = (report.korasMetrics as Record<string, unknown>) ?? {};
  const { strongest, weakest } = strongestAndWeakest(criteriaScores);

  const update = {
    transcript:
      typeof report.transcript === "string"
        ? report.transcript
        : (korasMetrics.normalizedTranscript as string) ?? null,
    audio_object_key: audioObjectKey,
    audio_mime_type: audio.contentType,
    recording_upload_status: "uploaded",
    duration_seconds: body.durationSeconds ?? korasMetrics.durationSeconds ?? null,
    practice_band: report.practiceBandEstimate,
    fluency_coherence_score: criteriaScores.fluencyCoherence,
    lexical_resource_score: criteriaScores.lexicalResource,
    grammar_score: criteriaScores.grammarRangeAccuracy,
    pronunciation_score: criteriaScores.pronunciation,
    overall_score: report.overallScore,
    feedback: report.feedback,
    raw_report: report,
    detected_languages: korasMetrics.detectedLanguages ?? [],
    code_switching_detected: !!korasMetrics.codeSwitchingDetected,
  };

  const { error: updateError } = await auth.supabase
    .from("ielts_lesson_attempts")
    .update(update)
    .eq("id", attemptId);
  if (updateError) {
    console.error("[ielts-attempt-submit] update failed", updateError);
    return error("Could not save your attempt.", 500);
  }

  // Aggregate progress (best-effort).
  const { data: progress } = await auth.supabase
    .from("ielts_user_progress")
    .select("total_attempts")
    .eq("user_id", auth.user.id)
    .maybeSingle();

  await auth.supabase.from("ielts_user_progress").upsert(
    {
      user_id: auth.user.id,
      latest_practice_band: roundToNearestHalfBand(
        report.practiceBandEstimate as number,
      ),
      strongest_criterion: IELTS_CRITERIA_LABELS[strongest as IELTSCriterionKey],
      weakest_criterion: IELTS_CRITERIA_LABELS[weakest as IELTSCriterionKey],
      total_attempts: (progress?.total_attempts ?? 0) + 1,
      last_practiced_at: new Date().toISOString(),
      updated_at: new Date().toISOString(),
    },
    { onConflict: "user_id" },
  );

  return json({ report });
});
