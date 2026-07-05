// Daily lesson plan engine, ported from `koras-web/src/lib/daily-plan/*`
// (signals.ts, rules.ts, llm.ts, server.ts). The rules engine is
// deterministic and never fails; the LLM step (Modal /generate-daily-plan)
// only rewrites copy and reorders items behind a 9s timeout.

import type { SupabaseClient } from "https://esm.sh/@supabase/supabase-js@2.45.4";
import { listAccessibleProgramIds } from "./programs.ts";
import { modalDailyPlanBaseUrl, modalUrl } from "./modal.ts";

type ProgramId = "ai-tutor" | "ielts-speaking" | "interview-prep";
type ItemStatus = "pending" | "completed" | "skipped";
type ItemType = "program_session" | "review" | "reflection" | "streak_save";

interface PlanItem {
  item_id: string;
  type: ItemType;
  program_id: ProgramId;
  route: string;
  title: string;
  reason: string;
  estimated_minutes: number;
  priority: 1 | 2 | 3;
  status: ItemStatus;
  completed_at: string | null;
}

interface RulesPlan {
  summary: string;
  focus_area: string;
  advice: string;
  items: PlanItem[];
}

interface Signals {
  learnerInsights: Record<string, unknown> | null;
  ieltsProgress: Record<string, unknown> | null;
  interviewProgress: Record<string, unknown> | null;
  onboarding: Record<string, unknown> | null;
  accessibleProgramIds: string[];
  practicedLast24h: { aiTutor: boolean; ielts: boolean; interviewPrep: boolean };
}

type NormalizedSkill =
  | "fluency"
  | "clarity"
  | "confidence"
  | "grammar"
  | "vocabulary"
  | "filler_control"
  | "structure"
  | "relevance"
  | "pronunciation"
  | "pace";

const ONE_DAY_MS = 24 * 60 * 60 * 1000;
const V1_ALLOWED = new Set<string>(["ai-tutor", "ielts-speaking", "interview-prep"]);
const ROUTE_BY_PROGRAM: Record<ProgramId, string> = {
  "ai-tutor": "/ai-tutor",
  "ielts-speaking": "/ielts",
  "interview-prep": "/interview-prep",
};

// ---------------------------------------------------------------------------
//  Signals
// ---------------------------------------------------------------------------

async function getSignals(
  admin: SupabaseClient,
  userScoped: SupabaseClient,
  userId: string,
): Promise<Signals> {
  const since24h = new Date(Date.now() - ONE_DAY_MS).toISOString();
  const [
    { data: learnerInsights },
    { data: onboarding },
    { data: ieltsProgress },
    { data: interviewProgress },
    { data: tutorRecent },
    { data: ieltsRecent },
    { data: interviewRecent },
  ] = await Promise.all([
    admin.from("learner_insights").select("*").eq("user_id", userId).maybeSingle(),
    admin
      .from("onboarding_responses")
      .select("goal, goals, biggest_challenge, interested_program, completed_at")
      .eq("user_id", userId)
      .maybeSingle(),
    admin.from("ielts_user_progress").select("*").eq("user_id", userId).maybeSingle(),
    admin
      .from("interview_prep_user_progress")
      .select("*")
      .eq("user_id", userId)
      .maybeSingle(),
    admin
      .from("ai_tutor_sessions")
      .select("id")
      .eq("user_id", userId)
      .gte("created_at", since24h)
      .limit(1),
    admin
      .from("ielts_lesson_attempts")
      .select("id")
      .eq("user_id", userId)
      .gte("created_at", since24h)
      .limit(1),
    admin
      .from("interview_prep_attempts")
      .select("id")
      .eq("user_id", userId)
      .gte("created_at", since24h)
      .limit(1),
  ]);

  const accessibleProgramIds = await listAccessibleProgramIds(userScoped, userId);
  const allowed = accessibleProgramIds.filter((id) => V1_ALLOWED.has(id));

  return {
    learnerInsights: learnerInsights ?? null,
    ieltsProgress: ieltsProgress ?? null,
    interviewProgress: interviewProgress ?? null,
    onboarding: onboarding ?? null,
    accessibleProgramIds: allowed,
    practicedLast24h: {
      aiTutor: (tutorRecent?.length ?? 0) > 0,
      ielts: (ieltsRecent?.length ?? 0) > 0,
      interviewPrep: (interviewRecent?.length ?? 0) > 0,
    },
  };
}

