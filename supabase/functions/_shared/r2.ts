// Cloudflare R2 presigning for Deno, mirroring `koras-web/src/lib/r2*`.
//
// The web uses the AWS SDK's `getSignedUrl`. In Deno we sign with
// `aws4fetch` (a tiny SigV4 implementation) against R2's S3-compatible
// endpoint. We sign query params (presigned URL) so the device can PUT/GET
// the bytes directly. Only `host` is signed, so the upload's Content-Type
// header doesn't need to match the signature — matching the mobile client
// which always sends Content-Type explicitly (see doc 21).

import { AwsClient } from "https://esm.sh/aws4fetch@1.0.20";

const URL_TTL_SECONDS = 300; // 5 minutes — same as the web.

function r2() {
  const accountId = Deno.env.get("R2_ACCOUNT_ID");
  const accessKeyId = Deno.env.get("R2_ACCESS_KEY_ID");
  const secretAccessKey = Deno.env.get("R2_SECRET_ACCESS_KEY");
  const bucket = Deno.env.get("R2_BUCKET_NAME");
  if (!accountId || !accessKeyId || !secretAccessKey || !bucket) {
    throw new Error(
      "Missing R2 env vars. Set R2_ACCOUNT_ID, R2_ACCESS_KEY_ID, R2_SECRET_ACCESS_KEY, R2_BUCKET_NAME.",
    );
  }
  const client = new AwsClient({
    accessKeyId,
    secretAccessKey,
    region: "auto",
    service: "s3",
  });
  const endpoint = `https://${accountId}.r2.cloudflarestorage.com`;
  return { client, endpoint, bucket };
}

function objectUrl(endpoint: string, bucket: string, objectKey: string): string {
  // Keep "/" path separators; encode each segment defensively.
  const encoded = objectKey
    .split("/")
    .map((seg) => encodeURIComponent(seg))
    .join("/");
  return `${endpoint}/${bucket}/${encoded}`;
}

/** Presigned PUT URL for a fresh upload. */
export async function presignPut(
  objectKey: string,
  ttl = URL_TTL_SECONDS,
): Promise<string> {
  const { client, endpoint, bucket } = r2();
  const url = `${objectUrl(endpoint, bucket, objectKey)}?X-Amz-Expires=${ttl}`;
  const signed = await client.sign(url, {
    method: "PUT",
    aws: { signQuery: true },
  });
  return signed.url;
}

/** Presigned GET URL for download/playback. */
export async function presignGet(
  objectKey: string,
  ttl = URL_TTL_SECONDS,
): Promise<string> {
  const { client, endpoint, bucket } = r2();
  const url = `${objectUrl(endpoint, bucket, objectKey)}?X-Amz-Expires=${ttl}`;
  const signed = await client.sign(url, {
    method: "GET",
    aws: { signQuery: true },
  });
  return signed.url;
}

/**
 * Download an object's bytes server-side (used by analyze pipelines that
 * forward audio to Modal as multipart). Returns null on failure.
 */
export async function getObjectBytes(
  objectKey: string,
): Promise<{ body: Uint8Array; contentType: string } | null> {
  try {
    const url = await presignGet(objectKey);
    const res = await fetch(url);
    if (!res.ok) {
      console.error("[r2] getObjectBytes non-OK", res.status);
      return null;
    }
    const buf = new Uint8Array(await res.arrayBuffer());
    return {
      body: buf,
      contentType: res.headers.get("content-type") || "audio/webm",
    };
  } catch (err) {
    console.error("[r2] getObjectBytes failed", err);
    return null;
  }
}

// ---------------------------------------------------------------------------
//  Object-key conventions (doc 21) + MIME helpers (mirror r2/client.ts)
// ---------------------------------------------------------------------------

/** Pick a sensible file extension for a recorded MIME type. */
export function extensionForMime(mime: string | null | undefined): string {
  const type = (mime || "").toLowerCase();
  if (type.includes("webm")) return "webm";
  if (type.includes("ogg")) return "ogg";
  if (type.includes("mp4") || type.includes("m4a")) return "mp4";
  if (type.includes("wav")) return "wav";
  if (type.includes("mpeg")) return "mp3";
  return "webm";
}

/**
 * Build the R2 object key for a presign-put request. The owner segment is
 * always the caller's id; the id segment is client-minted so the key and
 * the DB row line up 1:1.
 */
export function buildObjectKey(params: {
  scope: string;
  userId: string;
  id: string;
  contentType?: string;
}): string {
  const { scope, userId, id } = params;
  const ext = extensionForMime(params.contentType);
  switch (scope) {
    case "voice_assessment":
      return `users/${userId}/recordings/${id}.${ext}`;
    case "ai_tutor":
      return `ai-tutor/${userId}/${id}/recording.${ext}`;
    case "ielts":
    case "ielts_attempt":
      return `ielts/${userId}/attempts/${id}.${ext}`;
    case "interview_prep":
    case "interview_attempt":
      return `interview-prep/${userId}/attempts/${id}.${ext}`;
    default:
      throw new Error(`Unknown presign scope: ${scope}`);
  }
}

/**
 * Extract the owner id segment from an object key so presign-get can
 * enforce ownership without a per-table lookup.
 */
export function ownerFromKey(objectKey: string): string | null {
  const parts = objectKey.split("/");
  if (parts.length < 2) return null;
  // users/{uid}/... | ai-tutor/{uid}/... | ielts/{uid}/... | interview-prep/{uid}/...
  return parts[1] || null;
}
