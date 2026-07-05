/// 0–100 → IELTS band conversion. Keep in lock-step with `backend/app.py` and
/// `koras-web/src/lib/ielts/ielts-scoring.ts`. See 14.
double scoreToBand(num s) {
  if (s >= 92) return 9.0;
  if (s >= 87) return 8.5;
  if (s >= 82) return 8.0;
  if (s >= 77) return 7.5;
  if (s >= 72) return 7.0;
  if (s >= 65) return 6.5;
  if (s >= 58) return 6.0;
  if (s >= 52) return 5.5;
  if (s >= 45) return 5.0;
  if (s >= 38) return 4.5;
  return 4.0;
}

double roundToNearestHalfBand(num v) => (v * 2).round() / 2;

const ieltsCriterionLabels = <String, String>{
  'fluencyCoherence': 'Fluency & Coherence',
  'lexicalResource': 'Vocabulary',
  'grammarRangeAccuracy': 'Grammar',
  'pronunciation': 'Pronunciation',
};
