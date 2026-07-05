// Recompute + upsert the learner_insights row for a user.
// Ported 1:1 from `koras-web/src/lib/learner-insights.ts`.

import type { SupabaseClient } from "https://esm.sh/@supabase/supabase-js@2.45.4";

type Report = Record<string, unknown> & {
  created_at: string;
  overall_score?: number | null;
};

const XP_PER_SESSION = 50;
const XP_SCORE_ABOVE_70_BONUS = 10;
const XP_SCORE_ABOVE_85_BONUS = 20;
const XP_PER_STREAK_DAY = 15;
const XP_PER_IMPROVEMENT_POINT = 5;

const DIMENSIONS = [
  "confidence",
  "filler",
  "clarity",
  "fluency",
  "grammar",
  "vocabulary",
  "relevance",
  "eloquence",
  "tense",
  "listening",
] as const;

const DIMENSION_LABELS: Record<string, string> = {
  confidence: "Confidence",
  filler: "Filler control",
  clarity: "Clarity",
  fluency: "Fluency",
  grammar: "Grammar",
  vocabulary: "Vocabulary",
  relevance: "Relevance",
  eloquence: "Eloquence",
  tense: "Tense usage",
  listening: "Listening",
};

const n = (v: unknown): number => (typeof v === "number" ? v : 0);

