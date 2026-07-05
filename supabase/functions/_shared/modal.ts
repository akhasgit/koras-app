// Modal endpoint helpers, mirroring the web's `modalBaseUrl()` resolution.
//
// The web reads `MODAL_AI_TUTOR_API_URL` with `NEXT_PUBLIC_DEMO_API_URL`
// as a fallback. Edge functions use the same names (the public fallback
// is harmless server-side and keeps parity with existing infra config).

export function modalBaseUrl(): string | null {
  return (
    Deno.env.get("MODAL_AI_TUTOR_API_URL") ||
    Deno.env.get("NEXT_PUBLIC_DEMO_API_URL") ||
    Deno.env.get("MODAL_BASE_URL") ||
    null
  );
}

export function modalDailyPlanBaseUrl(): string | null {
  return (
    Deno.env.get("MODAL_DAILY_PLAN_API_URL") ||
    modalBaseUrl()
  );
}

export function modalUrl(base: string, path: string): string {
  return `${base.replace(/\/$/, "")}${path.startsWith("/") ? path : `/${path}`}`;
}
