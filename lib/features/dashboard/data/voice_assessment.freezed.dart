// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voice_assessment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VoiceScores _$VoiceScoresFromJson(Map<String, dynamic> json) {
  return _VoiceScores.fromJson(json);
}

/// @nodoc
mixin _$VoiceScores {
  int get overall => throw _privateConstructorUsedError;
  int get pitch => throw _privateConstructorUsedError;
  int get pace => throw _privateConstructorUsedError;
  int get clarity => throw _privateConstructorUsedError;
  int get resonance => throw _privateConstructorUsedError;
  int get confidence => throw _privateConstructorUsedError;

  /// Serializes this VoiceScores to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VoiceScores
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VoiceScoresCopyWith<VoiceScores> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoiceScoresCopyWith<$Res> {
  factory $VoiceScoresCopyWith(
          VoiceScores value, $Res Function(VoiceScores) then) =
      _$VoiceScoresCopyWithImpl<$Res, VoiceScores>;
  @useResult
  $Res call(
      {int overall,
      int pitch,
      int pace,
      int clarity,
      int resonance,
      int confidence});
}

/// @nodoc
class _$VoiceScoresCopyWithImpl<$Res, $Val extends VoiceScores>
    implements $VoiceScoresCopyWith<$Res> {
  _$VoiceScoresCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VoiceScores
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overall = null,
    Object? pitch = null,
    Object? pace = null,
    Object? clarity = null,
    Object? resonance = null,
    Object? confidence = null,
  }) {
    return _then(_value.copyWith(
      overall: null == overall
          ? _value.overall
          : overall // ignore: cast_nullable_to_non_nullable
              as int,
      pitch: null == pitch
          ? _value.pitch
          : pitch // ignore: cast_nullable_to_non_nullable
              as int,
      pace: null == pace
          ? _value.pace
          : pace // ignore: cast_nullable_to_non_nullable
              as int,
      clarity: null == clarity
          ? _value.clarity
          : clarity // ignore: cast_nullable_to_non_nullable
              as int,
      resonance: null == resonance
          ? _value.resonance
          : resonance // ignore: cast_nullable_to_non_nullable
              as int,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VoiceScoresImplCopyWith<$Res>
    implements $VoiceScoresCopyWith<$Res> {
  factory _$$VoiceScoresImplCopyWith(
          _$VoiceScoresImpl value, $Res Function(_$VoiceScoresImpl) then) =
      __$$VoiceScoresImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int overall,
      int pitch,
      int pace,
      int clarity,
      int resonance,
      int confidence});
}

/// @nodoc
class __$$VoiceScoresImplCopyWithImpl<$Res>
    extends _$VoiceScoresCopyWithImpl<$Res, _$VoiceScoresImpl>
    implements _$$VoiceScoresImplCopyWith<$Res> {
  __$$VoiceScoresImplCopyWithImpl(
      _$VoiceScoresImpl _value, $Res Function(_$VoiceScoresImpl) _then)
      : super(_value, _then);

  /// Create a copy of VoiceScores
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overall = null,
    Object? pitch = null,
    Object? pace = null,
    Object? clarity = null,
    Object? resonance = null,
    Object? confidence = null,
  }) {
    return _then(_$VoiceScoresImpl(
      overall: null == overall
          ? _value.overall
          : overall // ignore: cast_nullable_to_non_nullable
              as int,
      pitch: null == pitch
          ? _value.pitch
          : pitch // ignore: cast_nullable_to_non_nullable
              as int,
      pace: null == pace
          ? _value.pace
          : pace // ignore: cast_nullable_to_non_nullable
              as int,
      clarity: null == clarity
          ? _value.clarity
          : clarity // ignore: cast_nullable_to_non_nullable
              as int,
      resonance: null == resonance
          ? _value.resonance
          : resonance // ignore: cast_nullable_to_non_nullable
              as int,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VoiceScoresImpl implements _VoiceScores {
  const _$VoiceScoresImpl(
      {required this.overall,
      required this.pitch,
      required this.pace,
      required this.clarity,
      required this.resonance,
      required this.confidence});

  factory _$VoiceScoresImpl.fromJson(Map<String, dynamic> json) =>
      _$$VoiceScoresImplFromJson(json);

  @override
  final int overall;
  @override
  final int pitch;
  @override
  final int pace;
  @override
  final int clarity;
  @override
  final int resonance;
  @override
  final int confidence;

  @override
  String toString() {
    return 'VoiceScores(overall: $overall, pitch: $pitch, pace: $pace, clarity: $clarity, resonance: $resonance, confidence: $confidence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoiceScoresImpl &&
            (identical(other.overall, overall) || other.overall == overall) &&
            (identical(other.pitch, pitch) || other.pitch == pitch) &&
            (identical(other.pace, pace) || other.pace == pace) &&
            (identical(other.clarity, clarity) || other.clarity == clarity) &&
            (identical(other.resonance, resonance) ||
                other.resonance == resonance) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, overall, pitch, pace, clarity, resonance, confidence);

  /// Create a copy of VoiceScores
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VoiceScoresImplCopyWith<_$VoiceScoresImpl> get copyWith =>
      __$$VoiceScoresImplCopyWithImpl<_$VoiceScoresImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VoiceScoresImplToJson(
      this,
    );
  }
}

abstract class _VoiceScores implements VoiceScores {
  const factory _VoiceScores(
      {required final int overall,
      required final int pitch,
      required final int pace,
      required final int clarity,
      required final int resonance,
      required final int confidence}) = _$VoiceScoresImpl;

  factory _VoiceScores.fromJson(Map<String, dynamic> json) =
      _$VoiceScoresImpl.fromJson;

  @override
  int get overall;
  @override
  int get pitch;
  @override
  int get pace;
  @override
  int get clarity;
  @override
  int get resonance;
  @override
  int get confidence;

  /// Create a copy of VoiceScores
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VoiceScoresImplCopyWith<_$VoiceScoresImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VoiceAssessment _$VoiceAssessmentFromJson(Map<String, dynamic> json) {
  return _VoiceAssessment.fromJson(json);
}

/// @nodoc
mixin _$VoiceAssessment {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_baseline')
  bool get isBaseline => throw _privateConstructorUsedError;
  VoiceScores get scores => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metrics => throw _privateConstructorUsedError;
  String? get transcript => throw _privateConstructorUsedError;
  @JsonKey(name: 'transcript_analysis')
  Map<String, dynamic>? get transcriptAnalysis =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'coach_feedback')
  String? get coachFeedback => throw _privateConstructorUsedError;
  String? get archetype => throw _privateConstructorUsedError;
  @JsonKey(name: 'audio_key')
  String? get audioKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'audio_uploaded_at')
  DateTime? get audioUploadedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'audio_expires_at')
  DateTime? get audioExpiresAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this VoiceAssessment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VoiceAssessment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VoiceAssessmentCopyWith<VoiceAssessment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoiceAssessmentCopyWith<$Res> {
  factory $VoiceAssessmentCopyWith(
          VoiceAssessment value, $Res Function(VoiceAssessment) then) =
      _$VoiceAssessmentCopyWithImpl<$Res, VoiceAssessment>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'is_baseline') bool isBaseline,
      VoiceScores scores,
      Map<String, dynamic>? metrics,
      String? transcript,
      @JsonKey(name: 'transcript_analysis')
      Map<String, dynamic>? transcriptAnalysis,
      @JsonKey(name: 'coach_feedback') String? coachFeedback,
      String? archetype,
      @JsonKey(name: 'audio_key') String? audioKey,
      @JsonKey(name: 'audio_uploaded_at') DateTime? audioUploadedAt,
      @JsonKey(name: 'audio_expires_at') DateTime? audioExpiresAt,
      @JsonKey(name: 'created_at') DateTime? createdAt});

  $VoiceScoresCopyWith<$Res> get scores;
}

