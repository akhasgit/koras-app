// interview-prep-generate-questions — generate a question bank for a
// scenario via Modal /generate-interview-questions, with a default
// fallback. Body: { scenarioId, jobDescription? }
//   → { questions, extractedContext?, warning? }

import { handlePreflight, json, error } from "../_shared/cors.ts";
import { requireUser } from "../_shared/auth.ts";
import { hasProgramAccess } from "../_shared/programs.ts";
import { modalBaseUrl, modalUrl } from "../_shared/modal.ts";
import {
  INTERVIEW_PROGRAM_ID,
  DEFAULT_INTERVIEW_QUESTIONS,
  normalizeQuestionsField,
} from "../_shared/interview.ts";

Deno.serve(async (req) => {
  const pre = handlePreflight(req);
  if (pre) return pre;

  const auth = await requireUser(req);
  if (auth.error) return auth.error;
  if (!(await hasProgramAccess(auth.supabase, auth.user.id, INTERVIEW_PROGRAM_ID))) {
    return error("Forbidden", 403);
  }

  let body: { scenarioId?: string; jobDescription?: string };
  try {
    body = await req.json();
  } catch {
    return error("Invalid JSON", 400);
  }

  // Load scenario context (the mobile client passes scenarioId).
  let title: string | null = null;
  let jobRole: string | null = null;
  let company: string | null = null;
  let description: string | null = body.jobDescription?.trim() || null;
  if (body.scenarioId) {
    const { data: scenario } = await auth.supabase
      .from("interview_prep_scenarios")
      .select("title, job_role, company, description, job_description")
      .eq("id", body.scenarioId)
      .maybeSingle();
    if (scenario) {
      title = scenario.title ?? null;
      jobRole = scenario.job_role ?? null;
      company = scenario.company ?? null;
      description =
        description ?? scenario.description ?? scenario.job_description ?? null;
    }
  }

  const base = modalBaseUrl();
  if (!base) {
    return json({
      questions: DEFAULT_INTERVIEW_QUESTIONS,
      extractedContext: {},
      warning:
        "Question generation isn't configured on this environment. Showing default questions.",
    });
  }

  const payload = {
    title,
    jobRole,
    company,
    interviewType: "general",
    experienceLevel: null,
    description,
    notes: null,
  };

  let response: Response;
  try {
    response = await fetch(modalUrl(base, "/generate-interview-questions"), {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(payload),
    });
  } catch (err) {
    console.error("[interview-prep-generate-questions] modal call failed", err);
    return json({
      questions: DEFAULT_INTERVIEW_QUESTIONS,
      extractedContext: {},
      warning:
        "We couldn't reach the question generator. Showing default questions — you can edit them and save.",
    });
  }

  if (!response.ok) {
    return json({
      questions: DEFAULT_INTERVIEW_QUESTIONS,
      extractedContext: {},
      warning:
        "Question generation failed. Showing default questions — you can still edit and save.",
    });
  }

  let data: { questions?: unknown; extractedContext?: unknown; warning?: string | null };
  try {
    data = (await response.json()) as typeof data;
  } catch {
    return json({
      questions: DEFAULT_INTERVIEW_QUESTIONS,
      extractedContext: {},
      warning: "Question generator returned an unexpected response.",
    });
  }

  const normalized = normalizeQuestionsField(data.questions);
  const questions = normalized.length > 0 ? normalized : DEFAULT_INTERVIEW_QUESTIONS;
  const extractedContext =
    data.extractedContext && typeof data.extractedContext === "object"
      ? data.extractedContext
      : {};

  return json({
    questions,
    extractedContext,
    warning: typeof data.warning === "string" && data.warning ? data.warning : null,
  });
});
