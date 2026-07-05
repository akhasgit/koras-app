// recordings-presign-get — mint a short-lived R2 presigned GET.
// Body: { objectKey } → { url }  (5-min TTL; 410 if past 90-day lifecycle).
// Ownership is enforced by the owner segment in the key (doc 21).

import { handlePreflight, json, error } from "../_shared/cors.ts";
import { requireUser } from "../_shared/auth.ts";
import { presignGet, ownerFromKey } from "../_shared/r2.ts";

Deno.serve(async (req) => {
  const pre = handlePreflight(req);
  if (pre) return pre;

  const auth = await requireUser(req);
  if (auth.error) return auth.error;

  let body: { objectKey?: string };
  try {
    body = await req.json();
  } catch {
    return error("Invalid request body", 400);
  }

  const objectKey = body.objectKey;
  if (!objectKey || typeof objectKey !== "string") {
    return error("Missing objectKey", 400);
  }

  // Ownership: the owner segment of the key must be the caller.
  if (ownerFromKey(objectKey) !== auth.user.id) {
    return error("Not allowed", 403);
  }

  // Lifecycle: voice_assessment objects carry an explicit expiry column.
  if (objectKey.startsWith("users/") && objectKey.includes("/recordings/")) {
    const { data: row } = await auth.supabase
      .from("voice_assessments")
      .select("audio_expires_at")
      .eq("audio_key", objectKey)
      .maybeSingle();
    if (
      row?.audio_expires_at &&
      new Date(row.audio_expires_at).getTime() < Date.now()
    ) {
      return error("Recording has expired", 410);
    }
  }

  try {
    const url = await presignGet(objectKey);
    return json({ url });
  } catch (e) {
    console.error("[recordings-presign-get] presign failed", e);
    return error("Could not generate playback URL", 500);
  }
});
