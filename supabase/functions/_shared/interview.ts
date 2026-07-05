// Interview-prep server helpers, ported from
// `koras-web/src/lib/interview-prep/{server,default-questions,analyze-shared}.ts`.

import type { SupabaseClient } from "https://esm.sh/@supabase/supabase-js@2.45.4";
import { modalBaseUrl, modalUrl } from "./modal.ts";
import { getObjectBytes } from "./r2.ts";

export const INTERVIEW_PROGRAM_ID = "interview-prep";
export const MAX_ACTIVE_ANALYSES_PER_USER = 2;

export interface InterviewQuestion {
  id: string;
  question: string;
  type: string;
  skillTags: string[];
  suggestedDurationSeconds: number;
  answerFramework: string | null;
  whatGoodLooksLike: string[];
}

export const DEFAULT_INTERVIEW_QUESTIONS: InterviewQuestion[] = [
  {
    id: "default-tell-me-about-yourself",
    question: "Tell me about yourself.",
    type: "general",
    skillTags: ["structure", "confidence", "relevance"],
    suggestedDurationSeconds: 90,
    answerFramework: "present_past_proof_future",
    whatGoodLooksLike: [
      "Starts with who you are now",
      "Connects past experience to the opportunity",
      "Includes one proof point or example",
      "Ends with why this opportunity makes sense",
    ],
  },
  {
    id: "default-why-this-opportunity",
    question: "Why are you interested in this opportunity?",
    type: "motivation",
    skillTags: ["motivation", "company_fit", "specificity"],
    suggestedDurationSeconds: 75,
    answerFramework: "point_reason_example",
    whatGoodLooksLike: ["Specific reason", "Connection to role", "Avoids generic praise"],
  },
  {
    id: "default-strengths",
    question: "What are your strengths?",
    type: "strengths",
    skillTags: ["specificity", "confidence"],
    suggestedDurationSeconds: 75,
    answerFramework: "point_reason_example",
    whatGoodLooksLike: ["Names a real strength", "Gives evidence", "Connects to role"],
  },
  {
    id: "default-weakness",
    question: "What is one weakness you are working on?",
    type: "weakness",
    skillTags: ["self_awareness", "growth"],
    suggestedDurationSeconds: 75,
    answerFramework: "point_reason_example",
    whatGoodLooksLike: ["Honest but not damaging", "Shows action", "Shows improvement"],
  },
  {
    id: "default-challenge",
    question: "Tell me about a challenge you faced.",
    type: "behavioral",
    skillTags: ["STAR", "resilience", "specificity"],
    suggestedDurationSeconds: 120,
    answerFramework: "STAR",
    whatGoodLooksLike: ["Clear situation", "Specific action", "Measurable result"],
  },
  {
    id: "default-teamwork",
    question: "Describe a time you worked in a team.",
    type: "teamwork",
    skillTags: ["collaboration", "STAR"],
    suggestedDurationSeconds: 120,
    answerFramework: "STAR",
    whatGoodLooksLike: ["Explains team goal", "Shows your contribution", "Includes result"],
  },
  {
    id: "default-leadership",
    question: "Tell me about a time you showed leadership.",
    type: "leadership",
    skillTags: ["leadership", "STAR"],
    suggestedDurationSeconds: 120,
    answerFramework: "STAR",
    whatGoodLooksLike: ["Shows initiative", "Explains action", "Shows impact"],
  },
  {
    id: "default-why-choose-you",
    question: "Why should we choose you?",
    type: "company_fit",
    skillTags: ["confidence", "relevance", "specificity"],
    suggestedDurationSeconds: 90,
    answerFramework: "point_reason_example",
    whatGoodLooksLike: ["Clear value proposition", "Role fit", "Evidence"],
  },
  {
    id: "default-five-years",
    question: "Where do you see yourself in five years?",
    type: "general",
    skillTags: ["career_goals", "clarity"],
    suggestedDurationSeconds: 75,
    answerFramework: "point_reason_example",
    whatGoodLooksLike: ["Realistic goal", "Connects to role", "Shows ambition"],
  },
  {
    id: "default-questions-for-us",
    question: "Do you have any questions for us?",
    type: "company_fit",
    skillTags: ["curiosity", "professionalism"],
    suggestedDurationSeconds: 60,
    answerFramework: null,
    whatGoodLooksLike: [
      "Asks thoughtful question",
      "Shows preparation",
      "Avoids salary-only focus",
    ],
  },
];