async function computeSourceHash(signals: Signals): Promise<string> {
  const li = (signals.learnerInsights ?? {}) as Record<string, unknown>;
  const ip = (signals.ieltsProgress ?? {}) as Record<string, unknown>;
  const ipp = (signals.interviewProgress ?? {}) as Record<string, unknown>;
  const ob = (signals.onboarding ?? {}) as Record<string, unknown>;
  const stable = {
    li_last_session_date: li.last_session_date ?? null,
    li_total_sessions: li.total_sessions ?? null,
    li_days_since_last: li.days_since_last_session ?? null,
    ielts_last_practiced: ip.last_practiced_at ?? null,
    interview_last_practiced: ipp.last_practiced_at ?? null,
    onboarding_completed_at: ob.completed_at ?? null,
    accessible: [...signals.accessibleProgramIds].sort(),
  };
  const data = new TextEncoder().encode(JSON.stringify(stable));
  const digest = await crypto.subtle.digest("SHA-256", data);
  return [...new Uint8Array(digest)]
    .map((b) => b.toString(16).padStart(2, "0"))
    .join("")
    .slice(0, 32);
}

// ---------------------------------------------------------------------------
//  Rules engine
// ---------------------------------------------------------------------------

function num(raw: unknown): number | null {
  if (typeof raw === "number" && Number.isFinite(raw)) return raw;
  if (typeof raw === "string") {
    const p = Number(raw);
    if (Number.isFinite(p)) return p;
  }
  return null;
}

type Goals = { hasInterviewGoal: boolean; isExamPrep: boolean; challenge: string | null };

function parseGoals(onboarding: Record<string, unknown> | null): Goals {
  if (!onboarding) return { hasInterviewGoal: false, isExamPrep: false, challenge: null };
  const goalsArr = Array.isArray(onboarding.goals)
    ? (onboarding.goals as unknown[]).filter((v): v is string => typeof v === "string")
    : [];
  const legacyGoal = typeof onboarding.goal === "string" ? onboarding.goal : null;
  const interested =
    typeof onboarding.interested_program === "string"
      ? onboarding.interested_program
      : null;
  const challenge =
    typeof onboarding.biggest_challenge === "string"
      ? onboarding.biggest_challenge
      : null;
  return {
    hasInterviewGoal:
      goalsArr.includes("interview_prep") ||
      legacyGoal === "interview_prep" ||
      interested === "interview_prep",
    isExamPrep: interested === "exam_prep",
    challenge,
  };
}

function friendlyChallenge(challenge: string): string {
  switch (challenge) {
    case "fillers":
      return "filler words";
    case "pace":
      return "pacing";
    case "clarity":
      return "clarity";
    case "confidence":
      return "confidence";
    case "monotone":
      return "tone variation";
    case "accent":
      return "accent clarity";
    default:
      return "speaking goals";
  }
}

function makeItem(args: {
  type: ItemType;
  program_id: ProgramId;
  title: string;
  reason: string;
  estimated_minutes: number;
  priority: 1 | 2 | 3;
}): PlanItem {
  return {
    item_id: crypto.randomUUID(),
    type: args.type,
    program_id: args.program_id,
    route: ROUTE_BY_PROGRAM[args.program_id],
    title: args.title,
    reason: args.reason,
    estimated_minutes: args.estimated_minutes,
    priority: args.priority,
    status: "pending",
    completed_at: null,
  };
}

function wrapEmpty(items: PlanItem[], focus: string, summary: string, advice: string): RulesPlan {
  return { summary, focus_area: focus, advice, items };
}

type SkillScore = { skill: NormalizedSkill; score: number };

function pushIf(out: SkillScore[], raw: unknown, skill: NormalizedSkill) {
  const score = num(raw);
  if (score === null) return;
  out.push({ skill, score });
}

function mapIeltsCriterionToSkill(criterion: string): NormalizedSkill | null {
  const n = criterion.toLowerCase();
  if (n.includes("fluency")) return "fluency";
  if (n.includes("lexical") || n.includes("vocab")) return "vocabulary";
  if (n.includes("grammar")) return "grammar";
  if (n.includes("pronunciation")) return "pronunciation";
  return null;
}

