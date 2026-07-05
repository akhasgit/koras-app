// Shared CORS headers + helpers for every Koras edge function.
//
// The mobile app calls these via `supabase_flutter`'s `functions.invoke`,
// which does not require CORS, but keeping permissive headers lets the
// same functions be exercised from the web/browser and local tooling.

export const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers":
    "authorization, x-client-info, apikey, content-type",
  "Access-Control-Allow-Methods": "POST, GET, OPTIONS",
};

/** JSON response with CORS headers applied. */
export function json(body: unknown, status = 200): Response {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...corsHeaders, "Content-Type": "application/json" },
  });
}

/** Standard error envelope: `{ error }` — mirrors the web route handlers. */
export function error(message: string, status: number): Response {
  return json({ error: message }, status);
}

/** Handle the CORS preflight; returns a Response or null to continue. */
export function handlePreflight(req: Request): Response | null {
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }
  return null;
}
