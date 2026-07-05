import 'package:freezed_annotation/freezed_annotation.dart';

part 'voice_assessment.freezed.dart';
part 'voice_assessment.g.dart';

/// Five voice dimensions + overall (0–100). See 07 / 12.
@freezed
class VoiceScores with _$VoiceScores {
  const factory VoiceScores({
    required int overall,
    required int pitch,
    required int pace,
    required int clarity,
    required int resonance,
    required int confidence,
  }) = _VoiceScores;

  factory VoiceScores.fromJson(Map<String, dynamic> json) =>
      _$VoiceScoresFromJson(json);
}

/// Mirrors `public.voice_assessments` (migration 0003). See 07.
@freezed
class VoiceAssessment with _$VoiceAssessment {
  const factory VoiceAssessment({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'is_baseline') @Default(false) bool isBaseline,
    required VoiceScores scores,
    Map<String, dynamic>? metrics,
    String? transcript,
    @JsonKey(name: 'transcript_analysis')
    Map<String, dynamic>? transcriptAnalysis,
    @JsonKey(name: 'coach_feedback') String? coachFeedback,
    String? archetype,
    @JsonKey(name: 'audio_key') String? audioKey,
    @JsonKey(name: 'audio_uploaded_at') DateTime? audioUploadedAt,
    @JsonKey(name: 'audio_expires_at') DateTime? audioExpiresAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _VoiceAssessment;

  factory VoiceAssessment.fromJson(Map<String, dynamic> json) =>
      _$VoiceAssessmentFromJson(json);

  /// Reshape a flat `voice_assessments` DB row (overall_score, pitch_score, …
  /// plus flat metric columns) into the nested shape `fromJson` expects.
  static VoiceAssessment fromRow(Map<String, dynamic> r) {
    return VoiceAssessment.fromJson({
      ...r,
      'scores': {
        'overall': r['overall_score'] ?? 0,
        'pitch': r['pitch_score'] ?? 0,
        'pace': r['pace_score'] ?? 0,
        'clarity': r['clarity_score'] ?? 0,
        'resonance': r['resonance_score'] ?? 0,
        'confidence': r['confidence_score'] ?? 0,
      },
      'metrics': r['metrics'] ??
          {
            'duration_seconds': r['duration_seconds'],
            'words_per_minute': r['words_per_minute'],
            'mean_pitch_hz': r['mean_pitch_hz'],
            'pitch_std_hz': r['pitch_std_hz'],
            'hnr_db': r['hnr_db'],
            'pause_count': r['pause_count'],
            'long_pause_count': r['long_pause_count'],
          },
    });
  }
}