function findWeakestSkill(
  li: Record<string, unknown>,
  ielts: Record<string, unknown>,
  interview: Record<string, unknown>,
): SkillScore | null {
  const c: SkillScore[] = [];
  pushIf(c, li.fluency_score, "fluency");
  pushIf(c, li.clarity_score, "clarity");
  pushIf(c, li.confidence_score, "confidence");
  pushIf(c, li.grammar_score, "grammar");
  pushIf(c, li.tense_score, "grammar");
  pushIf(c, li.vocabulary_score, "vocabulary");
  pushIf(c, li.filler_score, "filler_control");
  pushIf(c, li.eloquence_score, "structure");
  pushIf(c, li.relevance_score, "relevance");
  const weakestIelts = ielts.weakest_criterion;
  if (typeof weakestIelts === "string") {
    const skill = mapIeltsCriterionToSkill(weakestIelts);
    if (skill) c.push({ skill, score: 50 });
  }
  const ipScore = num(interview.latest_overall_score);
  if (ipScore !== null) c.push({ skill: "structure", score: ipScore });
  if (c.length === 0) return null;
  c.sort((a, b) => a.score - b.score);
  return c[0];
}

function priorityFromScore(score: number): 1 | 2 | 3 {
  if (score < 50) return 1;
  if (score < 70) return 2;
  return 3;
}

function pickProgramForSkill(
  skill: NormalizedSkill,
  goals: Goals,
  accessible: Set<string>,
): ProgramId | null {
  const tryOrder = (preferred: ProgramId[]) => {
    for (const id of preferred) if (accessible.has(id)) return id;
    return null;
  };
  switch (skill) {
    case "filler_control":
      return tryOrder(["ai-tutor"]);
    case "confidence":
      return goals.hasInterviewGoal
        ? tryOrder(["interview-prep", "ai-tutor"])
        : tryOrder(["ai-tutor", "interview-prep"]);
    case "pronunciation":
    case "vocabulary":
    case "grammar":
      return tryOrder(["ielts-speaking", "ai-tutor"]);
    case "structure":
      return goals.hasInterviewGoal
        ? tryOrder(["interview-prep", "ai-tutor"])
        : tryOrder(["ai-tutor", "interview-prep"]);
    case "relevance":
      return tryOrder(["interview-prep", "ai-tutor"]);
    default:
      return tryOrder(["ai-tutor"]);
  }
}

function titleForSkill(skill: NormalizedSkill, program: ProgramId): string {
  const verb = program === "ielts-speaking" ? "Sharpen" : "Work on";
  const subject: Record<NormalizedSkill, string> = {
    fluency: "your fluency",
    clarity: "your clarity",
    confidence: "your confidence",
    grammar: "your grammar",
    vocabulary: "your vocabulary",
    filler_control: "filler control",
    structure: "answer structure",
    relevance: "answer relevance",
    pronunciation: "pronunciation",
    pace: "your pace",
  };
  return `${verb} ${subject[skill]}`;
}

function reasonForSkill(skill: NormalizedSkill, score: number): string {
  const band =
    score < 50 ? "scoring lowest" : score < 70 ? "trending behind your stronger areas" : "your stretch goal";
  const friendly: Record<NormalizedSkill, string> = {
    fluency: "Fluency is",
    clarity: "Clarity is",
    confidence: "Confidence is",
    grammar: "Grammar is",
    vocabulary: "Vocabulary is",
    filler_control: "Filler control is",
    structure: "Structure is",
    relevance: "Relevance is",
    pronunciation: "Pronunciation is",
    pace: "Pace is",
  };
  return `${friendly[skill]} ${band} (${Math.round(score)}/100).`;
}

function prettyCriterion(criterion: string): string {
  return criterion.replace(/_/g, " ").replace(/\b\w/g, (c) => c.toUpperCase());
}

function pickStarter(goals: Goals, accessible: Set<string>): ProgramId | null {
  if (goals.isExamPrep && accessible.has("ielts-speaking")) return "ielts-speaking";
  if (goals.hasInterviewGoal && accessible.has("interview-prep")) return "interview-prep";
  if (accessible.has("ai-tutor")) return "ai-tutor";
  return null;
}

