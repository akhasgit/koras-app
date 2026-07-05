// Mint a short-lived ConvAI signed WebSocket URL.
// Ported 1:1 from `koras-web/src/lib/elevenlabs-server.ts`.

const DEFAULT_API_ORIGIN = "https://api.elevenlabs.io";

function parseElevenLabsErrorBody(raw: string, status: number): string {
  const trimmed = raw.trim();
  if (!trimmed) return `Empty response body (HTTP ${status})`;
  try {
    const j = JSON.parse(trimmed) as { detail?: unknown; message?: string };
    if (typeof j.message === "string" && j.message) return j.message;
    const d = j.detail;
    if (typeof d === "string") return d;
    if (Array.isArray(d)) {
      return d
        .map((item) =>
          typeof item === "object" &&
          item !== null &&
          "msg" in item &&
          typeof (item as { msg: unknown }).msg === "string"
            ? (item as { msg: string }).msg
            : JSON.stringify(item),
        )
        .join("; ");
    }
  } catch {
    /* not JSON */
  }
  if (trimmed.length < 600) return trimmed;
  return trimmed.slice(0, 400) + "…";
}

function friendlySignedUrlHint(status: number): string {
  if (status === 401) {
    return "ElevenLabs rejected the API key (401). Set ELEVENLABS_API_KEY.";
  }
  if (status === 403) {
    return "ElevenLabs denied access (403). Confirm the key can use Conversational AI / Agents.";
  }
  if (status === 404) {
    return "Agent not found (404). Check ELEVENLABS_AGENT_ID (id only). Set ELEVENLABS_BRANCH_ID if the agent uses a branch.";
  }
  if (status === 422) {
    return "Invalid request to ElevenLabs (422). Check agent_id / branch_id or enable signed-URL access.";
  }
  return `ElevenLabs returned HTTP ${status}. See logs for the raw response.`;
}

export async function getElevenLabsSignedUrl(): Promise<string> {
  const apiKey = Deno.env.get("ELEVENLABS_API_KEY")?.trim();
  const agentId = Deno.env.get("ELEVENLABS_AGENT_ID")?.trim();
  const branchId = Deno.env.get("ELEVENLABS_BRANCH_ID")?.trim();
  const origin = (
    Deno.env.get("ELEVENLABS_API_ORIGIN")?.trim() || DEFAULT_API_ORIGIN
  ).replace(/\/$/, "");

  if (!apiKey || !agentId) {
    throw new Error(
      "Missing ElevenLabs env vars. Set ELEVENLABS_API_KEY and ELEVENLABS_AGENT_ID.",
    );
  }

  const url = new URL(`${origin}/v1/convai/conversation/get-signed-url`);
  url.searchParams.set("agent_id", agentId);
  if (branchId) url.searchParams.set("branch_id", branchId);

  const res = await fetch(url.toString(), {
    method: "GET",
    headers: { "xi-api-key": apiKey, Accept: "application/json" },
  });

  const rawText = await res.text().catch(() => "");
  if (!res.ok) {
    const parsed = parseElevenLabsErrorBody(rawText, res.status);
    throw new Error(`${friendlySignedUrlHint(res.status)} Details: ${parsed}`);
  }

  let body: { signed_url?: string };
  try {
    body = JSON.parse(rawText) as { signed_url?: string };
  } catch {
    throw new Error("ElevenLabs returned a non-JSON success body.");
  }
  if (!body.signed_url) {
    throw new Error("ElevenLabs JSON did not contain signed_url.");
  }
  return body.signed_url;
}
