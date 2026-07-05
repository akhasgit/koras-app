// recordings-presign-put — mint an R2 presigned PUT for an upload owned
// by the caller. Body: { scope, ownerId?, id?, contentType } → { uploadUrl, objectKey }
// See doc 08 / doc 21.

import { handlePreflight, json, error } from "../_shared/cors.ts";
import { requireUser } from "../_shared/auth.ts";
import { buildObjectKey, presignPut } from "../_shared/r2.ts";

Deno.serve(async (req) => {
  const pre = handlePreflight(req);
  if (pre) return pre;

  const auth = await requireUser(req);
  if (auth.error) return auth.error;

  let body: {
    scope?: string;
    contentType?: string;
    id?: string;
    ownerId?: string;
  };
  try {
    body = await req.json();
  } catch {
    return error("Invalid request body", 400);
  }

  const scope = body.scope;
  const contentType = body.contentType || "audio/webm";
  const id = body.id || crypto.randomUUID();
  if (!scope) return error("Missing scope", 400);

  // Owner is always the caller (doc 21). ownerId is accepted for forward
  // compatibility but ignored unless it equals the caller's id.
  const userId =
    body.ownerId && body.ownerId === auth.user.id ? body.ownerId : auth.user.id;

  let objectKey: string;
  try {
    objectKey = buildObjectKey({ scope, userId, id, contentType });
  } catch (e) {
    return error(e instanceof Error ? e.message : "Invalid scope", 400);
  }

  try {
    const uploadUrl = await presignPut(objectKey);
    return json({ uploadUrl, objectKey });
  } catch (e) {
    console.error("[recordings-presign-put] presign failed", e);
    return error("Failed to generate upload URL", 500);
  }
});