function starterTitle(id: ProgramId): string {
  if (id === "ielts-speaking") return "Take an IELTS Speaking baseline";
  if (id === "interview-prep") return "Run a baseline interview answer";
  return "Start with your baseline speaking check";
}

function starterReason(id: ProgramId, goals: Goals): string {
  if (id === "ielts-speaking")
    return "You picked exam prep — one IELTS attempt gives us a band to work from.";
  if (id === "interview-prep")
    return "You're aiming for interviews — one answer tells us where to start.";
  if (goals.challenge)
    return `Koras needs one speaking sample to target your ${friendlyChallenge(goals.challenge)}.`;
  return "Koras needs one speaking sample to personalize your plan.";
}

function buildNewUserPlan(
  onboarding: Record<string, unknown> | null,
  goals: Goals,
  accessible: Set<string>,
): RulesPlan {
  if (!onboarding && accessible.has("ai-tutor")) {
    return wrapEmpty(
      [
        makeItem({
          type: "program_session",
          program_id: "ai-tutor",
          title: "Start with your baseline speaking check",
          reason: "Koras needs one speaking sample to personalize your plan.",
          estimated_minutes: 5,
          priority: 1,
        }),
      ],
      "baseline",
      "We'll calibrate your plan after one short speaking sample.",
      "Open AI Tutor and answer the prompt naturally — even 2 minutes is enough to get a personalized plan tomorrow.",
    );
  }
  const programId = pickStarter(goals, accessible);
  if (!programId) {
    return wrapEmpty(
      [],
      "onboarding",
      "Finish onboarding so Koras can pick the right starting point.",
      "Tell us your goal and main challenge — your first plan unlocks right after.",
    );
  }
  return wrapEmpty(
    [
      makeItem({
        type: "program_session",
        program_id: programId,
        title: starterTitle(programId),
        reason: starterReason(programId, goals),
        estimated_minutes: programId === "ai-tutor" ? 5 : 15,
        priority: 1,
      }),
    ],
    "baseline",
    "Your first session will calibrate the plan from tomorrow.",
    "Aim for one focused attempt — quality beats quantity on day one.",
  );
}

function finalizePlan(items: PlanItem[], accessible: Set<string>): PlanItem[] {
  const allowed = items
    .filter((it) => accessible.has(it.program_id))
    .filter((it) => Boolean(it.route));
  const byProgram = new Map<ProgramId, PlanItem>();
  for (const item of allowed) {
    const existing = byProgram.get(item.program_id);
    if (!existing || item.priority < existing.priority) {
      byProgram.set(item.program_id, item);
    }
  }
  const deduped = Array.from(byProgram.values());
  deduped.sort((a, b) => a.priority - b.priority);
  return deduped.slice(0, 3);
}

function deriveFocusFromItems(items: PlanItem[]): string | null {
  if (items.length === 0) return null;
  const top = items[0].program_id;
  if (top === "ielts-speaking") return "ielts speaking";
  if (top === "interview-prep") return "interview structure";
  return "fluency";
}

function buildSummary(items: PlanItem[], focusArea: string | null, signals: Signals): string {
  if (items.length === 0) return "Finish setup and we'll have a plan ready for you.";
  const li = (signals.learnerInsights ?? {}) as Record<string, unknown>;
  const streak = num(li.current_streak_days) ?? 0;
  const focus = focusArea ? focusArea.replace(/_/g, " ") : "speaking";
  if (streak > 0) return `${streak}-day streak going — focus on ${focus} for the next 24 hours.`;
  return `Today's focus: ${focus}. Three short reps to keep momentum.`;
}

function buildAdvice(items: PlanItem[], focusArea: string | null, signals: Signals): string {
  if (items.length === 0) return "";
  const li = (signals.learnerInsights ?? {}) as Record<string, unknown>;
  const trend = li.score_trend;
  const focus = focusArea ? focusArea.replace(/_/g, " ") : "your top priority";
  if (trend === "declining")
    return `Your trend has dipped recently — slowing down on ${focus} is the fastest way back. Take it one item at a time.`;
  if (trend === "improving")
    return `You're trending up. Keep the streak honest by leaning into ${focus} today.`;
  return `Pick the priority-1 item first — it's targeted at ${focus}. The rest are stretch reps if you have time.`;
}