export function normalizeQuestionsField(raw: unknown): InterviewQuestion[] {
  if (!raw || !Array.isArray(raw)) return [];
  const out: InterviewQuestion[] = [];
  for (const item of raw) {
    if (!item || typeof item !== "object") continue;
    const q = item as Record<string, unknown>;
    if (typeof q.question !== "string" || !q.question.trim()) continue;
    const skillTagsRaw = Array.isArray(q.skillTags) ? q.skillTags : [];
    const whatGoodRaw = Array.isArray(q.whatGoodLooksLike)
      ? q.whatGoodLooksLike
      : [];
    out.push({
      id:
        typeof q.id === "string" && q.id.trim() ? q.id.trim() : `q-${out.length}`,
      question: q.question.trim(),
      type: typeof q.type === "string" ? q.type : "general",
      skillTags: skillTagsRaw.filter((s): s is string => typeof s === "string"),
      suggestedDurationSeconds:
        typeof q.suggestedDurationSeconds === "number"
          ? Math.max(30, Math.min(180, Math.round(q.suggestedDurationSeconds)))
          : 90,
      answerFramework:
        typeof q.answerFramework === "string" ? q.answerFramework : null,
      whatGoodLooksLike: whatGoodRaw.filter(
        (s): s is string => typeof s === "string",
      ),
    });
  }
  return out;
}

export async function userHasTooManyActiveAnalyses(
  supabase: SupabaseClient,
  userId: string,
): Promise<boolean> {
  const { count, error } = await supabase
    .from("interview_prep_attempts")
    .select("id", { count: "exact", head: true })
    .eq("user_id", userId)
    .eq("analysis_status", "analyzing");
  if (error) {
    console.warn("[interview] concurrency check failed", error);
    return false;
  }
  return (count ?? 0) >= MAX_ACTIVE_ANALYSES_PER_USER;
}

// ---------------------------------------------------------------------------
//  Analyze pipeline (ported from analyze-shared.ts)
// ---------------------------------------------------------------------------

export type AnalyzeResult =
  | { ok: true; attempt: Record<string, unknown> }
  | { ok: false; error: { message: string; status: number } };

async function loadScenarioContext(
  supabase: SupabaseClient,
  scenarioId: string | null,
): Promise<{
  title: string | null;
  jobRole: string | null;
  company: string | null;
  description: string | null;
}> {
  if (!scenarioId) {
    return { title: null, jobRole: null, company: null, description: null };
  }
  const { data } = await supabase
    .from("interview_prep_scenarios")
    .select("title, job_role, company, description")
    .eq("id", scenarioId)
    .maybeSingle();
  return {
    title: data?.title ?? null,
    jobRole: data?.job_role ?? null,
    company: data?.company ?? null,
    description: data?.description ?? null,
  };
}

async function refreshUserProgress(
  supabase: SupabaseClient,
  userId: string,
  attemptId: string,
  overallScore: number | null,
): Promise<void> {
  if (overallScore === null) return;
  const { data: existing } = await supabase
    .from("interview_prep_user_progress")
    .select("total_attempts, best_overall_score")
    .eq("user_id", userId)
    .maybeSingle();
  const bestScore =
    existing?.best_overall_score === null ||
    existing?.best_overall_score === undefined
      ? overallScore
      : Math.max(existing.best_overall_score, overallScore);
  await supabase.from("interview_prep_user_progress").upsert(
    {
      user_id: userId,
      total_attempts: (existing?.total_attempts ?? 0) + 1,
      latest_overall_score: overallScore,
      best_overall_score: bestScore,
      latest_attempt_id: attemptId,
      last_practiced_at: new Date().toISOString(),
      updated_at: new Date().toISOString(),
    },
    { onConflict: "user_id" },
  );
}

