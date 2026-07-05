// ai-tutor-end — finalize a session: gating checks → Modal /analyze-ai-tutor
// → persist report → refresh insights. Body:
// { sessionId, durationSeconds?, audioObjectKey?, recordingUploadStatus?,
//   elevenlabsConversationId? } → { report }

import { handlePreflight, json, error } from "../_shared/cors.ts";
import { requireUser, getAdminClient } from "../_shared/auth.ts";
import {
  validateSessionOwnership,
  callModalAnalysis,
  saveReport,
  mapDbReportToResponse,
  MIN_USER_TURNS_FOR_ANALYSIS,
  MIN_TOTAL_USER_TRANSCRIPT_LENGTH,
} from "../_shared/ai-tutor.ts";
import { refreshLearnerInsights } from "../_shared/learner-insights.ts";

Deno.serve(async (req) => {
  const pre = handlePreflight(req);
  if (pre) return pre;

  const auth = await requireUser(req);
  if (auth.error) return auth.error;

  let body: {
    sessionId?: string;
    durationSeconds?: number;
    audioObjectKey?: string;
    recordingUploadStatus?: string;
    elevenlabsConversationId?: string;
  };
  try {
    body = await req.json();
  } catch {
    return error("Invalid request body", 400);
  }

  const sessionId = body.sessionId;
  const admin = getAdminClient();
  const session = await validateSessionOwnership(admin, sessionId ?? "", auth.user.id);
  if (!session) return error("Session not found or access denied", 404);

  const sessionUpdate: Record<string, unknown> = {
    status: "analyzing",
    ended_at: new Date().toISOString(),
  };
  if (body.durationSeconds != null) {
    sessionUpdate.duration_seconds = Math.round(body.durationSeconds);
  }
  if (body.audioObjectKey) sessionUpdate.audio_object_key = body.audioObjectKey;
  if (body.recordingUploadStatus) {
    sessionUpdate.recording_upload_status = body.recordingUploadStatus;
  }
  if (body.elevenlabsConversationId) {
    sessionUpdate.elevenlabs_conversation_id = body.elevenlabsConversationId;
  }

  await admin.from("ai_tutor_sessions").update(sessionUpdate).eq("id", sessionId);

  const { data: turns, error: turnsError } = await admin
    .from("ai_tutor_turns")
    .select("role, turn_index, transcript, started_at, ended_at")
    .eq("session_id", sessionId)
    .order("turn_index", { ascending: true });

  const failSession = () =>
    admin.from("ai_tutor_sessions").update({ status: "failed" }).eq("id", sessionId);

  if (turnsError) {
    console.error("[ai-tutor-end] failed to fetch turns:", turnsError.message);
    await failSession();
    return error("Failed to fetch conversation turns", 500);
  }

  const allTurns = turns ?? [];
  const userTurns = allTurns.filter((t) => t.role === "user");
  const totalUserTranscript = userTurns.map((t) => t.transcript).join(" ");

  if (userTurns.length < MIN_USER_TURNS_FOR_ANALYSIS) {
    await failSession();
    return error(
      `Not enough speaking data. We need at least ${MIN_USER_TURNS_FOR_ANALYSIS} responses to generate a meaningful report. Try having a longer conversation next time.`,
      400,
    );
  }
  if (totalUserTranscript.trim().length < MIN_TOTAL_USER_TRANSCRIPT_LENGTH) {
    await failSession();
    return error(
      "Your responses were too brief for analysis. Try giving more detailed answers next time.",
      400,
    );
  }

  let modalReport: Record<string, unknown>;
  try {
    modalReport = await callModalAnalysis({
      session_id: sessionId!,
      user_id: auth.user.id,
      mode: session.mode as string,
      duration_seconds: (sessionUpdate.duration_seconds as number) ?? null,
      audio_object_key:
        (sessionUpdate.audio_object_key as string) ??
        (session.audio_object_key as string) ??
        null,
      turns: allTurns.map((t) => ({
        role: t.role,
        turn_index: t.turn_index,
        transcript: t.transcript,
        started_at: t.started_at,
        ended_at: t.ended_at,
      })),
    });
  } catch (err) {
    console.error("[ai-tutor-end] Modal analysis failed:", err);
    await failSession();
    return error(
      "Analysis failed. Please try again. If this keeps happening, your conversation may be too short.",
      502,
    );
  }

  let savedRow: Record<string, unknown>;
  try {
    savedRow = await saveReport(admin, sessionId!, auth.user.id, modalReport);
  } catch (err) {
    console.error("[ai-tutor-end] save report failed:", err);
    await failSession();
    return error("Failed to save report", 500);
  }

  await admin.from("ai_tutor_sessions").update({ status: "completed" }).eq("id", sessionId);

  // Best-effort, non-blocking insights refresh (mirrors the web).
  refreshLearnerInsights(admin, auth.user.id).catch((err) => {
    console.error("[ai-tutor-end] refresh learner insights failed:", err);
  });

  return json({ report: mapDbReportToResponse(savedRow) });
});