function generateRulesPlan(signals: Signals): RulesPlan {
  const accessible = new Set(signals.accessibleProgramIds);
  const li = (signals.learnerInsights ?? {}) as Record<string, unknown>;
  const ielts = (signals.ieltsProgress ?? {}) as Record<string, unknown>;
  const interview = (signals.interviewProgress ?? {}) as Record<string, unknown>;
  const onboarding = signals.onboarding ?? null;
  const goals = parseGoals(onboarding);

  const hasAnyHistory =
    !!signals.learnerInsights || !!signals.ieltsProgress || !!signals.interviewProgress;
  if (!hasAnyHistory) return buildNewUserPlan(onboarding, goals, accessible);

  const items: PlanItem[] = [];
  let focusArea: string | null = null;

  const streak = num(li.current_streak_days) ?? 0;
  const practicedAny =
    signals.practicedLast24h.aiTutor ||
    signals.practicedLast24h.ielts ||
    signals.practicedLast24h.interviewPrep;
  if (streak > 0 && !practicedAny && accessible.has("ai-tutor")) {
    items.push(
      makeItem({
        type: "streak_save",
        program_id: "ai-tutor",
        title: "Keep your speaking habit alive",
        reason: `You're on a ${streak}-day streak — a quick session keeps it going.`,
        estimated_minutes: 5,
        priority: 1,
      }),
    );
  }

  const weakness = findWeakestSkill(li, ielts, interview);
  if (weakness) {
    focusArea = weakness.skill;
    const programForSkill = pickProgramForSkill(weakness.skill, goals, accessible);
    if (programForSkill) {
      const priority = priorityFromScore(weakness.score);
      items.push(
        makeItem({
          type: priority === 3 ? "review" : "program_session",
          program_id: programForSkill,
          title: titleForSkill(weakness.skill, programForSkill),
          reason: reasonForSkill(weakness.skill, weakness.score),
          estimated_minutes: programForSkill === "ai-tutor" ? 10 : 15,
          priority,
        }),
      );
    }
  }

  if (
    signals.ieltsProgress &&
    ielts.current_lesson_id &&
    !signals.practicedLast24h.ielts &&
    accessible.has("ielts-speaking")
  ) {
    items.push(
      makeItem({
        type: "program_session",
        program_id: "ielts-speaking",
        title: "Continue your IELTS lesson",
        reason: ielts.weakest_criterion
          ? `Pick up where you left off and tighten ${prettyCriterion(String(ielts.weakest_criterion))}.`
          : "Pick up where you left off in your current IELTS lesson.",
        estimated_minutes: 15,
        priority: 2,
      }),
    );
  }

  if (
    signals.interviewProgress &&
    !signals.practicedLast24h.interviewPrep &&
    accessible.has("interview-prep")
  ) {
    const totalAttempts = num(interview.total_attempts) ?? 0;
    items.push(
      makeItem({
        type: "program_session",
        program_id: "interview-prep",
        title: "Practice an interview answer",
        reason:
          totalAttempts > 0
            ? "Run another scenario answer to build on your last session."
            : "Try one warm-up question to get your interview reps in.",
        estimated_minutes: 10,
        priority: 2,
      }),
    );
  }

  if (
    goals.hasInterviewGoal &&
    accessible.has("interview-prep") &&
    (num(interview.total_attempts) ?? 0) < 3
  ) {
    items.push(
      makeItem({
        type: "program_session",
        program_id: "interview-prep",
        title: "Build your interview foundation",
        reason: "You're aiming for interviews — early reps pay the most.",
        estimated_minutes: 10,
        priority: 2,
      }),
    );
  }
  if (goals.isExamPrep && accessible.has("ielts-speaking") && !signals.ieltsProgress) {
    items.push(
      makeItem({
        type: "program_session",
        program_id: "ielts-speaking",
        title: "Start IELTS Speaking practice",
        reason: "You picked exam prep — a baseline IELTS attempt sets your benchmark.",
        estimated_minutes: 15,
        priority: 2,
      }),
    );
  }

  const final = finalizePlan(items, accessible);
  if (final.length === 0 && accessible.has("ai-tutor")) {
    final.push(
      makeItem({
        type: "program_session",
        program_id: "ai-tutor",
        title: "Quick speaking check-in",
        reason: "A short session keeps your skills sharp.",
        estimated_minutes: 5,
        priority: 2,
      }),
    );
  }

  return {
    summary: buildSummary(final, focusArea, signals),
    focus_area: focusArea ?? deriveFocusFromItems(final) ?? "general",
    advice: buildAdvice(final, focusArea, signals),
    items: final,
  };
}

