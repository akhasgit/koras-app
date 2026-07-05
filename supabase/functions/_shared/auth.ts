// Auth + Supabase client helpers shared by every function.
//
// Two clients, mirroring the web app:
//   - a *user-scoped* client built from the caller's JWT (RLS applies),
//     equivalent to `createClient()` (cookie-bound) in koras-web.
//   - an *admin* client using the service-role key (RLS bypassed),
//     equivalent to `getSupabaseAdmin()` in koras-web.
//
// `requireUser` authenticates the caller and returns both the user and
// their RLS-scoped client, or a 401 Response — the Deno analogue of
// `requireAuth()` in `lib/ai-tutor-server.ts`.

import {
  createClient,
  type SupabaseClient,
  type User,
} from "https://esm.sh/@supabase/supabase-js@2.45.4";
import { error } from "./cors.ts";

const SUPABASE_URL = Deno.env.get("SUPABASE_URL")!;
const ANON_KEY = Deno.env.get("SUPABASE_ANON_KEY")!;
const SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;

/** Service-role client — bypasses RLS. Use for cross-row/privileged writes. */
export function getAdminClient(): SupabaseClient {
  return createClient(SUPABASE_URL, SERVICE_ROLE_KEY, {
    auth: { persistSession: false, autoRefreshToken: false },
  });
}

/** RLS-scoped client bound to the caller's JWT (forwards Authorization). */
export function getUserClient(req: Request): SupabaseClient {
  const authHeader = req.headers.get("Authorization") ?? "";
  return createClient(SUPABASE_URL, ANON_KEY, {
    global: { headers: { Authorization: authHeader } },
    auth: { persistSession: false, autoRefreshToken: false },
  });
}

export type AuthOk = {
  user: User;
  supabase: SupabaseClient;
  error?: never;
};
export type AuthErr = { user?: never; supabase?: never; error: Response };
export type AuthResult = AuthOk | AuthErr;

/**
 * Authenticate the caller via the bearer JWT. Returns the user plus an
 * RLS-scoped client, or a 401 Response.
 */
export async function requireUser(req: Request): Promise<AuthResult> {
  const supabase = getUserClient(req);
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) {
    return { error: error("Unauthorized", 401) };
  }
  return { user, supabase };
}