/// @nodoc
class _$VoiceAssessmentCopyWithImpl<$Res, $Val extends VoiceAssessment>
    implements $VoiceAssessmentCopyWith<$Res> {
  _$VoiceAssessmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VoiceAssessment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? isBaseline = null,
    Object? scores = null,
    Object? metrics = freezed,
    Object? transcript = freezed,
    Object? transcriptAnalysis = freezed,
    Object? coachFeedback = freezed,
    Object? archetype = freezed,
    Object? audioKey = freezed,
    Object? audioUploadedAt = freezed,
    Object? audioExpiresAt = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      isBaseline: null == isBaseline
          ? _value.isBaseline
          : isBaseline // ignore: cast_nullable_to_non_nullable
              as bool,
      scores: null == scores
          ? _value.scores
          : scores // ignore: cast_nullable_to_non_nullable
              as VoiceScores,
      metrics: freezed == metrics
          ? _value.metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      transcript: freezed == transcript
          ? _value.transcript
          : transcript // ignore: cast_nullable_to_non_nullable
              as String?,
      transcriptAnalysis: freezed == transcriptAnalysis
          ? _value.transcriptAnalysis
          : transcriptAnalysis // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      coachFeedback: freezed == coachFeedback
          ? _value.coachFeedback
          : coachFeedback // ignore: cast_nullable_to_non_nullable
              as String?,
      archetype: freezed == archetype
          ? _value.archetype
          : archetype // ignore: cast_nullable_to_non_nullable
              as String?,
      audioKey: freezed == audioKey
          ? _value.audioKey
          : audioKey // ignore: cast_nullable_to_non_nullable
              as String?,
      audioUploadedAt: freezed == audioUploadedAt
          ? _value.audioUploadedAt
          : audioUploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      audioExpiresAt: freezed == audioExpiresAt
          ? _value.audioExpiresAt
          : audioExpiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of VoiceAssessment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VoiceScoresCopyWith<$Res> get scores {
    return $VoiceScoresCopyWith<$Res>(_value.scores, (value) {
      return _then(_value.copyWith(scores: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VoiceAssessmentImplCopyWith<$Res>
    implements $VoiceAssessmentCopyWith<$Res> {
  factory _$$VoiceAssessmentImplCopyWith(_$VoiceAssessmentImpl value,
          $Res Function(_$VoiceAssessmentImpl) then) =
      __$$VoiceAssessmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'is_baseline') bool isBaseline,
      VoiceScores scores,
      Map<String, dynamic>? metrics,
      String? transcript,
      @JsonKey(name: 'transcript_analysis')
      Map<String, dynamic>? transcriptAnalysis,
      @JsonKey(name: 'coach_feedback') String? coachFeedback,
      String? archetype,
      @JsonKey(name: 'audio_key') String? audioKey,
      @JsonKey(name: 'audio_uploaded_at') DateTime? audioUploadedAt,
      @JsonKey(name: 'audio_expires_at') DateTime? audioExpiresAt,
      @JsonKey(name: 'created_at') DateTime? createdAt});

  @override
  $VoiceScoresCopyWith<$Res> get scores;
}

/// @nodoc
class __$$VoiceAssessmentImplCopyWithImpl<$Res>
    extends _$VoiceAssessmentCopyWithImpl<$Res, _$VoiceAssessmentImpl>
    implements _$$VoiceAssessmentImplCopyWith<$Res> {
  __$$VoiceAssessmentImplCopyWithImpl(
      _$VoiceAssessmentImpl _value, $Res Function(_$VoiceAssessmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of VoiceAssessment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? isBaseline = null,
    Object? scores = null,
    Object? metrics = freezed,
    Object? transcript = freezed,
    Object? transcriptAnalysis = freezed,
    Object? coachFeedback = freezed,
    Object? archetype = freezed,
    Object? audioKey = freezed,
    Object? audioUploadedAt = freezed,
    Object? audioExpiresAt = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$VoiceAssessmentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      isBaseline: null == isBaseline
          ? _value.isBaseline
          : isBaseline // ignore: cast_nullable_to_non_nullable
              as bool,
      scores: null == scores
          ? _value.scores
          : scores // ignore: cast_nullable_to_non_nullable
              as VoiceScores,
      metrics: freezed == metrics
          ? _value._metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      transcript: freezed == transcript
          ? _value.transcript
          : transcript // ignore: cast_nullable_to_non_nullable
              as String?,
      transcriptAnalysis: freezed == transcriptAnalysis
          ? _value._transcriptAnalysis
          : transcriptAnalysis // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      coachFeedback: freezed == coachFeedback
          ? _value.coachFeedback
          : coachFeedback // ignore: cast_nullable_to_non_nullable
              as String?,
      archetype: freezed == archetype
          ? _value.archetype
          : archetype // ignore: cast_nullable_to_non_nullable
              as String?,
      audioKey: freezed == audioKey
          ? _value.audioKey
          : audioKey // ignore: cast_nullable_to_non_nullable
              as String?,
      audioUploadedAt: freezed == audioUploadedAt
          ? _value.audioUploadedAt
          : audioUploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      audioExpiresAt: freezed == audioExpiresAt
          ? _value.audioExpiresAt
          : audioExpiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VoiceAssessmentImpl implements _VoiceAssessment {
  const _$VoiceAssessmentImpl(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'is_baseline') this.isBaseline = false,
      required this.scores,
      final Map<String, dynamic>? metrics,
      this.transcript,
      @JsonKey(name: 'transcript_analysis')
      final Map<String, dynamic>? transcriptAnalysis,
      @JsonKey(name: 'coach_feedback') this.coachFeedback,
      this.archetype,
      @JsonKey(name: 'audio_key') this.audioKey,
      @JsonKey(name: 'audio_uploaded_at') this.audioUploadedAt,
      @JsonKey(name: 'audio_expires_at') this.audioExpiresAt,
      @JsonKey(name: 'created_at') this.createdAt})
      : _metrics = metrics,
        _transcriptAnalysis = transcriptAnalysis;

  factory _$VoiceAssessmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$VoiceAssessmentImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'is_baseline')
  final bool isBaseline;
  @override
  final VoiceScores scores;
  final Map<String, dynamic>? _metrics;
  @override
  Map<String, dynamic>? get metrics {
    final value = _metrics;
    if (value == null) return null;
    if (_metrics is EqualUnmodifiableMapView) return _metrics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? transcript;
  final Map<String, dynamic>? _transcriptAnalysis;
  @override
  @JsonKey(name: 'transcript_analysis')
  Map<String, dynamic>? get transcriptAnalysis {
    final value = _transcriptAnalysis;
    if (value == null) return null;
    if (_transcriptAnalysis is EqualUnmodifiableMapView)
      return _transcriptAnalysis;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'coach_feedback')
  final String? coachFeedback;
  @override
  final String? archetype;
  @override
  @JsonKey(name: 'audio_key')
  final String? audioKey;
  @override
  @JsonKey(name: 'audio_uploaded_at')
  final DateTime? audioUploadedAt;
  @override
  @JsonKey(name: 'audio_expires_at')
  final DateTime? audioExpiresAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'VoiceAssessment(id: $id, userId: $userId, isBaseline: $isBaseline, scores: $scores, metrics: $metrics, transcript: $transcript, transcriptAnalysis: $transcriptAnalysis, coachFeedback: $coachFeedback, archetype: $archetype, audioKey: $audioKey, audioUploadedAt: $audioUploadedAt, audioExpiresAt: $audioExpiresAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoiceAssessmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.isBaseline, isBaseline) ||
                other.isBaseline == isBaseline) &&
            (identical(other.scores, scores) || other.scores == scores) &&
            const DeepCollectionEquality().equals(other._metrics, _metrics) &&
            (identical(other.transcript, transcript) ||
                other.transcript == transcript) &&
            const DeepCollectionEquality()
                .equals(other._transcriptAnalysis, _transcriptAnalysis) &&
            (identical(other.coachFeedback, coachFeedback) ||
                other.coachFeedback == coachFeedback) &&
            (identical(other.archetype, archetype) ||
                other.archetype == archetype) &&
            (identical(other.audioKey, audioKey) ||
                other.audioKey == audioKey) &&
            (identical(other.audioUploadedAt, audioUploadedAt) ||
                other.audioUploadedAt == audioUploadedAt) &&
            (identical(other.audioExpiresAt, audioExpiresAt) ||
                other.audioExpiresAt == audioExpiresAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      isBaseline,
      scores,
      const DeepCollectionEquality().hash(_metrics),
      transcript,
      const DeepCollectionEquality().hash(_transcriptAnalysis),
      coachFeedback,
      archetype,
      audioKey,
      audioUploadedAt,
      audioExpiresAt,
      createdAt);

  /// Create a copy of VoiceAssessment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VoiceAssessmentImplCopyWith<_$VoiceAssessmentImpl> get copyWith =>
      __$$VoiceAssessmentImplCopyWithImpl<_$VoiceAssessmentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VoiceAssessmentImplToJson(
      this,
    );
  }
}

abstract class _VoiceAssessment implements VoiceAssessment {
  const factory _VoiceAssessment(
          {required final String id,
          @JsonKey(name: 'user_id') required final String userId,
          @JsonKey(name: 'is_baseline') final bool isBaseline,
          required final VoiceScores scores,
          final Map<String, dynamic>? metrics,
          final String? transcript,
          @JsonKey(name: 'transcript_analysis')
          final Map<String, dynamic>? transcriptAnalysis,
          @JsonKey(name: 'coach_feedback') final String? coachFeedback,
          final String? archetype,
          @JsonKey(name: 'audio_key') final String? audioKey,
          @JsonKey(name: 'audio_uploaded_at') final DateTime? audioUploadedAt,
          @JsonKey(name: 'audio_expires_at') final DateTime? audioExpiresAt,
          @JsonKey(name: 'created_at') final DateTime? createdAt}) =
      _$VoiceAssessmentImpl;

  factory _VoiceAssessment.fromJson(Map<String, dynamic> json) =
      _$VoiceAssessmentImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'is_baseline')
  bool get isBaseline;
  @override
  VoiceScores get scores;
  @override
  Map<String, dynamic>? get metrics;
  @override
  String? get transcript;
  @override
  @JsonKey(name: 'transcript_analysis')
  Map<String, dynamic>? get transcriptAnalysis;
  @override
  @JsonKey(name: 'coach_feedback')
  String? get coachFeedback;
  @override
  String? get archetype;
  @override
  @JsonKey(name: 'audio_key')
  String? get audioKey;
  @override
  @JsonKey(name: 'audio_uploaded_at')
  DateTime? get audioUploadedAt;
  @override
  @JsonKey(name: 'audio_expires_at')
  DateTime? get audioExpiresAt;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of VoiceAssessment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VoiceAssessmentImplCopyWith<_$VoiceAssessmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