// ---------------------------------------------------------------------------
//  LLM enrichment (Modal /generate-daily-plan, 9s timeout, validated)
// ---------------------------------------------------------------------------

const MODAL_TIMEOUT_MS = 9000;
const ALLOWED_ITEM_TYPES = new Set(["program_session", "review", "reflection", "streak_save"]);

function strOr(raw: unknown, fallback: string): string {
  if (typeof raw === "string" && raw.trim().length > 0) return raw.trim();
  return fallback;
}

function clampMinutes(raw: unknown, fallback?: PlanItem): number {
  const fb = fallback?.estimated_minutes ?? 10;
  const parsed = typeof raw === "number" ? raw : Number(raw);
  if (!Number.isFinite(parsed) || parsed <= 0) return fb;
  return Math.max(2, Math.min(45, Math.round(parsed)));
}

function clampPriority(raw: unknown, fallback?: PlanItem): 1 | 2 | 3 {
  const fb = fallback?.priority ?? 2;
  const parsed = typeof raw === "number" ? raw : Number(raw);
  if (!Number.isFinite(parsed)) return fb;
  if (parsed <= 1) return 1;
  if (parsed >= 3) return 3;
  return 2;
}

function validateItem(
  raw: unknown,
  accessible: Set<string>,
  fallbackItems: PlanItem[],
): PlanItem | null {
  if (!raw || typeof raw !== "object") return null;
  const obj = raw as Record<string, unknown>;
  const programId = obj.program_id;
  if (
    typeof programId !== "string" ||
    !(programId in ROUTE_BY_PROGRAM) ||
    !accessible.has(programId)
  ) {
    return null;
  }
  const route =
    typeof obj.route === "string" && obj.route.startsWith("/")
      ? obj.route
      : ROUTE_BY_PROGRAM[programId as ProgramId];
  if (!route) return null;
  const fallback = fallbackItems.find((i) => i.program_id === programId);
  const itemId =
    typeof obj.item_id === "string" && obj.item_id.length > 0
      ? obj.item_id
      : fallback?.item_id ?? crypto.randomUUID();
  const type =
    typeof obj.type === "string" && ALLOWED_ITEM_TYPES.has(obj.type)
      ? (obj.type as ItemType)
      : fallback?.type ?? "program_session";
  const title = strOr(obj.title, fallback?.title ?? "").slice(0, 120);
  const reason = strOr(obj.reason, fallback?.reason ?? "").slice(0, 280);
  if (!title || !reason) return null;
  const status =
    obj.status === "completed" || obj.status === "skipped"
      ? (obj.status as ItemStatus)
      : "pending";
  return {
    item_id: itemId,
    type,
    program_id: programId as ProgramId,
    route,
    title,
    reason,
    estimated_minutes: clampMinutes(obj.estimated_minutes, fallback),
    priority: clampPriority(obj.priority, fallback),
    status,
    completed_at:
      typeof obj.completed_at === "string" && status === "completed"
        ? obj.completed_at
        : null,
  };
}

function validateLLMResponse(raw: unknown, fallback: RulesPlan, signals: Signals): RulesPlan | null {
  if (!raw || typeof raw !== "object") return null;
  const obj = raw as Record<string, unknown>;
  const summary = strOr(obj.summary, fallback.summary).slice(0, 500);
  const focus = strOr(obj.focus_area, fallback.focus_area).slice(0, 80);
  const advice = strOr(obj.advice, fallback.advice).slice(0, 800);
  const itemsRaw = Array.isArray(obj.items) ? obj.items : [];
  const accessible = new Set(signals.accessibleProgramIds);
  const items: PlanItem[] = [];
  for (const c of itemsRaw) {
    if (items.length >= 3) break;
    const v = validateItem(c, accessible, fallback.items);
    if (v) items.push(v);
  }
  if (items.length === 0) return null;
  return { summary, focus_area: focus, advice, items };
}

