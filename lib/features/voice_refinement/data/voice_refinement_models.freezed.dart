// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voice_refinement_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VoiceRefinementBaseline _$VoiceRefinementBaselineFromJson(
    Map<String, dynamic> json) {
  return _VoiceRefinementBaseline.fromJson(json);
}

/// @nodoc
mixin _$VoiceRefinementBaseline {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'audio_object_key')
  String? get audioObjectKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'audio_mime_type')
  String? get audioMimeType => throw _privateConstructorUsedError;
  @JsonKey(name: 'recording_upload_status')
  String? get recordingUploadStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'attempt_status')
  String? get attemptStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'analysis_status')
  String? get analysisStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'analysis_error')
  String? get analysisError => throw _privateConstructorUsedError;
  @JsonKey(name: 'prompt_kind')
  String? get promptKind => throw _privateConstructorUsedError;
  Map<String, dynamic>? get scores => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metrics => throw _privateConstructorUsedError;
  String? get transcript => throw _privateConstructorUsedError;
  @JsonKey(name: 'coach_feedback')
  String? get coachFeedback => throw _privateConstructorUsedError;
  @JsonKey(name: 'natural_range')
  Map<String, dynamic>? get naturalRange => throw _privateConstructorUsedError;
  @JsonKey(name: 'archetype')
  String? get archetype => throw _privateConstructorUsedError;
  @JsonKey(name: 'raw_response')
  Map<String, dynamic>? get rawResponse => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this VoiceRefinementBaseline to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VoiceRefinementBaseline
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VoiceRefinementBaselineCopyWith<VoiceRefinementBaseline> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoiceRefinementBaselineCopyWith<$Res> {
  factory $VoiceRefinementBaselineCopyWith(VoiceRefinementBaseline value,
          $Res Function(VoiceRefinementBaseline) then) =
      _$VoiceRefinementBaselineCopyWithImpl<$Res, VoiceRefinementBaseline>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'audio_object_key') String? audioObjectKey,
      @JsonKey(name: 'audio_mime_type') String? audioMimeType,
      @JsonKey(name: 'recording_upload_status') String? recordingUploadStatus,
      @JsonKey(name: 'attempt_status') String? attemptStatus,
      @JsonKey(name: 'analysis_status') String? analysisStatus,
      @JsonKey(name: 'analysis_error') String? analysisError,
      @JsonKey(name: 'prompt_kind') String? promptKind,
      Map<String, dynamic>? scores,
      Map<String, dynamic>? metrics,
      String? transcript,
      @JsonKey(name: 'coach_feedback') String? coachFeedback,
      @JsonKey(name: 'natural_range') Map<String, dynamic>? naturalRange,
      @JsonKey(name: 'archetype') String? archetype,
      @JsonKey(name: 'raw_response') Map<String, dynamic>? rawResponse,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class _$VoiceRefinementBaselineCopyWithImpl<$Res,
        $Val extends VoiceRefinementBaseline>
    implements $VoiceRefinementBaselineCopyWith<$Res> {
  _$VoiceRefinementBaselineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VoiceRefinementBaseline
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? audioObjectKey = freezed,
    Object? audioMimeType = freezed,
    Object? recordingUploadStatus = freezed,
    Object? attemptStatus = freezed,
    Object? analysisStatus = freezed,
    Object? analysisError = freezed,
    Object? promptKind = freezed,
    Object? scores = freezed,
    Object? metrics = freezed,
    Object? transcript = freezed,
    Object? coachFeedback = freezed,
    Object? naturalRange = freezed,
    Object? archetype = freezed,
    Object? rawResponse = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      audioObjectKey: freezed == audioObjectKey
          ? _value.audioObjectKey
          : audioObjectKey // ignore: cast_nullable_to_non_nullable
              as String?,
      audioMimeType: freezed == audioMimeType
          ? _value.audioMimeType
          : audioMimeType // ignore: cast_nullable_to_non_nullable
              as String?,
      recordingUploadStatus: freezed == recordingUploadStatus
          ? _value.recordingUploadStatus
          : recordingUploadStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      attemptStatus: freezed == attemptStatus
          ? _value.attemptStatus
          : attemptStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      analysisStatus: freezed == analysisStatus
          ? _value.analysisStatus
          : analysisStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      analysisError: freezed == analysisError
          ? _value.analysisError
          : analysisError // ignore: cast_nullable_to_non_nullable
              as String?,
      promptKind: freezed == promptKind
          ? _value.promptKind
          : promptKind // ignore: cast_nullable_to_non_nullable
              as String?,
      scores: freezed == scores
          ? _value.scores
          : scores // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      metrics: freezed == metrics
          ? _value.metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      transcript: freezed == transcript
          ? _value.transcript
          : transcript // ignore: cast_nullable_to_non_nullable
              as String?,
      coachFeedback: freezed == coachFeedback
          ? _value.coachFeedback
          : coachFeedback // ignore: cast_nullable_to_non_nullable
              as String?,
      naturalRange: freezed == naturalRange
          ? _value.naturalRange
          : naturalRange // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      archetype: freezed == archetype
          ? _value.archetype
          : archetype // ignore: cast_nullable_to_non_nullable
              as String?,
      rawResponse: freezed == rawResponse
          ? _value.rawResponse
          : rawResponse // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VoiceRefinementBaselineImplCopyWith<$Res>
    implements $VoiceRefinementBaselineCopyWith<$Res> {
  factory _$$VoiceRefinementBaselineImplCopyWith(
          _$VoiceRefinementBaselineImpl value,
          $Res Function(_$VoiceRefinementBaselineImpl) then) =
      __$$VoiceRefinementBaselineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'audio_object_key') String? audioObjectKey,
      @JsonKey(name: 'audio_mime_type') String? audioMimeType,
      @JsonKey(name: 'recording_upload_status') String? recordingUploadStatus,
      @JsonKey(name: 'attempt_status') String? attemptStatus,
      @JsonKey(name: 'analysis_status') String? analysisStatus,
      @JsonKey(name: 'analysis_error') String? analysisError,
      @JsonKey(name: 'prompt_kind') String? promptKind,
      Map<String, dynamic>? scores,
      Map<String, dynamic>? metrics,
      String? transcript,
      @JsonKey(name: 'coach_feedback') String? coachFeedback,
      @JsonKey(name: 'natural_range') Map<String, dynamic>? naturalRange,
      @JsonKey(name: 'archetype') String? archetype,
      @JsonKey(name: 'raw_response') Map<String, dynamic>? rawResponse,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class __$$VoiceRefinementBaselineImplCopyWithImpl<$Res>
    extends _$VoiceRefinementBaselineCopyWithImpl<$Res,
        _$VoiceRefinementBaselineImpl>
    implements _$$VoiceRefinementBaselineImplCopyWith<$Res> {
  __$$VoiceRefinementBaselineImplCopyWithImpl(
      _$VoiceRefinementBaselineImpl _value,
      $Res Function(_$VoiceRefinementBaselineImpl) _then)
      : super(_value, _then);

  /// Create a copy of VoiceRefinementBaseline
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? audioObjectKey = freezed,
    Object? audioMimeType = freezed,
    Object? recordingUploadStatus = freezed,
    Object? attemptStatus = freezed,
    Object? analysisStatus = freezed,
    Object? analysisError = freezed,
    Object? promptKind = freezed,
    Object? scores = freezed,
    Object? metrics = freezed,
    Object? transcript = freezed,
    Object? coachFeedback = freezed,
    Object? naturalRange = freezed,
    Object? archetype = freezed,
    Object? rawResponse = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$VoiceRefinementBaselineImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      audioObjectKey: freezed == audioObjectKey
          ? _value.audioObjectKey
          : audioObjectKey // ignore: cast_nullable_to_non_nullable
              as String?,
      audioMimeType: freezed == audioMimeType
          ? _value.audioMimeType
          : audioMimeType // ignore: cast_nullable_to_non_nullable
              as String?,
      recordingUploadStatus: freezed == recordingUploadStatus
          ? _value.recordingUploadStatus
          : recordingUploadStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      attemptStatus: freezed == attemptStatus
          ? _value.attemptStatus
          : attemptStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      analysisStatus: freezed == analysisStatus
          ? _value.analysisStatus
          : analysisStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      analysisError: freezed == analysisError
          ? _value.analysisError
          : analysisError // ignore: cast_nullable_to_non_nullable
              as String?,
      promptKind: freezed == promptKind
          ? _value.promptKind
          : promptKind // ignore: cast_nullable_to_non_nullable
              as String?,
      scores: freezed == scores
          ? _value._scores
          : scores // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      metrics: freezed == metrics
          ? _value._metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      transcript: freezed == transcript
          ? _value.transcript
          : transcript // ignore: cast_nullable_to_non_nullable
              as String?,
      coachFeedback: freezed == coachFeedback
          ? _value.coachFeedback
          : coachFeedback // ignore: cast_nullable_to_non_nullable
              as String?,
      naturalRange: freezed == naturalRange
          ? _value._naturalRange
          : naturalRange // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      archetype: freezed == archetype
          ? _value.archetype
          : archetype // ignore: cast_nullable_to_non_nullable
              as String?,
      rawResponse: freezed == rawResponse
          ? _value._rawResponse
          : rawResponse // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VoiceRefinementBaselineImpl implements _VoiceRefinementBaseline {
  const _$VoiceRefinementBaselineImpl(
      {required this.id,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'audio_object_key') this.audioObjectKey,
      @JsonKey(name: 'audio_mime_type') this.audioMimeType,
      @JsonKey(name: 'recording_upload_status') this.recordingUploadStatus,
      @JsonKey(name: 'attempt_status') this.attemptStatus,
      @JsonKey(name: 'analysis_status') this.analysisStatus,
      @JsonKey(name: 'analysis_error') this.analysisError,
      @JsonKey(name: 'prompt_kind') this.promptKind,
      final Map<String, dynamic>? scores,
      final Map<String, dynamic>? metrics,
      this.transcript,
      @JsonKey(name: 'coach_feedback') this.coachFeedback,
      @JsonKey(name: 'natural_range') final Map<String, dynamic>? naturalRange,
      @JsonKey(name: 'archetype') this.archetype,
      @JsonKey(name: 'raw_response') final Map<String, dynamic>? rawResponse,
      @JsonKey(name: 'created_at') this.createdAt})
      : _scores = scores,
        _metrics = metrics,
        _naturalRange = naturalRange,
        _rawResponse = rawResponse;

  factory _$VoiceRefinementBaselineImpl.fromJson(Map<String, dynamic> json) =>
      _$$VoiceRefinementBaselineImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  @JsonKey(name: 'audio_object_key')
  final String? audioObjectKey;
  @override
  @JsonKey(name: 'audio_mime_type')
  final String? audioMimeType;
  @override
  @JsonKey(name: 'recording_upload_status')
  final String? recordingUploadStatus;
  @override
  @JsonKey(name: 'attempt_status')
  final String? attemptStatus;
  @override
  @JsonKey(name: 'analysis_status')
  final String? analysisStatus;
  @override
  @JsonKey(name: 'analysis_error')
  final String? analysisError;
  @override
  @JsonKey(name: 'prompt_kind')
  final String? promptKind;
  final Map<String, dynamic>? _scores;
  @override
  Map<String, dynamic>? get scores {
    final value = _scores;
    if (value == null) return null;
    if (_scores is EqualUnmodifiableMapView) return _scores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

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
  @override
  @JsonKey(name: 'coach_feedback')
  final String? coachFeedback;
  final Map<String, dynamic>? _naturalRange;
  @override
  @JsonKey(name: 'natural_range')
  Map<String, dynamic>? get naturalRange {
    final value = _naturalRange;
    if (value == null) return null;
    if (_naturalRange is EqualUnmodifiableMapView) return _naturalRange;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'archetype')
  final String? archetype;
  final Map<String, dynamic>? _rawResponse;
  @override
  @JsonKey(name: 'raw_response')
  Map<String, dynamic>? get rawResponse {
    final value = _rawResponse;
    if (value == null) return null;
    if (_rawResponse is EqualUnmodifiableMapView) return _rawResponse;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'VoiceRefinementBaseline(id: $id, userId: $userId, audioObjectKey: $audioObjectKey, audioMimeType: $audioMimeType, recordingUploadStatus: $recordingUploadStatus, attemptStatus: $attemptStatus, analysisStatus: $analysisStatus, analysisError: $analysisError, promptKind: $promptKind, scores: $scores, metrics: $metrics, transcript: $transcript, coachFeedback: $coachFeedback, naturalRange: $naturalRange, archetype: $archetype, rawResponse: $rawResponse, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoiceRefinementBaselineImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.audioObjectKey, audioObjectKey) ||
                other.audioObjectKey == audioObjectKey) &&
            (identical(other.audioMimeType, audioMimeType) ||
                other.audioMimeType == audioMimeType) &&
            (identical(other.recordingUploadStatus, recordingUploadStatus) ||
                other.recordingUploadStatus == recordingUploadStatus) &&
            (identical(other.attemptStatus, attemptStatus) ||
                other.attemptStatus == attemptStatus) &&
            (identical(other.analysisStatus, analysisStatus) ||
                other.analysisStatus == analysisStatus) &&
            (identical(other.analysisError, analysisError) ||
                other.analysisError == analysisError) &&
            (identical(other.promptKind, promptKind) ||
                other.promptKind == promptKind) &&
            const DeepCollectionEquality().equals(other._scores, _scores) &&
            const DeepCollectionEquality().equals(other._metrics, _metrics) &&
            (identical(other.transcript, transcript) ||
                other.transcript == transcript) &&
            (identical(other.coachFeedback, coachFeedback) ||
                other.coachFeedback == coachFeedback) &&
            const DeepCollectionEquality()
                .equals(other._naturalRange, _naturalRange) &&
            (identical(other.archetype, archetype) ||
                other.archetype == archetype) &&
            const DeepCollectionEquality()
                .equals(other._rawResponse, _rawResponse) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      audioObjectKey,
      audioMimeType,
      recordingUploadStatus,
      attemptStatus,
      analysisStatus,
      analysisError,
      promptKind,
      const DeepCollectionEquality().hash(_scores),
      const DeepCollectionEquality().hash(_metrics),
      transcript,
      coachFeedback,
      const DeepCollectionEquality().hash(_naturalRange),
      archetype,
      const DeepCollectionEquality().hash(_rawResponse),
      createdAt);

  /// Create a copy of VoiceRefinementBaseline
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VoiceRefinementBaselineImplCopyWith<_$VoiceRefinementBaselineImpl>
      get copyWith => __$$VoiceRefinementBaselineImplCopyWithImpl<
          _$VoiceRefinementBaselineImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VoiceRefinementBaselineImplToJson(
      this,
    );
  }
}

