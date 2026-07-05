// ai-tutor-start — create an ai_tutor_sessions row. Body: { mode } → { sessionId }

import { handlePreflight, json, error } from "../_shared/cors.ts";
import { requireUser, getAdminClient } from "../_shared/auth.ts";
import { VALID_MODES } from "../_shared/ai-tutor.ts";

Deno.serve(async (req) => {
  const pre = handlePreflight(req);
  if (pre) return pre;

  const auth = await requireUser(req);
  if (auth.error) return auth.error;

  let body: { mode?: string };
  try {
    body = await req.json();
  } catch {
    body = {};
  }

  const mode = body.mode || "speaking_foundations";
  if (!VALID_MODES.includes(mode as (typeof VALID_MODES)[number])) {
    return error(`Invalid mode. Must be one of: ${VALID_MODES.join(", ")}`, 400);
  }

  const admin = getAdminClient();
  const { data, error: insertErr } = await admin
    .from("ai_tutor_sessions")
    .insert({
      user_id: auth.user.id,
      mode,
      status: "started",
      recording_upload_status: "none",
    })
    .select("id")
    .single();

  if (insertErr) {
    console.error("[ai-tutor-start] insert failed:", insertErr.message);
    return error("Failed to create session", 500);
  }
  return json({ sessionId: data.id });
});
