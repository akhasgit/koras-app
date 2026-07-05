// daily-plan-generate — return the learner's active plan, generating one
// lazily (24h freshness window) with the rules engine + optional 9s LLM
// enrich. Body: { source? } → { plan }

import { handlePreflight, json, error } from "../_shared/cors.ts";
import { requireUser, getAdminClient } from "../_shared/auth.ts";
import { getOrGenerateCurrentPlan } from "../_shared/daily-plan.ts";

Deno.serve(async (req) => {
  const pre = handlePreflight(req);
  if (pre) return pre;

  const auth = await requireUser(req);
  if (auth.error) return auth.error;

  // Body is optional ({ source? }); we read it defensively but the
  // freshness logic is the same regardless of source.
  try {
    await req.json();
  } catch {
    // no body
  }

  const admin = getAdminClient();
  const plan = await getOrGenerateCurrentPlan(admin, auth.supabase, auth.user.id);
  if (!plan) return error("Could not generate plan", 500);
  return json({ plan });
});