abstract class _VoiceRefinementBaseline implements VoiceRefinementBaseline {
  const factory _VoiceRefinementBaseline(
      {required final String id,
      @JsonKey(name: 'user_id') final String? userId,
      @JsonKey(name: 'audio_object_key') final String? audioObjectKey,
      @JsonKey(name: 'audio_mime_type') final String? audioMimeType,
      @JsonKey(name: 'recording_upload_status')
      final String? recordingUploadStatus,
      @JsonKey(name: 'attempt_status') final String? attemptStatus,
      @JsonKey(name: 'analysis_status') final String? analysisStatus,
      @JsonKey(name: 'analysis_error') final String? analysisError,
      @JsonKey(name: 'prompt_kind') final String? promptKind,
      final Map<String, dynamic>? scores,
      final Map<String, dynamic>? metrics,
      final String? transcript,
      @JsonKey(name: 'coach_feedback') final String? coachFeedback,
      @JsonKey(name: 'natural_range') final Map<String, dynamic>? naturalRange,
      @JsonKey(name: 'archetype') final String? archetype,
      @JsonKey(name: 'raw_response') final Map<String, dynamic>? rawResponse,
      @JsonKey(name: 'created_at')
      final DateTime? createdAt}) = _$VoiceRefinementBaselineImpl;

