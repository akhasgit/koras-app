// AI Tutor server helpers, ported from `koras-web/src/lib/ai-tutor-server.ts`.

import type { SupabaseClient } from "https://esm.sh/@supabase/supabase-js@2.45.4";
import { modalBaseUrl, modalUrl } from "./modal.ts";

export const VALID_MODES = [
  "speaking_foundations",
  "interview_prep",
  "ielts_speaking",
  "free_conversation",
  "presentation",
  "debate",
] as const;

export const MIN_USER_TURNS_FOR_ANALYSIS = 2;
export const MIN_TOTAL_USER_TRANSCRIPT_LENGTH = 20;

/** Verify a session belongs to the user (admin client bypasses RLS). */
export async function validateSessionOwnership(
  admin: SupabaseClient,
  sessionId: string,
  userId: string,
): Promise<Record<string, unknown> | null> {
  if (!sessionId || typeof sessionId !== "string") return null;
  const { data } = await admin
    .from("ai_tutor_sessions")
    .select("*")
    .eq("id", sessionId)
    .eq("user_id", userId)
    .maybeSingle();
  return (data as Record<string, unknown>) ?? null;
}

/** Map a DB report row to the client-facing AITutorReport shape. */
export function mapDbReportToResponse(
  row: Record<string, unknown>,
): Record<string, unknown> {
  const raw = (row.raw_report as Record<string, unknown>) ?? {};
  const rawFeedback = (raw.feedback as Record<string, unknown>) ?? {};
  return {
    overall: (row.overall_score as number) ?? 0,
    scores: {
      relevance: (row.relevance_score as number) ?? 0,
      eloquence: (row.eloquence_score as number) ?? 0,
      fluency: (row.fluency_score as number) ?? 0,
      grammar: (row.grammar_score as number) ?? 0,
      tense: (row.tense_score as number) ?? 0,
      fillerControl: (row.filler_score as number) ?? 0,
      clarity: (row.clarity_score as number) ?? 0,
      confidence: (row.confidence_score as number) ?? 0,
      vocabulary: (row.vocabulary_score as number) ?? 0,
      listening: (row.listening_score as number) ?? 0,
    },
    metrics: (row.metrics as Record<string, unknown>) ?? undefined,
    feedback: {
      summary: (rawFeedback.summary as string) ?? "",
      strengths: (row.strengths as string[]) ?? [],
      improvements: (row.improvements as string[]) ?? [],
      repeatedMistakes: (row.repeated_mistakes as string[]) ?? [],
      bestAnswer: (row.best_answer as string) ?? undefined,
      rewrittenAnswer: (row.rewritten_answer as string) ?? undefined,
      nextRecommendedLesson:
        (row.next_recommended_lesson as string) ?? undefined,
    },
    turnFeedback: (row.turn_feedback as unknown) ?? undefined,
  };
}

/** Call Modal /analyze-ai-tutor. */
export async function callModalAnalysis(payload: {
  session_id: string;
  user_id: string;
  mode: string;
  duration_seconds: number | null;
  audio_object_key: string | null;
  turns: Array<{
    role: string;
    turn_index: number;
    transcript: string;
    started_at?: string | null;
    ended_at?: string | null;
  }>;
}): Promise<Record<string, unknown>> {
  const base = modalBaseUrl();
  if (!base) throw new Error("Missing MODAL_AI_TUTOR_API_URL.");
  const res = await fetch(modalUrl(base, "/analyze-ai-tutor"), {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(payload),
  });
  if (!res.ok) {
    const detail = await res.text().catch(() => "unknown");
    throw new Error(`Modal analysis failed (${res.status}): ${detail}`);
  }
  return (await res.json()) as Record<string, unknown>;
}

/** Persist the Modal analysis into ai_tutor_reports. */
export async function saveReport(
  admin: SupabaseClient,
  sessionId: string,
  userId: string,
  report: Record<string, unknown>,
): Promise<Record<string, unknown>> {
  const scores = report.scores as Record<string, number> | undefined;
  const feedback = report.feedback as Record<string, unknown> | undefined;
  const metrics = report.metrics as Record<string, unknown> | undefined;

  const row = {
    session_id: sessionId,
    user_id: userId,
    overall_score: report.overall as number,
    relevance_score: scores?.relevance,
    eloquence_score: scores?.eloquence,
    fluency_score: scores?.fluency,
    grammar_score: scores?.grammar,
    tense_score: scores?.tense,
    filler_score: scores?.fillerControl,
    clarity_score: scores?.clarity,
    confidence_score: scores?.confidence,
    vocabulary_score: scores?.vocabulary,
    listening_score: scores?.listening,
    metrics: metrics ?? null,
    strengths: feedback?.strengths ?? [],
    improvements: feedback?.improvements ?? [],
    repeated_mistakes: feedback?.repeatedMistakes ?? [],
    best_answer: (feedback?.bestAnswer as string) ?? null,
    rewritten_answer: (feedback?.rewrittenAnswer as string) ?? null,
    next_recommended_lesson:
      (feedback?.nextRecommendedLesson as string) ?? null,
    turn_feedback: report.turnFeedback ?? null,
    raw_report: report,
  };

  const { data, error } = await admin
    .from("ai_tutor_reports")
    .insert(row)
    .select()
    .single();
  if (error) throw new Error(`Failed to save report: ${error.message}`);
  return data as Record<string, unknown>;
}