export async function refreshLearnerInsights(
  admin: SupabaseClient,
  userId: string,
): Promise<void> {
  const { data: reports } = await admin
    .from("ai_tutor_reports")
    .select(
      "overall_score, relevance_score, eloquence_score, fluency_score, grammar_score, tense_score, filler_score, clarity_score, confidence_score, vocabulary_score, listening_score, strengths, improvements, next_recommended_lesson, created_at",
    )
    .eq("user_id", userId)
    .order("created_at", { ascending: false })
    .limit(50);

  const { data: sessions } = await admin
    .from("ai_tutor_sessions")
    .select("mode, duration_seconds, status, created_at")
    .eq("user_id", userId)
    .eq("status", "completed")
    .order("created_at", { ascending: false });

  const allReports = (reports ?? []) as Report[];
  const allSessions = (sessions ?? []) as Array<
    Record<string, unknown> & { created_at: string; mode: string }
  >;

  if (allReports.length === 0) {
    await admin.from("learner_insights").upsert(
      {
        user_id: userId,
        total_sessions: allSessions.length,
        last_refreshed_at: new Date().toISOString(),
      },
      { onConflict: "user_id" },
    );
    return;
  }

  const scoreHistory = allReports
    .slice(0, 20)
    .reverse()
    .map((r) => ({
      date: r.created_at,
      overall: n(r.overall_score),
      confidence: n(r.confidence_score),
      filler: n(r.filler_score),
      clarity: n(r.clarity_score),
      fluency: n(r.fluency_score),
      grammar: n(r.grammar_score),
      vocabulary: n(r.vocabulary_score),
      relevance: n(r.relevance_score),
      eloquence: n(r.eloquence_score),
      tense: n(r.tense_score),
      listening: n(r.listening_score),
    }));

  const recentReports = allReports.slice(0, 5);
  const overallScoreAvg = Math.round(
    recentReports.reduce((s, r) => s + n(r.overall_score), 0) /
      recentReports.length,
  );

  let scoreTrend: "improving" | "stable" | "declining" = "stable";
  if (allReports.length >= 6) {
    const recent3 =
      allReports.slice(0, 3).reduce((s, r) => s + n(r.overall_score), 0) / 3;
    const prev3 =
      allReports.slice(3, 6).reduce((s, r) => s + n(r.overall_score), 0) / 3;
    const diff = recent3 - prev3;
    if (diff >= 3) scoreTrend = "improving";
    else if (diff <= -3) scoreTrend = "declining";
  } else if (allReports.length >= 2) {
    const diff =
      n(allReports[0].overall_score) -
      n(allReports[allReports.length - 1].overall_score);
    if (diff >= 3) scoreTrend = "improving";
    else if (diff <= -3) scoreTrend = "declining";
  }

  let currentLevel = 1;
  if (overallScoreAvg >= 85) currentLevel = 5;
  else if (overallScoreAvg >= 70) currentLevel = 4;
  else if (overallScoreAvg >= 55) currentLevel = 3;
  else if (overallScoreAvg >= 40) currentLevel = 2;

  const oldest = allReports[allReports.length - 1];
  const latest = allReports[0];
  const improvementSinceStart =
    n(latest.overall_score) - n(oldest.overall_score);

  const thirtyDaysAgo = new Date(
    Date.now() - 30 * 24 * 60 * 60 * 1000,
  ).toISOString();
  const reportsLast30 = allReports.filter((r) => r.created_at >= thirtyDaysAgo);
  let improvementLast30d: number | null = null;
  if (reportsLast30.length >= 2) {
    improvementLast30d =
      n(reportsLast30[0].overall_score) -
      n(reportsLast30[reportsLast30.length - 1].overall_score);
  }

  const dimensionDeltas: Array<{ dim: string; delta: number }> = [];
  for (const dim of DIMENSIONS) {
    const key = dim === "filler" ? "filler_score" : `${dim}_score`;
    dimensionDeltas.push({
      dim,
      delta:
        n((latest as Record<string, unknown>)[key]) -
        n((oldest as Record<string, unknown>)[key]),
    });
  }
  dimensionDeltas.sort((a, b) => b.delta - a.delta);

  const confidenceDelta =
    n(latest.confidence_score) - n(oldest.confidence_score);
  const fillerControlDelta =
    n(latest.filler_score) - n(oldest.filler_score);

  const sessionDates = [
    ...new Set(allSessions.map((s) => s.created_at.slice(0, 10))),
  ].sort((a, b) => b.localeCompare(a));

  const today = new Date().toISOString().slice(0, 10);
  const yesterday = new Date(Date.now() - 86400000).toISOString().slice(0, 10);

  let currentStreakDays = 0;
  if (sessionDates.length > 0) {
    if (sessionDates[0] === today || sessionDates[0] === yesterday) {
      let checkDate = new Date(sessionDates[0]);
      for (const d of sessionDates) {
        const expected = checkDate.toISOString().slice(0, 10);
        if (d === expected) {
          currentStreakDays++;
          checkDate = new Date(checkDate.getTime() - 86400000);
        } else if (d < expected) {
          break;
        }
      }
    }
  }

  let longestStreak = currentStreakDays;
  if (sessionDates.length > 1) {
    const sorted = [...sessionDates].sort();
    let streak = 1;
    for (let i = 1; i < sorted.length; i++) {
      const diffDays =
        (new Date(sorted[i]).getTime() - new Date(sorted[i - 1]).getTime()) /
        86400000;
      if (diffDays === 1) {
        streak++;
        longestStreak = Math.max(longestStreak, streak);
      } else {
        streak = 1;
      }
    }
  }

  let xpTotal = 0;
  for (let i = 0; i < allReports.length; i++) {
    const r = allReports[i];
    xpTotal += XP_PER_SESSION;
    if (n(r.overall_score) >= 85) xpTotal += XP_SCORE_ABOVE_85_BONUS;
    else if (n(r.overall_score) >= 70) xpTotal += XP_SCORE_ABOVE_70_BONUS;
    if (i < allReports.length - 1) {
      const improvement =
        n(r.overall_score) - n(allReports[i + 1].overall_score);
      if (improvement > 0) xpTotal += improvement * XP_PER_IMPROVEMENT_POINT;
    }
  }
  xpTotal += currentStreakDays * XP_PER_STREAK_DAY;

  const totalPracticeMinutes = Math.round(
    allSessions.reduce((s, sess) => s + n(sess.duration_seconds), 0) / 60,
  );
  const avgSessionDuration =
    allSessions.length > 0
      ? Math.round(
          allSessions.reduce((s, sess) => s + n(sess.duration_seconds), 0) /
            allSessions.length,
        )
      : null;

  const now = new Date();
  const weekStart = new Date(now);
  weekStart.setDate(now.getDate() - now.getDay());
  weekStart.setHours(0, 0, 0, 0);
  const monthStart = new Date(now.getFullYear(), now.getMonth(), 1);

  const sessionsThisWeek = allSessions.filter(
    (s) => new Date(s.created_at) >= weekStart,
  ).length;
  const sessionsThisMonth = allSessions.filter(
    (s) => new Date(s.created_at) >= monthStart,
  ).length;

  const modeCounts: Record<string, number> = {};
  for (const s of allSessions) modeCounts[s.mode] = (modeCounts[s.mode] ?? 0) + 1;
  const mostPracticedMode =
    Object.entries(modeCounts).sort((a, b) => b[1] - a[1])[0]?.[0] ?? null;

  const lastSessionDate = allSessions[0]?.created_at
    ? allSessions[0].created_at.slice(0, 10)
    : null;
  const daysSinceLastSession = lastSessionDate
    ? Math.floor((Date.now() - new Date(lastSessionDate).getTime()) / 86400000)
    : null;

  const strengthsCount: Record<string, number> = {};
  const weaknessesCount: Record<string, number> = {};
  for (const r of recentReports) {
    for (const s of ((r.strengths as string[]) ?? [])) {
      strengthsCount[s] = (strengthsCount[s] ?? 0) + 1;
    }
    for (const w of ((r.improvements as string[]) ?? [])) {
      weaknessesCount[w] = (weaknessesCount[w] ?? 0) + 1;
    }
  }
  const strengthsTags = Object.entries(strengthsCount)
    .sort((a, b) => b[1] - a[1])
    .slice(0, 5)
    .map(([t]) => t);
  const weaknessesTags = Object.entries(weaknessesCount)
    .sort((a, b) => b[1] - a[1])
    .slice(0, 5)
    .map(([t]) => t);

  const topStrengths = dimensionDeltas
    .filter((d) => d.delta > 0)
    .slice(0, 3)
    .map((d) => DIMENSION_LABELS[d.dim] ?? d.dim);
  const strengthsSummary =
    topStrengths.length > 0
      ? `Strongest growth in ${topStrengths.join(", ")}.`
      : null;

  const topWeaknesses = dimensionDeltas
    .filter((d) => d.delta <= 0)
    .slice(-3)
    .map((d) => DIMENSION_LABELS[d.dim] ?? d.dim);
  const weaknessesSummary =
    topWeaknesses.length > 0
      ? `Needs more practice with ${topWeaknesses.join(", ")}.`
      : null;

  await admin.from("learner_insights").upsert(
    {
      user_id: userId,
      overall_score_avg: overallScoreAvg,
      score_trend: scoreTrend,
      current_level: currentLevel,
      xp_total: xpTotal,
      current_streak_days: currentStreakDays,
      longest_streak_days: longestStreak,
      last_session_date: lastSessionDate,
      total_sessions: allSessions.length,
      total_practice_minutes: totalPracticeMinutes,
      sessions_this_week: sessionsThisWeek,
      sessions_this_month: sessionsThisMonth,
      avg_session_duration_s: avgSessionDuration,
      most_practiced_mode: mostPracticedMode,
      days_since_last_session: daysSinceLastSession,
      improvement_since_start: improvementSinceStart,
      improvement_last_30d: improvementLast30d,
      most_improved_dimension: dimensionDeltas[0]?.dim
        ? DIMENSION_LABELS[dimensionDeltas[0].dim]
        : null,
      most_improved_delta: dimensionDeltas[0]?.delta ?? null,
      second_improved_dimension: dimensionDeltas[1]?.dim
        ? DIMENSION_LABELS[dimensionDeltas[1].dim]
        : null,
      second_improved_delta: dimensionDeltas[1]?.delta ?? null,
      confidence_delta: confidenceDelta,
      filler_control_delta: fillerControlDelta,
      strengths_tags: strengthsTags,
      weaknesses_tags: weaknessesTags,
      strengths_summary: strengthsSummary,
      weaknesses_summary: weaknessesSummary,
      score_history: scoreHistory,
      next_recommended_lesson: latest.next_recommended_lesson ?? null,
      last_refreshed_at: new Date().toISOString(),
    },
    { onConflict: "user_id" },
  );
}