  factory _VoiceRefinementBaseline.fromJson(Map<String, dynamic> json) =
      _$VoiceRefinementBaselineImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  @JsonKey(name: 'audio_object_key')
  String? get audioObjectKey;
  @override
  @JsonKey(name: 'audio_mime_type')
  String? get audioMimeType;
  @override
  @JsonKey(name: 'recording_upload_status')
  String? get recordingUploadStatus;
  @override
  @JsonKey(name: 'attempt_status')
  String? get attemptStatus;
  @override
  @JsonKey(name: 'analysis_status')
  String? get analysisStatus;
  @override
  @JsonKey(name: 'analysis_error')
  String? get analysisError;
  @override
  @JsonKey(name: 'prompt_kind')
  String? get promptKind;
  @override
  Map<String, dynamic>? get scores;
  @override
  Map<String, dynamic>? get metrics;
  @override
  String? get transcript;
  @override
  @JsonKey(name: 'coach_feedback')
  String? get coachFeedback;
  @override
  @JsonKey(name: 'natural_range')
  Map<String, dynamic>? get naturalRange;
  @override
  @JsonKey(name: 'archetype')
  String? get archetype;
  @override
  @JsonKey(name: 'raw_response')
  Map<String, dynamic>? get rawResponse;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of VoiceRefinementBaseline
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VoiceRefinementBaselineImplCopyWith<_$VoiceRefinementBaselineImpl>
      get copyWith => throw _privateConstructorUsedError;
}

VoiceRefinementUpload _$VoiceRefinementUploadFromJson(
    Map<String, dynamic> json) {
  return _VoiceRefinementUpload.fromJson(json);
}

/// @nodoc
mixin _$VoiceRefinementUpload {
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'object_key')
  String get objectKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'content_type')
  String get contentType => throw _privateConstructorUsedError;

  /// Serializes this VoiceRefinementUpload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VoiceRefinementUpload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VoiceRefinementUploadCopyWith<VoiceRefinementUpload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoiceRefinementUploadCopyWith<$Res> {
  factory $VoiceRefinementUploadCopyWith(VoiceRefinementUpload value,
          $Res Function(VoiceRefinementUpload) then) =
      _$VoiceRefinementUploadCopyWithImpl<$Res, VoiceRefinementUpload>;
  @useResult
  $Res call(
      {String url,
      @JsonKey(name: 'object_key') String objectKey,
      @JsonKey(name: 'content_type') String contentType});
}

/// @nodoc
class _$VoiceRefinementUploadCopyWithImpl<$Res,
        $Val extends VoiceRefinementUpload>
    implements $VoiceRefinementUploadCopyWith<$Res> {
  _$VoiceRefinementUploadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VoiceRefinementUpload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? objectKey = null,
    Object? contentType = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      objectKey: null == objectKey
          ? _value.objectKey
          : objectKey // ignore: cast_nullable_to_non_nullable
              as String,
      contentType: null == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VoiceRefinementUploadImplCopyWith<$Res>
    implements $VoiceRefinementUploadCopyWith<$Res> {
  factory _$$VoiceRefinementUploadImplCopyWith(
          _$VoiceRefinementUploadImpl value,
          $Res Function(_$VoiceRefinementUploadImpl) then) =
      __$$VoiceRefinementUploadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String url,
      @JsonKey(name: 'object_key') String objectKey,
      @JsonKey(name: 'content_type') String contentType});
}

/// @nodoc
class __$$VoiceRefinementUploadImplCopyWithImpl<$Res>
    extends _$VoiceRefinementUploadCopyWithImpl<$Res,
        _$VoiceRefinementUploadImpl>
    implements _$$VoiceRefinementUploadImplCopyWith<$Res> {
  __$$VoiceRefinementUploadImplCopyWithImpl(_$VoiceRefinementUploadImpl _value,
      $Res Function(_$VoiceRefinementUploadImpl) _then)
      : super(_value, _then);

  /// Create a copy of VoiceRefinementUpload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? objectKey = null,
    Object? contentType = null,
  }) {
    return _then(_$VoiceRefinementUploadImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      objectKey: null == objectKey
          ? _value.objectKey
          : objectKey // ignore: cast_nullable_to_non_nullable
              as String,
      contentType: null == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VoiceRefinementUploadImpl implements _VoiceRefinementUpload {
  const _$VoiceRefinementUploadImpl(
      {required this.url,
      @JsonKey(name: 'object_key') required this.objectKey,
      @JsonKey(name: 'content_type') required this.contentType});

  factory _$VoiceRefinementUploadImpl.fromJson(Map<String, dynamic> json) =>
      _$$VoiceRefinementUploadImplFromJson(json);

  @override
  final String url;
  @override
  @JsonKey(name: 'object_key')
  final String objectKey;
  @override
  @JsonKey(name: 'content_type')
  final String contentType;

  @override
  String toString() {
    return 'VoiceRefinementUpload(url: $url, objectKey: $objectKey, contentType: $contentType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoiceRefinementUploadImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.objectKey, objectKey) ||
                other.objectKey == objectKey) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, objectKey, contentType);

  /// Create a copy of VoiceRefinementUpload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VoiceRefinementUploadImplCopyWith<_$VoiceRefinementUploadImpl>
      get copyWith => __$$VoiceRefinementUploadImplCopyWithImpl<
          _$VoiceRefinementUploadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VoiceRefinementUploadImplToJson(
      this,
    );
  }
}

abstract class _VoiceRefinementUpload implements VoiceRefinementUpload {
  const factory _VoiceRefinementUpload(
          {required final String url,
          @JsonKey(name: 'object_key') required final String objectKey,
          @JsonKey(name: 'content_type') required final String contentType}) =
      _$VoiceRefinementUploadImpl;

  factory _VoiceRefinementUpload.fromJson(Map<String, dynamic> json) =
      _$VoiceRefinementUploadImpl.fromJson;

  @override
  String get url;
  @override
  @JsonKey(name: 'object_key')
  String get objectKey;
  @override
  @JsonKey(name: 'content_type')
  String get contentType;

  /// Create a copy of VoiceRefinementUpload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VoiceRefinementUploadImplCopyWith<_$VoiceRefinementUploadImpl>
      get copyWith => throw _privateConstructorUsedError;
}

VoiceRefinementBaselineStart _$VoiceRefinementBaselineStartFromJson(
    Map<String, dynamic> json) {
  return _VoiceRefinementBaselineStart.fromJson(json);
}

