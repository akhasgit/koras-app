// interview-prep-analyze — analyze an uploaded interview attempt.
// Body: { attemptId } → { attempt }  (409 when too many analyses in flight).
// Ported from `koras-web/.../interview-prep/attempt/analyze/route.ts`.

import { handlePreflight, json, error } from "../_shared/cors.ts";
import { requireUser } from "../_shared/auth.ts";
import { hasProgramAccess } from "../_shared/programs.ts";
import {
  INTERVIEW_PROGRAM_ID,
  userHasTooManyActiveAnalyses,
  runInterviewAnalysis,
} from "../_shared/interview.ts";

const UUID_RE = /^[0-9a-f-]{36}$/i;

Deno.serve(async (req) => {
  const pre = handlePreflight(req);
  if (pre) return pre;

  const auth = await requireUser(req);
  if (auth.error) return auth.error;
  if (!(await hasProgramAccess(auth.supabase, auth.user.id, INTERVIEW_PROGRAM_ID))) {
    return error("Forbidden", 403);
  }

  let body: { attemptId?: string };
  try {
    body = await req.json();
  } catch {
    return error("Invalid JSON", 400);
  }

  const attemptId = body.attemptId ?? "";
  if (!UUID_RE.test(attemptId)) return error("Invalid attemptId", 400);

  const { data: attemptRow } = await auth.supabase
    .from("interview_prep_attempts")
    .select("*")
    .eq("id", attemptId)
    .maybeSingle();
  if (!attemptRow || attemptRow.user_id !== auth.user.id) {
    return error("Attempt not found.", 404);
  }

  if (attemptRow.recording_upload_status !== "uploaded") {
    return error("Recording is not available yet. Please re-record the answer.", 400);
  }

  // Server-side concurrency cap. The mobile client treats 409 as a signal
  // to queue and retry (see doc 08 / doc 15).
  if (await userHasTooManyActiveAnalyses(auth.supabase, auth.user.id)) {
    return json(
      { error: "You already have analyses in progress. Please wait a few seconds and retry." },
      409,
    );
  }

  const result = await runInterviewAnalysis(auth.supabase, attemptRow);
  if (!result.ok) {
    return error(result.error.message, result.error.status);
  }
  return json({ attempt: result.attempt });
});
