// ielts-mock-complete — finalize a mock test. Body: { mockTestId } → { mockTest }
//
// The mobile mock flow records the three parts as individual attempts and
// links them to the mock row. We aggregate their practice bands into an
// overall band, mark the mock completed, and return the row.

import { handlePreflight, json, error } from "../_shared/cors.ts";
import { requireUser } from "../_shared/auth.ts";
import { hasProgramAccess } from "../_shared/programs.ts";
import { roundToNearestHalfBand } from "../_shared/ielts-scoring.ts";

const PROGRAM_ID = "ielts-speaking";

Deno.serve(async (req) => {
  const pre = handlePreflight(req);
  if (pre) return pre;

  const auth = await requireUser(req);
  if (auth.error) return auth.error;
  if (!(await hasProgramAccess(auth.supabase, auth.user.id, PROGRAM_ID))) {
    return error("Forbidden", 403);
  }

  let body: { mockTestId?: string };
  try {
    body = await req.json();
  } catch {
    return error("Invalid JSON", 400);
  }
  const mockTestId = body.mockTestId;
  if (!mockTestId || !/^[0-9a-f-]{36}$/i.test(mockTestId)) {
    return error("Invalid mockTestId", 400);
  }

  const { data: mock } = await auth.supabase
    .from("ielts_mock_tests")
    .select("*")
    .eq("id", mockTestId)
    .maybeSingle();
  if (!mock) return error("Mock test not found", 404);

  // Aggregate practice bands from any linked part attempts.
  const attemptIds = [
    mock.part1_attempt_id,
    mock.part2_attempt_id,
    mock.part3_attempt_id,
  ].filter((id): id is string => typeof id === "string");

  let overallBand: number | null = null;
  if (attemptIds.length > 0) {
    const { data: attempts } = await auth.supabase
      .from("ielts_lesson_attempts")
      .select("practice_band")
      .in("id", attemptIds);
    const bands = (attempts ?? [])
      .map((a) => a.practice_band as number | null)
      .filter((b): b is number => typeof b === "number");
    if (bands.length > 0) {
      overallBand = roundToNearestHalfBand(
        bands.reduce((s, b) => s + b, 0) / bands.length,
      );
    }
  }

  const { data: updated, error: updateErr } = await auth.supabase
    .from("ielts_mock_tests")
    .update({
      status: "completed",
      practice_band: overallBand,
      completed_at: new Date().toISOString(),
    })
    .eq("id", mockTestId)
    .select("*")
    .single();

  if (updateErr || !updated) {
    console.error("[ielts-mock-complete] update failed", updateErr);
    return error("Could not save mock test.", 500);
  }

  // Mirror practice_band onto overall_band for the client model.
  return json({ mockTest: { ...updated, overall_band: overallBand } });
});