/// @nodoc
mixin _$VoiceRefinementBaselineStart {
  VoiceRefinementBaseline get baseline => throw _privateConstructorUsedError;
  VoiceRefinementUpload get upload => throw _privateConstructorUsedError;

  /// Serializes this VoiceRefinementBaselineStart to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VoiceRefinementBaselineStart
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VoiceRefinementBaselineStartCopyWith<VoiceRefinementBaselineStart>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoiceRefinementBaselineStartCopyWith<$Res> {
  factory $VoiceRefinementBaselineStartCopyWith(
          VoiceRefinementBaselineStart value,
          $Res Function(VoiceRefinementBaselineStart) then) =
      _$VoiceRefinementBaselineStartCopyWithImpl<$Res,
          VoiceRefinementBaselineStart>;
  @useResult
  $Res call({VoiceRefinementBaseline baseline, VoiceRefinementUpload upload});

  $VoiceRefinementBaselineCopyWith<$Res> get baseline;
  $VoiceRefinementUploadCopyWith<$Res> get upload;
}

/// @nodoc
class _$VoiceRefinementBaselineStartCopyWithImpl<$Res,
        $Val extends VoiceRefinementBaselineStart>
    implements $VoiceRefinementBaselineStartCopyWith<$Res> {
  _$VoiceRefinementBaselineStartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VoiceRefinementBaselineStart
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseline = null,
    Object? upload = null,
  }) {
    return _then(_value.copyWith(
      baseline: null == baseline
          ? _value.baseline
          : baseline // ignore: cast_nullable_to_non_nullable
              as VoiceRefinementBaseline,
      upload: null == upload
          ? _value.upload
          : upload // ignore: cast_nullable_to_non_nullable
              as VoiceRefinementUpload,
    ) as $Val);
  }

  /// Create a copy of VoiceRefinementBaselineStart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VoiceRefinementBaselineCopyWith<$Res> get baseline {
    return $VoiceRefinementBaselineCopyWith<$Res>(_value.baseline, (value) {
      return _then(_value.copyWith(baseline: value) as $Val);
    });
  }

  /// Create a copy of VoiceRefinementBaselineStart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VoiceRefinementUploadCopyWith<$Res> get upload {
    return $VoiceRefinementUploadCopyWith<$Res>(_value.upload, (value) {
      return _then(_value.copyWith(upload: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VoiceRefinementBaselineStartImplCopyWith<$Res>
    implements $VoiceRefinementBaselineStartCopyWith<$Res> {
  factory _$$VoiceRefinementBaselineStartImplCopyWith(
          _$VoiceRefinementBaselineStartImpl value,
          $Res Function(_$VoiceRefinementBaselineStartImpl) then) =
      __$$VoiceRefinementBaselineStartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({VoiceRefinementBaseline baseline, VoiceRefinementUpload upload});

  @override
  $VoiceRefinementBaselineCopyWith<$Res> get baseline;
  @override
  $VoiceRefinementUploadCopyWith<$Res> get upload;
}

/// @nodoc
class __$$VoiceRefinementBaselineStartImplCopyWithImpl<$Res>
    extends _$VoiceRefinementBaselineStartCopyWithImpl<$Res,
        _$VoiceRefinementBaselineStartImpl>
    implements _$$VoiceRefinementBaselineStartImplCopyWith<$Res> {
  __$$VoiceRefinementBaselineStartImplCopyWithImpl(
      _$VoiceRefinementBaselineStartImpl _value,
      $Res Function(_$VoiceRefinementBaselineStartImpl) _then)
      : super(_value, _then);

  /// Create a copy of VoiceRefinementBaselineStart
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseline = null,
    Object? upload = null,
  }) {
    return _then(_$VoiceRefinementBaselineStartImpl(
      baseline: null == baseline
          ? _value.baseline
          : baseline // ignore: cast_nullable_to_non_nullable
              as VoiceRefinementBaseline,
      upload: null == upload
          ? _value.upload
          : upload // ignore: cast_nullable_to_non_nullable
              as VoiceRefinementUpload,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VoiceRefinementBaselineStartImpl
    implements _VoiceRefinementBaselineStart {
  const _$VoiceRefinementBaselineStartImpl(
      {required this.baseline, required this.upload});

  factory _$VoiceRefinementBaselineStartImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$VoiceRefinementBaselineStartImplFromJson(json);

  @override
  final VoiceRefinementBaseline baseline;
  @override
  final VoiceRefinementUpload upload;

  @override
  String toString() {
    return 'VoiceRefinementBaselineStart(baseline: $baseline, upload: $upload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoiceRefinementBaselineStartImpl &&
            (identical(other.baseline, baseline) ||
                other.baseline == baseline) &&
            (identical(other.upload, upload) || other.upload == upload));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, baseline, upload);

  /// Create a copy of VoiceRefinementBaselineStart
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VoiceRefinementBaselineStartImplCopyWith<
          _$VoiceRefinementBaselineStartImpl>
      get copyWith => __$$VoiceRefinementBaselineStartImplCopyWithImpl<
          _$VoiceRefinementBaselineStartImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VoiceRefinementBaselineStartImplToJson(
      this,
    );
  }
}

abstract class _VoiceRefinementBaselineStart
    implements VoiceRefinementBaselineStart {
  const factory _VoiceRefinementBaselineStart(
          {required final VoiceRefinementBaseline baseline,
          required final VoiceRefinementUpload upload}) =
      _$VoiceRefinementBaselineStartImpl;

  factory _VoiceRefinementBaselineStart.fromJson(Map<String, dynamic> json) =
      _$VoiceRefinementBaselineStartImpl.fromJson;

  @override
  VoiceRefinementBaseline get baseline;
  @override
  VoiceRefinementUpload get upload;

  /// Create a copy of VoiceRefinementBaselineStart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VoiceRefinementBaselineStartImplCopyWith<
          _$VoiceRefinementBaselineStartImpl>
      get copyWith => throw _privateConstructorUsedError;
}

VoiceRefinementTargetIntent _$VoiceRefinementTargetIntentFromJson(
    Map<String, dynamic> json) {
  return _VoiceRefinementTargetIntent.fromJson(json);
}

/// @nodoc
mixin _$VoiceRefinementTargetIntent {
  @JsonKey(name: 'pitch_semitones')
  double get pitchSemitones => throw _privateConstructorUsedError;
  @JsonKey(name: 'speed_ratio')
  double get speedRatio => throw _privateConstructorUsedError;
  double get resonance => throw _privateConstructorUsedError;
  double get brightness => throw _privateConstructorUsedError;

  /// Serializes this VoiceRefinementTargetIntent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VoiceRefinementTargetIntent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VoiceRefinementTargetIntentCopyWith<VoiceRefinementTargetIntent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoiceRefinementTargetIntentCopyWith<$Res> {
  factory $VoiceRefinementTargetIntentCopyWith(
          VoiceRefinementTargetIntent value,
          $Res Function(VoiceRefinementTargetIntent) then) =
      _$VoiceRefinementTargetIntentCopyWithImpl<$Res,
          VoiceRefinementTargetIntent>;
  @useResult
  $Res call(
      {@JsonKey(name: 'pitch_semitones') double pitchSemitones,
      @JsonKey(name: 'speed_ratio') double speedRatio,
      double resonance,
      double brightness});
}

/// @nodoc
class _$VoiceRefinementTargetIntentCopyWithImpl<$Res,
        $Val extends VoiceRefinementTargetIntent>
    implements $VoiceRefinementTargetIntentCopyWith<$Res> {
  _$VoiceRefinementTargetIntentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VoiceRefinementTargetIntent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pitchSemitones = null,
    Object? speedRatio = null,
    Object? resonance = null,
    Object? brightness = null,
  }) {
    return _then(_value.copyWith(
      pitchSemitones: null == pitchSemitones
          ? _value.pitchSemitones
          : pitchSemitones // ignore: cast_nullable_to_non_nullable
              as double,
      speedRatio: null == speedRatio
          ? _value.speedRatio
          : speedRatio // ignore: cast_nullable_to_non_nullable
              as double,
      resonance: null == resonance
          ? _value.resonance
          : resonance // ignore: cast_nullable_to_non_nullable
              as double,
      brightness: null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VoiceRefinementTargetIntentImplCopyWith<$Res>
    implements $VoiceRefinementTargetIntentCopyWith<$Res> {
  factory _$$VoiceRefinementTargetIntentImplCopyWith(
          _$VoiceRefinementTargetIntentImpl value,
          $Res Function(_$VoiceRefinementTargetIntentImpl) then) =
      __$$VoiceRefinementTargetIntentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'pitch_semitones') double pitchSemitones,
      @JsonKey(name: 'speed_ratio') double speedRatio,
      double resonance,
      double brightness});
}

/// @nodoc
class __$$VoiceRefinementTargetIntentImplCopyWithImpl<$Res>
    extends _$VoiceRefinementTargetIntentCopyWithImpl<$Res,
        _$VoiceRefinementTargetIntentImpl>
    implements _$$VoiceRefinementTargetIntentImplCopyWith<$Res> {
  __$$VoiceRefinementTargetIntentImplCopyWithImpl(
      _$VoiceRefinementTargetIntentImpl _value,
      $Res Function(_$VoiceRefinementTargetIntentImpl) _then)
      : super(_value, _then);

  /// Create a copy of VoiceRefinementTargetIntent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pitchSemitones = null,
    Object? speedRatio = null,
    Object? resonance = null,
    Object? brightness = null,
  }) {
    return _then(_$VoiceRefinementTargetIntentImpl(
      pitchSemitones: null == pitchSemitones
          ? _value.pitchSemitones
          : pitchSemitones // ignore: cast_nullable_to_non_nullable
              as double,
      speedRatio: null == speedRatio
          ? _value.speedRatio
          : speedRatio // ignore: cast_nullable_to_non_nullable
              as double,
      resonance: null == resonance
          ? _value.resonance
          : resonance // ignore: cast_nullable_to_non_nullable
              as double,
      brightness: null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VoiceRefinementTargetIntentImpl
    implements _VoiceRefinementTargetIntent {
  const _$VoiceRefinementTargetIntentImpl(
      {@JsonKey(name: 'pitch_semitones') this.pitchSemitones = 0.0,
      @JsonKey(name: 'speed_ratio') this.speedRatio = 1.0,
      this.resonance = 0.0,
      this.brightness = 0.0});

  factory _$VoiceRefinementTargetIntentImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$VoiceRefinementTargetIntentImplFromJson(json);

  @override
  @JsonKey(name: 'pitch_semitones')
  final double pitchSemitones;
  @override
  @JsonKey(name: 'speed_ratio')
  final double speedRatio;
  @override
  @JsonKey()
  final double resonance;
  @override
  @JsonKey()
  final double brightness;

  @override
  String toString() {
    return 'VoiceRefinementTargetIntent(pitchSemitones: $pitchSemitones, speedRatio: $speedRatio, resonance: $resonance, brightness: $brightness)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoiceRefinementTargetIntentImpl &&
            (identical(other.pitchSemitones, pitchSemitones) ||
                other.pitchSemitones == pitchSemitones) &&
            (identical(other.speedRatio, speedRatio) ||
                other.speedRatio == speedRatio) &&
            (identical(other.resonance, resonance) ||
                other.resonance == resonance) &&
            (identical(other.brightness, brightness) ||
                other.brightness == brightness));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, pitchSemitones, speedRatio, resonance, brightness);

  /// Create a copy of VoiceRefinementTargetIntent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VoiceRefinementTargetIntentImplCopyWith<_$VoiceRefinementTargetIntentImpl>
      get copyWith => __$$VoiceRefinementTargetIntentImplCopyWithImpl<
          _$VoiceRefinementTargetIntentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VoiceRefinementTargetIntentImplToJson(
      this,
    );
  }
}

abstract class _VoiceRefinementTargetIntent
    implements VoiceRefinementTargetIntent {
  const factory _VoiceRefinementTargetIntent(
      {@JsonKey(name: 'pitch_semitones') final double pitchSemitones,
      @JsonKey(name: 'speed_ratio') final double speedRatio,
      final double resonance,
      final double brightness}) = _$VoiceRefinementTargetIntentImpl;

  factory _VoiceRefinementTargetIntent.fromJson(Map<String, dynamic> json) =
      _$VoiceRefinementTargetIntentImpl.fromJson;

  @override
  @JsonKey(name: 'pitch_semitones')
  double get pitchSemitones;
  @override
  @JsonKey(name: 'speed_ratio')
  double get speedRatio;
  @override
  double get resonance;
  @override
  double get brightness;

  /// Create a copy of VoiceRefinementTargetIntent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VoiceRefinementTargetIntentImplCopyWith<_$VoiceRefinementTargetIntentImpl>
      get copyWith => throw _privateConstructorUsedError;
}

VoiceRefinementPlan _$VoiceRefinementPlanFromJson(Map<String, dynamic> json) {
  return _VoiceRefinementPlan.fromJson(json);
}

/// @nodoc
mixin _$VoiceRefinementPlan {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'target_id')
  String? get targetId => throw _privateConstructorUsedError;
  @JsonKey(name: 'baseline_id')
  String? get baselineId => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'target_intent')
  Map<String, dynamic>? get targetIntent => throw _privateConstructorUsedError;
  @JsonKey(name: 'activities')
  List<Map<String, dynamic>>? get activities =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this VoiceRefinementPlan to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VoiceRefinementPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VoiceRefinementPlanCopyWith<VoiceRefinementPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoiceRefinementPlanCopyWith<$Res> {
  factory $VoiceRefinementPlanCopyWith(
          VoiceRefinementPlan value, $Res Function(VoiceRefinementPlan) then) =
      _$VoiceRefinementPlanCopyWithImpl<$Res, VoiceRefinementPlan>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'target_id') String? targetId,
      @JsonKey(name: 'baseline_id') String? baselineId,
      String? status,
      @JsonKey(name: 'target_intent') Map<String, dynamic>? targetIntent,
      @JsonKey(name: 'activities') List<Map<String, dynamic>>? activities,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class _$VoiceRefinementPlanCopyWithImpl<$Res, $Val extends VoiceRefinementPlan>
    implements $VoiceRefinementPlanCopyWith<$Res> {
  _$VoiceRefinementPlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VoiceRefinementPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? targetId = freezed,
    Object? baselineId = freezed,
    Object? status = freezed,
    Object? targetIntent = freezed,
    Object? activities = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      targetId: freezed == targetId
          ? _value.targetId
          : targetId // ignore: cast_nullable_to_non_nullable
              as String?,
      baselineId: freezed == baselineId
          ? _value.baselineId
          : baselineId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      targetIntent: freezed == targetIntent
          ? _value.targetIntent
          : targetIntent // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      activities: freezed == activities
          ? _value.activities
          : activities // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VoiceRefinementPlanImplCopyWith<$Res>
    implements $VoiceRefinementPlanCopyWith<$Res> {
  factory _$$VoiceRefinementPlanImplCopyWith(_$VoiceRefinementPlanImpl value,
          $Res Function(_$VoiceRefinementPlanImpl) then) =
      __$$VoiceRefinementPlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'target_id') String? targetId,
      @JsonKey(name: 'baseline_id') String? baselineId,
      String? status,
      @JsonKey(name: 'target_intent') Map<String, dynamic>? targetIntent,
      @JsonKey(name: 'activities') List<Map<String, dynamic>>? activities,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class __$$VoiceRefinementPlanImplCopyWithImpl<$Res>
    extends _$VoiceRefinementPlanCopyWithImpl<$Res, _$VoiceRefinementPlanImpl>
    implements _$$VoiceRefinementPlanImplCopyWith<$Res> {
  __$$VoiceRefinementPlanImplCopyWithImpl(_$VoiceRefinementPlanImpl _value,
      $Res Function(_$VoiceRefinementPlanImpl) _then)
      : super(_value, _then);

  /// Create a copy of VoiceRefinementPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? targetId = freezed,
    Object? baselineId = freezed,
    Object? status = freezed,
    Object? targetIntent = freezed,
    Object? activities = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$VoiceRefinementPlanImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      targetId: freezed == targetId
          ? _value.targetId
          : targetId // ignore: cast_nullable_to_non_nullable
              as String?,
      baselineId: freezed == baselineId
          ? _value.baselineId
          : baselineId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      targetIntent: freezed == targetIntent
          ? _value._targetIntent
          : targetIntent // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      activities: freezed == activities
          ? _value._activities
          : activities // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VoiceRefinementPlanImpl implements _VoiceRefinementPlan {
  const _$VoiceRefinementPlanImpl(
      {required this.id,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'target_id') this.targetId,
      @JsonKey(name: 'baseline_id') this.baselineId,
      this.status,
      @JsonKey(name: 'target_intent') final Map<String, dynamic>? targetIntent,
      @JsonKey(name: 'activities') final List<Map<String, dynamic>>? activities,
      @JsonKey(name: 'created_at') this.createdAt})
      : _targetIntent = targetIntent,
        _activities = activities;

  factory _$VoiceRefinementPlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$VoiceRefinementPlanImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  @JsonKey(name: 'target_id')
  final String? targetId;
  @override
  @JsonKey(name: 'baseline_id')
  final String? baselineId;
  @override
  final String? status;
  final Map<String, dynamic>? _targetIntent;
  @override
  @JsonKey(name: 'target_intent')
  Map<String, dynamic>? get targetIntent {
    final value = _targetIntent;
    if (value == null) return null;
    if (_targetIntent is EqualUnmodifiableMapView) return _targetIntent;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<Map<String, dynamic>>? _activities;
  @override
  @JsonKey(name: 'activities')
  List<Map<String, dynamic>>? get activities {
    final value = _activities;
    if (value == null) return null;
    if (_activities is EqualUnmodifiableListView) return _activities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'VoiceRefinementPlan(id: $id, userId: $userId, targetId: $targetId, baselineId: $baselineId, status: $status, targetIntent: $targetIntent, activities: $activities, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoiceRefinementPlanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.targetId, targetId) ||
                other.targetId == targetId) &&
            (identical(other.baselineId, baselineId) ||
                other.baselineId == baselineId) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._targetIntent, _targetIntent) &&
            const DeepCollectionEquality()
                .equals(other._activities, _activities) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      targetId,
      baselineId,
      status,
      const DeepCollectionEquality().hash(_targetIntent),
      const DeepCollectionEquality().hash(_activities),
      createdAt);

  /// Create a copy of VoiceRefinementPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VoiceRefinementPlanImplCopyWith<_$VoiceRefinementPlanImpl> get copyWith =>
      __$$VoiceRefinementPlanImplCopyWithImpl<_$VoiceRefinementPlanImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VoiceRefinementPlanImplToJson(
      this,
    );
  }
}

