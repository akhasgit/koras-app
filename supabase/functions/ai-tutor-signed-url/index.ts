// ai-tutor-signed-url — mint an ElevenLabs ConvAI WS URL for a session.
// Body: { sessionId } → { signedUrl }

import { handlePreflight, json, error } from "../_shared/cors.ts";
import { requireUser, getAdminClient } from "../_shared/auth.ts";
import { validateSessionOwnership } from "../_shared/ai-tutor.ts";
import { getElevenLabsSignedUrl } from "../_shared/elevenlabs.ts";

Deno.serve(async (req) => {
  const pre = handlePreflight(req);
  if (pre) return pre;

  const auth = await requireUser(req);
  if (auth.error) return auth.error;

  let body: { sessionId?: string };
  try {
    body = await req.json();
  } catch {
    return error("Invalid request body", 400);
  }

  const admin = getAdminClient();
  const session = await validateSessionOwnership(
    admin,
    body.sessionId ?? "",
    auth.user.id,
  );
  if (!session) return error("Session not found or access denied", 404);

  let signedUrl: string;
  try {
    signedUrl = await getElevenLabsSignedUrl();
  } catch (err) {
    const message = err instanceof Error ? err.message : "ElevenLabs request failed.";
    console.error("[ai-tutor-signed-url] ElevenLabs error:", message);
    return json({ error: "Failed to get conversation URL", detail: message }, 502);
  }

  await admin
    .from("ai_tutor_sessions")
    .update({ status: "active" })
    .eq("id", body.sessionId);

  return json({ signedUrl });
});
