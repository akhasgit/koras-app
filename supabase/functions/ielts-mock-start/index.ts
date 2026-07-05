// ielts-mock-start — create an ielts_mock_tests row. → { mockTestId }

import { handlePreflight, json, error } from "../_shared/cors.ts";
import { requireUser } from "../_shared/auth.ts";
import { hasProgramAccess } from "../_shared/programs.ts";

const PROGRAM_ID = "ielts-speaking";

Deno.serve(async (req) => {
  const pre = handlePreflight(req);
  if (pre) return pre;

  const auth = await requireUser(req);
  if (auth.error) return auth.error;
  if (!(await hasProgramAccess(auth.supabase, auth.user.id, PROGRAM_ID))) {
    return error("Forbidden", 403);
  }

  let body: { aiTutorSessionId?: string } = {};
  try {
    body = await req.json();
  } catch {
    // body is optional
  }

  const { data, error: insertErr } = await auth.supabase
    .from("ielts_mock_tests")
    .insert({
      user_id: auth.user.id,
      ai_tutor_session_id: body.aiTutorSessionId ?? null,
      status: "started",
    })
    .select("id")
    .single();

  if (insertErr || !data) {
    console.error("[ielts-mock-start]", insertErr);
    return error("Could not start mock test", 500);
  }
  return json({ mockTestId: data.id });
});