abstract class _VoiceRefinementPlan implements VoiceRefinementPlan {
  const factory _VoiceRefinementPlan(
      {required final String id,
      @JsonKey(name: 'user_id') final String? userId,
      @JsonKey(name: 'target_id') final String? targetId,
      @JsonKey(name: 'baseline_id') final String? baselineId,
      final String? status,
      @JsonKey(name: 'target_intent') final Map<String, dynamic>? targetIntent,
      @JsonKey(name: 'activities') final List<Map<String, dynamic>>? activities,
      @JsonKey(name: 'created_at')
      final DateTime? createdAt}) = _$VoiceRefinementPlanImpl;

  factory _VoiceRefinementPlan.fromJson(Map<String, dynamic> json) =
      _$VoiceRefinementPlanImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  @JsonKey(name: 'target_id')
  String? get targetId;
  @override
  @JsonKey(name: 'baseline_id')
  String? get baselineId;
  @override
  String? get status;
  @override
  @JsonKey(name: 'target_intent')
  Map<String, dynamic>? get targetIntent;
  @override
  @JsonKey(name: 'activities')
  List<Map<String, dynamic>>? get activities;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of VoiceRefinementPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VoiceRefinementPlanImplCopyWith<_$VoiceRefinementPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VoiceRefinementAttempt _$VoiceRefinementAttemptFromJson(
    Map<String, dynamic> json) {
  return _VoiceRefinementAttempt.fromJson(json);
}

/// @nodoc
mixin _$VoiceRefinementAttempt {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'plan_id')
  String? get planId => throw _privateConstructorUsedError;
  @JsonKey(name: 'activity_id')
  String? get activityId => throw _privateConstructorUsedError;
  int? get day => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_checkpoint')
  bool? get isCheckpoint => throw _privateConstructorUsedError;
  @JsonKey(name: 'attempt_status')
  String? get attemptStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'analysis_status')
  String? get analysisStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'analysis_error')
  String? get analysisError => throw _privateConstructorUsedError;
  @JsonKey(name: 'recording_upload_status')
  String? get recordingUploadStatus => throw _privateConstructorUsedError;
  Map<String, dynamic>? get scores => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metrics => throw _privateConstructorUsedError;
  String? get transcript => throw _privateConstructorUsedError;
  @JsonKey(name: 'coach_feedback')
  String? get coachFeedback => throw _privateConstructorUsedError;

  /// Serializes this VoiceRefinementAttempt to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VoiceRefinementAttempt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VoiceRefinementAttemptCopyWith<VoiceRefinementAttempt> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoiceRefinementAttemptCopyWith<$Res> {
  factory $VoiceRefinementAttemptCopyWith(VoiceRefinementAttempt value,
          $Res Function(VoiceRefinementAttempt) then) =
      _$VoiceRefinementAttemptCopyWithImpl<$Res, VoiceRefinementAttempt>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'plan_id') String? planId,
      @JsonKey(name: 'activity_id') String? activityId,
      int? day,
      @JsonKey(name: 'is_checkpoint') bool? isCheckpoint,
      @JsonKey(name: 'attempt_status') String? attemptStatus,
      @JsonKey(name: 'analysis_status') String? analysisStatus,
      @JsonKey(name: 'analysis_error') String? analysisError,
      @JsonKey(name: 'recording_upload_status') String? recordingUploadStatus,
      Map<String, dynamic>? scores,
      Map<String, dynamic>? metrics,
      String? transcript,
      @JsonKey(name: 'coach_feedback') String? coachFeedback});
}

