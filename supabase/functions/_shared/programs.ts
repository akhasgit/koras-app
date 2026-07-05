// Program access checks, ported from `koras-web/src/lib/programs/access.ts`.
//
// Reads use the caller's RLS-scoped client: the `program_access` RLS policy
// only returns rows that are enabled AND match the caller's segment, so a
// returned row means access is granted. Super-admins and test accounts are
// always allowed.

import type { SupabaseClient } from "https://esm.sh/@supabase/supabase-js@2.45.4";

const V1_PROGRAM_IDS = ["ai-tutor", "ielts-speaking", "interview-prep"];

export async function hasProgramAccess(
  supabase: SupabaseClient,
  userId: string,
  programId: string,
): Promise<boolean> {
  const { data: profile } = await supabase
    .from("profiles")
    .select("role, is_test_account")
    .eq("id", userId)
    .maybeSingle();
  if (profile?.role === "super_admin") return true;
  if (profile?.is_test_account) return true;

  const { data: row } = await supabase
    .from("program_access")
    .select("program_id")
    .eq("program_id", programId)
    .limit(1)
    .maybeSingle();
  return !!row;
}

export async function listAccessibleProgramIds(
  supabase: SupabaseClient,
  userId: string,
): Promise<string[]> {
  const { data: profile } = await supabase
    .from("profiles")
    .select("role, is_test_account")
    .eq("id", userId)
    .maybeSingle();
  if (profile?.role === "super_admin" || profile?.is_test_account) {
    return [...V1_PROGRAM_IDS];
  }
  const { data: rows } = await supabase
    .from("program_access")
    .select("program_id");
  const ids = new Set((rows ?? []).map((r) => r.program_id as string));
  return Array.from(ids);
}
