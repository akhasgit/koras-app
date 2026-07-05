// IELTS scoring helpers, ported from `koras-web/src/lib/ielts/ielts-scoring.ts`
// and the criteria labels from `ielts-types.ts`.

export type IELTSCriterionKey =
  | "fluencyCoherence"
  | "lexicalResource"
  | "grammarRangeAccuracy"
  | "pronunciation";

export const IELTS_CRITERIA_LABELS: Record<IELTSCriterionKey, string> = {
  fluencyCoherence: "Fluency & Coherence",
  lexicalResource: "Vocabulary",
  grammarRangeAccuracy: "Grammar",
  pronunciation: "Pronunciation",
};

export function roundToNearestHalfBand(value: number): number {
  return Math.round(value * 2) / 2;
}

export function strongestAndWeakest(
  scores: Record<string, number>,
): { strongest: IELTSCriterionKey; weakest: IELTSCriterionKey } {
  const entries = Object.entries(scores) as Array<[IELTSCriterionKey, number]>;
  let strongest = entries[0][0];
  let weakest = entries[0][0];
  for (const [key, value] of entries) {
    if (value > scores[strongest]) strongest = key;
    if (value < scores[weakest]) weakest = key;
  }
  return { strongest, weakest };
}