/// @nodoc
class _$VoiceRefinementAttemptCopyWithImpl<$Res,
        $Val extends VoiceRefinementAttempt>
    implements $VoiceRefinementAttemptCopyWith<$Res> {
  _$VoiceRefinementAttemptCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VoiceRefinementAttempt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? planId = freezed,
    Object? activityId = freezed,
    Object? day = freezed,
    Object? isCheckpoint = freezed,
    Object? attemptStatus = freezed,
    Object? analysisStatus = freezed,
    Object? analysisError = freezed,
    Object? recordingUploadStatus = freezed,
    Object? scores = freezed,
    Object? metrics = freezed,
    Object? transcript = freezed,
    Object? coachFeedback = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      planId: freezed == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as String?,
      activityId: freezed == activityId
          ? _value.activityId
          : activityId // ignore: cast_nullable_to_non_nullable
              as String?,
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int?,
      isCheckpoint: freezed == isCheckpoint
          ? _value.isCheckpoint
          : isCheckpoint // ignore: cast_nullable_to_non_nullable
              as bool?,
      attemptStatus: freezed == attemptStatus
          ? _value.attemptStatus
          : attemptStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      analysisStatus: freezed == analysisStatus
          ? _value.analysisStatus
          : analysisStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      analysisError: freezed == analysisError
          ? _value.analysisError
          : analysisError // ignore: cast_nullable_to_non_nullable
              as String?,
      recordingUploadStatus: freezed == recordingUploadStatus
          ? _value.recordingUploadStatus
          : recordingUploadStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      scores: freezed == scores
          ? _value.scores
          : scores // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      metrics: freezed == metrics
          ? _value.metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      transcript: freezed == transcript
          ? _value.transcript
          : transcript // ignore: cast_nullable_to_non_nullable
              as String?,
      coachFeedback: freezed == coachFeedback
          ? _value.coachFeedback
          : coachFeedback // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VoiceRefinementAttemptImplCopyWith<$Res>
    implements $VoiceRefinementAttemptCopyWith<$Res> {
  factory _$$VoiceRefinementAttemptImplCopyWith(
          _$VoiceRefinementAttemptImpl value,
          $Res Function(_$VoiceRefinementAttemptImpl) then) =
      __$$VoiceRefinementAttemptImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'plan_id') String? planId,
      @JsonKey(name: 'activity_id') String? activityId,
      int? day,
      @JsonKey(name: 'is_checkpoint') bool? isCheckpoint,
      @JsonKey(name: 'attempt_status') String? attemptStatus,
      @JsonKey(name: 'analysis_status') String? analysisStatus,
      @JsonKey(name: 'analysis_error') String? analysisError,
      @JsonKey(name: 'recording_upload_status') String? recordingUploadStatus,
      Map<String, dynamic>? scores,
      Map<String, dynamic>? metrics,
      String? transcript,
      @JsonKey(name: 'coach_feedback') String? coachFeedback});
}

