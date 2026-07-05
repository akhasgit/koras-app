// daily-plan-complete-item — flip a single plan item's status.
// Body: { itemId, status, planId? } → { plan }

import { handlePreflight, json, error } from "../_shared/cors.ts";
import { requireUser, getAdminClient } from "../_shared/auth.ts";
import { markDailyPlanItemStatus } from "../_shared/daily-plan.ts";

const VALID_STATUS = ["pending", "completed", "skipped"];

Deno.serve(async (req) => {
  const pre = handlePreflight(req);
  if (pre) return pre;

  const auth = await requireUser(req);
  if (auth.error) return auth.error;

  let body: { itemId?: string; status?: string; planId?: string };
  try {
    body = await req.json();
  } catch {
    return error("Invalid JSON", 400);
  }

  const itemId = body.itemId;
  const status = body.status;
  if (!itemId || !status || !VALID_STATUS.includes(status)) {
    return error("Invalid itemId or status", 400);
  }

  const admin = getAdminClient();
  const plan = await markDailyPlanItemStatus({
    admin,
    userId: auth.user.id,
    planId: body.planId ?? null,
    itemId,
    status: status as "pending" | "completed" | "skipped",
  });
  if (!plan) return error("Not found", 404);
  return json({ plan });
});