export async function runInterviewAnalysis(
  supabase: SupabaseClient,
  attempt: Record<string, unknown>,
): Promise<AnalyzeResult> {
  const attemptId = attempt.id as string;
  const audioObjectKey = attempt.audio_object_key as string | null;

  if (!audioObjectKey) {
    return {
      ok: false,
      error: {
        message: "This attempt has no recording — please re-record the answer.",
        status: 400,
      },
    };
  }

  const base = modalBaseUrl();
  if (!base) {
    return {
      ok: false,
      error: {
        message: "Analysis service is not configured. Set MODAL_AI_TUTOR_API_URL.",
        status: 503,
      },
    };
  }

  await supabase
    .from("interview_prep_attempts")
    .update({
      analysis_status: "analyzing",
      attempt_status: "submitted",
      analysis_started_at: new Date().toISOString(),
      analysis_error: null,
    })
    .eq("id", attemptId);

  const audio = await getObjectBytes(audioObjectKey);
  if (!audio) {
    await supabase
      .from("interview_prep_attempts")
      .update({
        analysis_status: "failed",
        attempt_status: "failed",
        analysis_error: "Could not fetch recording from storage.",
        analysis_completed_at: new Date().toISOString(),
      })
      .eq("id", attemptId);
    return {
      ok: false,
      error: { message: "Could not read your recording from storage.", status: 500 },
    };
  }

  const ctx = await loadScenarioContext(
    supabase,
    (attempt.scenario_id as string | null) ?? null,
  );

  const form = new FormData();
  form.append(
    "audio",
    new Blob([audio.body], { type: audio.contentType }),
    "audio.webm",
  );
  form.append("question", (attempt.question as string) ?? "");
  if (attempt.question_type) {
    form.append("questionType", attempt.question_type as string);
  }
  if (ctx.title) form.append("scenarioTitle", ctx.title);
  if (ctx.jobRole) form.append("jobRole", ctx.jobRole);
  if (ctx.company) form.append("company", ctx.company);
  if (ctx.description) form.append("description", ctx.description);
  if (attempt.duration_seconds != null) {
    form.append("durationSeconds", String(attempt.duration_seconds));
  }

  let report: Record<string, unknown>;
  try {
    const res = await fetch(modalUrl(base, "/analyze-interview-answer"), {
      method: "POST",
      body: form,
    });
    if (!res.ok) {
      const detail = await res.text().catch(() => "");
      const message = detail || `Modal returned ${res.status}`;
      await supabase
        .from("interview_prep_attempts")
        .update({
          analysis_status: "failed",
          attempt_status: "failed",
          analysis_error: message.slice(0, 600),
          analysis_completed_at: new Date().toISOString(),
        })
        .eq("id", attemptId);
      return { ok: false, error: { message: message.slice(0, 300), status: 502 } };
    }
    report = (await res.json()) as Record<string, unknown>;
  } catch (err) {
    const message =
      err instanceof Error ? err.message : "Network error contacting Modal.";
    await supabase
      .from("interview_prep_attempts")
      .update({
        analysis_status: "failed",
        attempt_status: "failed",
        analysis_error: message.slice(0, 600),
        analysis_completed_at: new Date().toISOString(),
      })
      .eq("id", attemptId);
    return { ok: false, error: { message, status: 502 } };
  }

  const scores = (report.scores as Record<string, number>) ?? {};
  const overall = scores.overall;

  const persisted = {
    transcript: (report.transcript as string) || null,
    overall_score: overall ?? null,
    delivery_score: scores.delivery ?? null,
    relevance_score: scores.relevance ?? null,
    structure_score: scores.structure ?? null,
    specificity_score: scores.specificity ?? null,
    confidence_score: scores.confidence ?? null,
    fluency_score: scores.fluency ?? null,
    grammar_score: scores.grammar ?? null,
    conciseness_score: scores.conciseness ?? null,
    professionalism_score: scores.professionalism ?? null,
    star_score: scores.star ?? null,
    feedback: report.feedback ?? null,
    raw_report: report,
    analysis_status: "completed",
    attempt_status: "completed",
    analysis_completed_at: new Date().toISOString(),
    analysis_error: null,
  };

  const { data: updated, error: updateErr } = await supabase
    .from("interview_prep_attempts")
    .update(persisted)
    .eq("id", attemptId)
    .select("*")
    .single();

  if (updateErr || !updated) {
    console.error("[interview] persist failed", updateErr);
    return { ok: false, error: { message: "Could not save the report.", status: 500 } };
  }

  await refreshUserProgress(
    supabase,
    attempt.user_id as string,
    attemptId,
    typeof overall === "number" ? overall : null,
  );

  return { ok: true, attempt: updated as Record<string, unknown> };
}