async function enrichWithLLM(
  userId: string,
  signals: Signals,
  rulesPlan: RulesPlan,
): Promise<{ plan: RulesPlan; error: string | null }> {
  if (rulesPlan.items.length < 2) return { plan: rulesPlan, error: null };
  if (signals.accessibleProgramIds.length === 0) return { plan: rulesPlan, error: null };

  const base = modalDailyPlanBaseUrl();
  if (!base) return { plan: rulesPlan, error: "modal_url_missing" };

  const controller = new AbortController();
  const timer = setTimeout(() => controller.abort(), MODAL_TIMEOUT_MS);
  try {
    const res = await fetch(modalUrl(base, "/generate-daily-plan"), {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        user_id: userId,
        signals: {
          learner_insights: signals.learnerInsights,
          ielts_progress: signals.ieltsProgress,
          interview_progress: signals.interviewProgress,
          onboarding: signals.onboarding,
          accessible_program_ids: signals.accessibleProgramIds,
          practiced_last_24h: signals.practicedLast24h,
        },
        rules_plan: rulesPlan,
      }),
      signal: controller.signal,
    });
    clearTimeout(timer);
    if (!res.ok) return { plan: rulesPlan, error: `modal_status_${res.status}` };
    const data = (await res.json()) as unknown;
    const validated = validateLLMResponse(data, rulesPlan, signals);
    if (!validated) return { plan: rulesPlan, error: "llm_validation_failed" };
    return { plan: validated, error: null };
  } catch (err) {
    clearTimeout(timer);
    const message =
      err instanceof Error
        ? err.name === "AbortError"
          ? "modal_timeout"
          : err.message
        : "modal_unknown";
    return { plan: rulesPlan, error: message };
  }
}

// ---------------------------------------------------------------------------
//  Orchestration
// ---------------------------------------------------------------------------

function normalizePlanRow(row: Record<string, unknown>): Record<string, unknown> {
  const items = Array.isArray(row.items) ? row.items : [];
  return {
    id: String(row.id),
    user_id: String(row.user_id),
    generated_at: String(row.generated_at),
    expires_at: String(row.expires_at),
    regenerated_at: row.regenerated_at ? String(row.regenerated_at) : null,
    generator_version: String(row.generator_version ?? "v1"),
    source_hash: row.source_hash ? String(row.source_hash) : null,
    generation_source: row.generation_source ?? "lazy_dashboard",
    generation_error: row.generation_error ? String(row.generation_error) : null,
    status: row.status ?? "active",
    summary: row.summary ? String(row.summary) : null,
    focus_area: row.focus_area ? String(row.focus_area) : null,
    advice: row.advice ? String(row.advice) : null,
    source_signals: row.source_signals ?? {},
    items,
    completed_count: Number(row.completed_count ?? 0),
    total_items: Number(row.total_items ?? (items as unknown[]).length),
    created_at: String(row.created_at ?? row.generated_at),
    updated_at: String(row.updated_at ?? row.generated_at),
  };
}

function serializeSignalsForStorage(signals: Signals): Record<string, unknown> {
  const li = signals.learnerInsights as Record<string, unknown> | null;
  return {
    accessible_program_ids: signals.accessibleProgramIds,
    practiced_last_24h: signals.practicedLast24h,
    onboarding: signals.onboarding ?? null,
    ielts_progress: signals.ieltsProgress ?? null,
    interview_progress: signals.interviewProgress ?? null,
    learner_insights_summary: li
      ? {
          overall_score_avg: li.overall_score_avg ?? null,
          score_trend: li.score_trend ?? null,
          current_streak_days: li.current_streak_days ?? null,
          total_sessions: li.total_sessions ?? null,
          days_since_last_session: li.days_since_last_session ?? null,
          weaknesses_tags: li.weaknesses_tags ?? null,
          strengths_tags: li.strengths_tags ?? null,
        }
      : null,
  };
}