/// @nodoc
class __$$VoiceRefinementAttemptImplCopyWithImpl<$Res>
    extends _$VoiceRefinementAttemptCopyWithImpl<$Res,
        _$VoiceRefinementAttemptImpl>
    implements _$$VoiceRefinementAttemptImplCopyWith<$Res> {
  __$$VoiceRefinementAttemptImplCopyWithImpl(
      _$VoiceRefinementAttemptImpl _value,
      $Res Function(_$VoiceRefinementAttemptImpl) _then)
      : super(_value, _then);

  /// Create a copy of VoiceRefinementAttempt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? planId = freezed,
    Object? activityId = freezed,
    Object? day = freezed,
    Object? isCheckpoint = freezed,
    Object? attemptStatus = freezed,
    Object? analysisStatus = freezed,
    Object? analysisError = freezed,
    Object? recordingUploadStatus = freezed,
    Object? scores = freezed,
    Object? metrics = freezed,
    Object? transcript = freezed,
    Object? coachFeedback = freezed,
  }) {
    return _then(_$VoiceRefinementAttemptImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      planId: freezed == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as String?,
      activityId: freezed == activityId
          ? _value.activityId
          : activityId // ignore: cast_nullable_to_non_nullable
              as String?,
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int?,
      isCheckpoint: freezed == isCheckpoint
          ? _value.isCheckpoint
          : isCheckpoint // ignore: cast_nullable_to_non_nullable
              as bool?,
      attemptStatus: freezed == attemptStatus
          ? _value.attemptStatus
          : attemptStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      analysisStatus: freezed == analysisStatus
          ? _value.analysisStatus
          : analysisStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      analysisError: freezed == analysisError
          ? _value.analysisError
          : analysisError // ignore: cast_nullable_to_non_nullable
              as String?,
      recordingUploadStatus: freezed == recordingUploadStatus
          ? _value.recordingUploadStatus
          : recordingUploadStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      scores: freezed == scores
          ? _value._scores
          : scores // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      metrics: freezed == metrics
          ? _value._metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      transcript: freezed == transcript
          ? _value.transcript
          : transcript // ignore: cast_nullable_to_non_nullable
              as String?,
      coachFeedback: freezed == coachFeedback
          ? _value.coachFeedback
          : coachFeedback // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VoiceRefinementAttemptImpl implements _VoiceRefinementAttempt {
  const _$VoiceRefinementAttemptImpl(
      {required this.id,
      @JsonKey(name: 'plan_id') this.planId,
      @JsonKey(name: 'activity_id') this.activityId,
      this.day,
      @JsonKey(name: 'is_checkpoint') this.isCheckpoint,
      @JsonKey(name: 'attempt_status') this.attemptStatus,
      @JsonKey(name: 'analysis_status') this.analysisStatus,
      @JsonKey(name: 'analysis_error') this.analysisError,
      @JsonKey(name: 'recording_upload_status') this.recordingUploadStatus,
      final Map<String, dynamic>? scores,
      final Map<String, dynamic>? metrics,
      this.transcript,
      @JsonKey(name: 'coach_feedback') this.coachFeedback})
      : _scores = scores,
        _metrics = metrics;

  factory _$VoiceRefinementAttemptImpl.fromJson(Map<String, dynamic> json) =>
      _$$VoiceRefinementAttemptImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'plan_id')
  final String? planId;
  @override
  @JsonKey(name: 'activity_id')
  final String? activityId;
  @override
  final int? day;
  @override
  @JsonKey(name: 'is_checkpoint')
  final bool? isCheckpoint;
  @override
  @JsonKey(name: 'attempt_status')
  final String? attemptStatus;
  @override
  @JsonKey(name: 'analysis_status')
  final String? analysisStatus;
  @override
  @JsonKey(name: 'analysis_error')
  final String? analysisError;
  @override
  @JsonKey(name: 'recording_upload_status')
  final String? recordingUploadStatus;
  final Map<String, dynamic>? _scores;
  @override
  Map<String, dynamic>? get scores {
    final value = _scores;
    if (value == null) return null;
    if (_scores is EqualUnmodifiableMapView) return _scores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

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
  @override
  @JsonKey(name: 'coach_feedback')
  final String? coachFeedback;

  @override
  String toString() {
    return 'VoiceRefinementAttempt(id: $id, planId: $planId, activityId: $activityId, day: $day, isCheckpoint: $isCheckpoint, attemptStatus: $attemptStatus, analysisStatus: $analysisStatus, analysisError: $analysisError, recordingUploadStatus: $recordingUploadStatus, scores: $scores, metrics: $metrics, transcript: $transcript, coachFeedback: $coachFeedback)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoiceRefinementAttemptImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.activityId, activityId) ||
                other.activityId == activityId) &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.isCheckpoint, isCheckpoint) ||
                other.isCheckpoint == isCheckpoint) &&
            (identical(other.attemptStatus, attemptStatus) ||
                other.attemptStatus == attemptStatus) &&
            (identical(other.analysisStatus, analysisStatus) ||
                other.analysisStatus == analysisStatus) &&
            (identical(other.analysisError, analysisError) ||
                other.analysisError == analysisError) &&
            (identical(other.recordingUploadStatus, recordingUploadStatus) ||
                other.recordingUploadStatus == recordingUploadStatus) &&
            const DeepCollectionEquality().equals(other._scores, _scores) &&
            const DeepCollectionEquality().equals(other._metrics, _metrics) &&
            (identical(other.transcript, transcript) ||
                other.transcript == transcript) &&
            (identical(other.coachFeedback, coachFeedback) ||
                other.coachFeedback == coachFeedback));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      planId,
      activityId,
      day,
      isCheckpoint,
      attemptStatus,
      analysisStatus,
      analysisError,
      recordingUploadStatus,
      const DeepCollectionEquality().hash(_scores),
      const DeepCollectionEquality().hash(_metrics),
      transcript,
      coachFeedback);

  /// Create a copy of VoiceRefinementAttempt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VoiceRefinementAttemptImplCopyWith<_$VoiceRefinementAttemptImpl>
      get copyWith => __$$VoiceRefinementAttemptImplCopyWithImpl<
          _$VoiceRefinementAttemptImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VoiceRefinementAttemptImplToJson(
      this,
    );
  }
}