async function generatePlanForUser(
  admin: SupabaseClient,
  userScoped: SupabaseClient,
  userId: string,
  source: string,
): Promise<Record<string, unknown> | null> {
  const signals = await getSignals(admin, userScoped, userId);
  const rulesPlan = generateRulesPlan(signals);
  const sourceHash = await computeSourceHash(signals);
  const enrichment = await enrichWithLLM(userId, signals, rulesPlan);
  const finalPlan = enrichment.plan;

  const totalItems = finalPlan.items.length;
  const completedCount = finalPlan.items.filter((i) => i.status === "completed").length;
  const generatedAt = new Date();
  const expiresAt = new Date(generatedAt.getTime() + ONE_DAY_MS);

  const insert = await admin
    .from("daily_lesson_plans")
    .insert({
      user_id: userId,
      generated_at: generatedAt.toISOString(),
      expires_at: expiresAt.toISOString(),
      generator_version: "v1",
      source_hash: sourceHash,
      generation_source: source,
      generation_error: enrichment.error,
      status: "active",
      summary: finalPlan.summary,
      focus_area: finalPlan.focus_area,
      advice: finalPlan.advice,
      source_signals: serializeSignalsForStorage(signals),
      items: finalPlan.items,
      completed_count: completedCount,
      total_items: totalItems,
    })
    .select("*")
    .maybeSingle();

  if (insert.error) {
    const { data: existing } = await admin
      .from("daily_lesson_plans")
      .select("*")
      .eq("user_id", userId)
      .eq("status", "active")
      .order("generated_at", { ascending: false })
      .limit(1)
      .maybeSingle();
    if (existing) return normalizePlanRow(existing);
    console.error("[daily-plan] insert failed:", insert.error.message);
    return null;
  }
  return insert.data ? normalizePlanRow(insert.data) : null;
}

export async function getOrGenerateCurrentPlan(
  admin: SupabaseClient,
  userScoped: SupabaseClient,
  userId: string,
): Promise<Record<string, unknown> | null> {
  const { data: activeRow } = await admin
    .from("daily_lesson_plans")
    .select("*")
    .eq("user_id", userId)
    .eq("status", "active")
    .order("generated_at", { ascending: false })
    .limit(1)
    .maybeSingle();

  if (activeRow) {
    const expiresMs = new Date(activeRow.expires_at).getTime();
    if (Number.isFinite(expiresMs) && expiresMs > Date.now()) {
      return normalizePlanRow(activeRow);
    }
    await admin
      .from("daily_lesson_plans")
      .update({ status: "superseded" })
      .eq("id", activeRow.id)
      .eq("status", "active");
  }
  return generatePlanForUser(admin, userScoped, userId, "lazy_dashboard");
}

export async function markDailyPlanItemStatus(params: {
  admin: SupabaseClient;
  userId: string;
  planId: string | null;
  itemId: string;
  status: ItemStatus;
}): Promise<Record<string, unknown> | null> {
  const { admin, userId, itemId, status } = params;

  // The mobile client sends only { itemId, status }; resolve the active
  // plan when no planId is provided.
  let row: Record<string, unknown> | null = null;
  if (params.planId) {
    const { data } = await admin
      .from("daily_lesson_plans")
      .select("*")
      .eq("id", params.planId)
      .eq("user_id", userId)
      .maybeSingle();
    row = (data as Record<string, unknown>) ?? null;
  } else {
    const { data } = await admin
      .from("daily_lesson_plans")
      .select("*")
      .eq("user_id", userId)
      .eq("status", "active")
      .order("generated_at", { ascending: false })
      .limit(1)
      .maybeSingle();
    row = (data as Record<string, unknown>) ?? null;
  }
  if (!row) return null;

  const items = (Array.isArray(row.items) ? row.items : []) as PlanItem[];
  let mutated = false;
  const nextItems = items.map((item) => {
    if (item.item_id !== itemId) return item;
    mutated = true;
    return {
      ...item,
      status,
      completed_at: status === "completed" ? new Date().toISOString() : null,
    };
  });
  if (!mutated) return normalizePlanRow(row);

  const completedCount = nextItems.filter((i) => i.status === "completed").length;
  const { data: updated } = await admin
    .from("daily_lesson_plans")
    .update({
      items: nextItems,
      completed_count: completedCount,
      total_items: nextItems.length,
    })
    .eq("id", row.id as string)
    .eq("user_id", userId)
    .select("*")
    .maybeSingle();
  if (!updated) return null;
  return normalizePlanRow(updated);
}