abstract class _VoiceRefinementAttempt implements VoiceRefinementAttempt {
  const factory _VoiceRefinementAttempt(
          {required final String id,
          @JsonKey(name: 'plan_id') final String? planId,
          @JsonKey(name: 'activity_id') final String? activityId,
          final int? day,
          @JsonKey(name: 'is_checkpoint') final bool? isCheckpoint,
          @JsonKey(name: 'attempt_status') final String? attemptStatus,
          @JsonKey(name: 'analysis_status') final String? analysisStatus,
          @JsonKey(name: 'analysis_error') final String? analysisError,
          @JsonKey(name: 'recording_upload_status')
          final String? recordingUploadStatus,
          final Map<String, dynamic>? scores,
          final Map<String, dynamic>? metrics,
          final String? transcript,
          @JsonKey(name: 'coach_feedback') final String? coachFeedback}) =
      _$VoiceRefinementAttemptImpl;

  factory _VoiceRefinementAttempt.fromJson(Map<String, dynamic> json) =
      _$VoiceRefinementAttemptImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'plan_id')
  String? get planId;
  @override
  @JsonKey(name: 'activity_id')
  String? get activityId;
  @override
  int? get day;
  @override
  @JsonKey(name: 'is_checkpoint')
  bool? get isCheckpoint;
  @override
  @JsonKey(name: 'attempt_status')
  String? get attemptStatus;
  @override
  @JsonKey(name: 'analysis_status')
  String? get analysisStatus;
  @override
  @JsonKey(name: 'analysis_error')
  String? get analysisError;
  @override
  @JsonKey(name: 'recording_upload_status')
  String? get recordingUploadStatus;
  @override
  Map<String, dynamic>? get scores;
  @override
  Map<String, dynamic>? get metrics;
  @override
  String? get transcript;
  @override
  @JsonKey(name: 'coach_feedback')
  String? get coachFeedback;

  /// Create a copy of VoiceRefinementAttempt
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VoiceRefinementAttemptImplCopyWith<_$VoiceRefinementAttemptImpl>
      get copyWith => throw _privateConstructorUsedError;
}

VoiceRefinementAttemptStart _$VoiceRefinementAttemptStartFromJson(
    Map<String, dynamic> json) {
  return _VoiceRefinementAttemptStart.fromJson(json);
}

/// @nodoc
mixin _$VoiceRefinementAttemptStart {
  VoiceRefinementAttempt get attempt => throw _privateConstructorUsedError;
  VoiceRefinementUpload get upload => throw _privateConstructorUsedError;

  /// Serializes this VoiceRefinementAttemptStart to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VoiceRefinementAttemptStart
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VoiceRefinementAttemptStartCopyWith<VoiceRefinementAttemptStart>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoiceRefinementAttemptStartCopyWith<$Res> {
  factory $VoiceRefinementAttemptStartCopyWith(
          VoiceRefinementAttemptStart value,
          $Res Function(VoiceRefinementAttemptStart) then) =
      _$VoiceRefinementAttemptStartCopyWithImpl<$Res,
          VoiceRefinementAttemptStart>;
  @useResult
  $Res call({VoiceRefinementAttempt attempt, VoiceRefinementUpload upload});

  $VoiceRefinementAttemptCopyWith<$Res> get attempt;
  $VoiceRefinementUploadCopyWith<$Res> get upload;
}

/// @nodoc
class _$VoiceRefinementAttemptStartCopyWithImpl<$Res,
        $Val extends VoiceRefinementAttemptStart>
    implements $VoiceRefinementAttemptStartCopyWith<$Res> {
  _$VoiceRefinementAttemptStartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VoiceRefinementAttemptStart
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attempt = null,
    Object? upload = null,
  }) {
    return _then(_value.copyWith(
      attempt: null == attempt
          ? _value.attempt
          : attempt // ignore: cast_nullable_to_non_nullable
              as VoiceRefinementAttempt,
      upload: null == upload
          ? _value.upload
          : upload // ignore: cast_nullable_to_non_nullable
              as VoiceRefinementUpload,
    ) as $Val);
  }

  /// Create a copy of VoiceRefinementAttemptStart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VoiceRefinementAttemptCopyWith<$Res> get attempt {
    return $VoiceRefinementAttemptCopyWith<$Res>(_value.attempt, (value) {
      return _then(_value.copyWith(attempt: value) as $Val);
    });
  }

  /// Create a copy of VoiceRefinementAttemptStart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VoiceRefinementUploadCopyWith<$Res> get upload {
    return $VoiceRefinementUploadCopyWith<$Res>(_value.upload, (value) {
      return _then(_value.copyWith(upload: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VoiceRefinementAttemptStartImplCopyWith<$Res>
    implements $VoiceRefinementAttemptStartCopyWith<$Res> {
  factory _$$VoiceRefinementAttemptStartImplCopyWith(
          _$VoiceRefinementAttemptStartImpl value,
          $Res Function(_$VoiceRefinementAttemptStartImpl) then) =
      __$$VoiceRefinementAttemptStartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({VoiceRefinementAttempt attempt, VoiceRefinementUpload upload});

  @override
  $VoiceRefinementAttemptCopyWith<$Res> get attempt;
  @override
  $VoiceRefinementUploadCopyWith<$Res> get upload;
}

/// @nodoc
class __$$VoiceRefinementAttemptStartImplCopyWithImpl<$Res>
    extends _$VoiceRefinementAttemptStartCopyWithImpl<$Res,
        _$VoiceRefinementAttemptStartImpl>
    implements _$$VoiceRefinementAttemptStartImplCopyWith<$Res> {
  __$$VoiceRefinementAttemptStartImplCopyWithImpl(
      _$VoiceRefinementAttemptStartImpl _value,
      $Res Function(_$VoiceRefinementAttemptStartImpl) _then)
      : super(_value, _then);

  /// Create a copy of VoiceRefinementAttemptStart
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attempt = null,
    Object? upload = null,
  }) {
    return _then(_$VoiceRefinementAttemptStartImpl(
      attempt: null == attempt
          ? _value.attempt
          : attempt // ignore: cast_nullable_to_non_nullable
              as VoiceRefinementAttempt,
      upload: null == upload
          ? _value.upload
          : upload // ignore: cast_nullable_to_non_nullable
              as VoiceRefinementUpload,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VoiceRefinementAttemptStartImpl
    implements _VoiceRefinementAttemptStart {
  const _$VoiceRefinementAttemptStartImpl(
      {required this.attempt, required this.upload});

  factory _$VoiceRefinementAttemptStartImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$VoiceRefinementAttemptStartImplFromJson(json);

  @override
  final VoiceRefinementAttempt attempt;
  @override
  final VoiceRefinementUpload upload;

  @override
  String toString() {
    return 'VoiceRefinementAttemptStart(attempt: $attempt, upload: $upload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoiceRefinementAttemptStartImpl &&
            (identical(other.attempt, attempt) || other.attempt == attempt) &&
            (identical(other.upload, upload) || other.upload == upload));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, attempt, upload);

  /// Create a copy of VoiceRefinementAttemptStart
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VoiceRefinementAttemptStartImplCopyWith<_$VoiceRefinementAttemptStartImpl>
      get copyWith => __$$VoiceRefinementAttemptStartImplCopyWithImpl<
          _$VoiceRefinementAttemptStartImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VoiceRefinementAttemptStartImplToJson(
      this,
    );
  }
}

abstract class _VoiceRefinementAttemptStart
    implements VoiceRefinementAttemptStart {
  const factory _VoiceRefinementAttemptStart(
          {required final VoiceRefinementAttempt attempt,
          required final VoiceRefinementUpload upload}) =
      _$VoiceRefinementAttemptStartImpl;

  factory _VoiceRefinementAttemptStart.fromJson(Map<String, dynamic> json) =
      _$VoiceRefinementAttemptStartImpl.fromJson;

  @override
  VoiceRefinementAttempt get attempt;
  @override
  VoiceRefinementUpload get upload;

  /// Create a copy of VoiceRefinementAttemptStart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VoiceRefinementAttemptStartImplCopyWith<_$VoiceRefinementAttemptStartImpl>
      get copyWith => throw _privateConstructorUsedError;
}
