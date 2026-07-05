// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voice_foundations_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VoiceFoundationsActivity _$VoiceFoundationsActivityFromJson(
    Map<String, dynamic> json) {
  return _VoiceFoundationsActivity.fromJson(json);
}

/// @nodoc
mixin _$VoiceFoundationsActivity {
  String get id => throw _privateConstructorUsedError;
  int get day => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration_minutes')
  String? get durationMinutes => throw _privateConstructorUsedError;
  @JsonKey(name: 'recording_target_seconds')
  int? get recordingTargetSeconds => throw _privateConstructorUsedError;

  /// Serializes this VoiceFoundationsActivity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VoiceFoundationsActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VoiceFoundationsActivityCopyWith<VoiceFoundationsActivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoiceFoundationsActivityCopyWith<$Res> {
  factory $VoiceFoundationsActivityCopyWith(VoiceFoundationsActivity value,
          $Res Function(VoiceFoundationsActivity) then) =
      _$VoiceFoundationsActivityCopyWithImpl<$Res, VoiceFoundationsActivity>;
  @useResult
  $Res call(
      {String id,
      int day,
      String type,
      String title,
      @JsonKey(name: 'duration_minutes') String? durationMinutes,
      @JsonKey(name: 'recording_target_seconds') int? recordingTargetSeconds});
}

/// @nodoc
class _$VoiceFoundationsActivityCopyWithImpl<$Res,
        $Val extends VoiceFoundationsActivity>
    implements $VoiceFoundationsActivityCopyWith<$Res> {
  _$VoiceFoundationsActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VoiceFoundationsActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? day = null,
    Object? type = null,
    Object? title = null,
    Object? durationMinutes = freezed,
    Object? recordingTargetSeconds = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      durationMinutes: freezed == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as String?,
      recordingTargetSeconds: freezed == recordingTargetSeconds
          ? _value.recordingTargetSeconds
          : recordingTargetSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VoiceFoundationsActivityImplCopyWith<$Res>
    implements $VoiceFoundationsActivityCopyWith<$Res> {
  factory _$$VoiceFoundationsActivityImplCopyWith(
          _$VoiceFoundationsActivityImpl value,
          $Res Function(_$VoiceFoundationsActivityImpl) then) =
      __$$VoiceFoundationsActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int day,
      String type,
      String title,
      @JsonKey(name: 'duration_minutes') String? durationMinutes,
      @JsonKey(name: 'recording_target_seconds') int? recordingTargetSeconds});
}

/// @nodoc
class __$$VoiceFoundationsActivityImplCopyWithImpl<$Res>
    extends _$VoiceFoundationsActivityCopyWithImpl<$Res,
        _$VoiceFoundationsActivityImpl>
    implements _$$VoiceFoundationsActivityImplCopyWith<$Res> {
  __$$VoiceFoundationsActivityImplCopyWithImpl(
      _$VoiceFoundationsActivityImpl _value,
      $Res Function(_$VoiceFoundationsActivityImpl) _then)
      : super(_value, _then);

  /// Create a copy of VoiceFoundationsActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? day = null,
    Object? type = null,
    Object? title = null,
    Object? durationMinutes = freezed,
    Object? recordingTargetSeconds = freezed,
  }) {
    return _then(_$VoiceFoundationsActivityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      durationMinutes: freezed == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as String?,
      recordingTargetSeconds: freezed == recordingTargetSeconds
          ? _value.recordingTargetSeconds
          : recordingTargetSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VoiceFoundationsActivityImpl implements _VoiceFoundationsActivity {
  const _$VoiceFoundationsActivityImpl(
      {required this.id,
      required this.day,
      required this.type,
      required this.title,
      @JsonKey(name: 'duration_minutes') this.durationMinutes,
      @JsonKey(name: 'recording_target_seconds') this.recordingTargetSeconds});

  factory _$VoiceFoundationsActivityImpl.fromJson(Map<String, dynamic> json) =>
      _$$VoiceFoundationsActivityImplFromJson(json);

  @override
  final String id;
  @override
  final int day;
  @override
  final String type;
  @override
  final String title;
  @override
  @JsonKey(name: 'duration_minutes')
  final String? durationMinutes;
  @override
  @JsonKey(name: 'recording_target_seconds')
  final int? recordingTargetSeconds;

  @override
  String toString() {
    return 'VoiceFoundationsActivity(id: $id, day: $day, type: $type, title: $title, durationMinutes: $durationMinutes, recordingTargetSeconds: $recordingTargetSeconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoiceFoundationsActivityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.recordingTargetSeconds, recordingTargetSeconds) ||
                other.recordingTargetSeconds == recordingTargetSeconds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, day, type, title,
      durationMinutes, recordingTargetSeconds);

  /// Create a copy of VoiceFoundationsActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VoiceFoundationsActivityImplCopyWith<_$VoiceFoundationsActivityImpl>
      get copyWith => __$$VoiceFoundationsActivityImplCopyWithImpl<
          _$VoiceFoundationsActivityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VoiceFoundationsActivityImplToJson(
      this,
    );
  }
}

abstract class _VoiceFoundationsActivity implements VoiceFoundationsActivity {
  const factory _VoiceFoundationsActivity(
      {required final String id,
      required final int day,
      required final String type,
      required final String title,
      @JsonKey(name: 'duration_minutes') final String? durationMinutes,
      @JsonKey(name: 'recording_target_seconds')
      final int? recordingTargetSeconds}) = _$VoiceFoundationsActivityImpl;

  factory _VoiceFoundationsActivity.fromJson(Map<String, dynamic> json) =
      _$VoiceFoundationsActivityImpl.fromJson;

  @override
  String get id;
  @override
  int get day;
  @override
  String get type;
  @override
  String get title;
  @override
  @JsonKey(name: 'duration_minutes')
  String? get durationMinutes;
  @override
  @JsonKey(name: 'recording_target_seconds')
  int? get recordingTargetSeconds;

  /// Create a copy of VoiceFoundationsActivity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VoiceFoundationsActivityImplCopyWith<_$VoiceFoundationsActivityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

VoiceFoundationsProgress _$VoiceFoundationsProgressFromJson(
    Map<String, dynamic> json) {
  return _VoiceFoundationsProgress.fromJson(json);
}

/// @nodoc
mixin _$VoiceFoundationsProgress {
  @JsonKey(name: 'completedActivityIds')
  List<String> get completedActivityIds => throw _privateConstructorUsedError;
  @JsonKey(name: 'unlockedDays')
  List<int> get unlockedDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'currentDay')
  int get currentDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'completionPercent')
  num get completionPercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'nextActivityId')
  String? get nextActivityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'activityStatus')
  Map<String, String> get activityStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalDays')
  int get totalDays => throw _privateConstructorUsedError;

  /// Serializes this VoiceFoundationsProgress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VoiceFoundationsProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VoiceFoundationsProgressCopyWith<VoiceFoundationsProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoiceFoundationsProgressCopyWith<$Res> {
  factory $VoiceFoundationsProgressCopyWith(VoiceFoundationsProgress value,
          $Res Function(VoiceFoundationsProgress) then) =
      _$VoiceFoundationsProgressCopyWithImpl<$Res, VoiceFoundationsProgress>;
  @useResult
  $Res call(
      {@JsonKey(name: 'completedActivityIds') List<String> completedActivityIds,
      @JsonKey(name: 'unlockedDays') List<int> unlockedDays,
      @JsonKey(name: 'currentDay') int currentDay,
      @JsonKey(name: 'completionPercent') num completionPercent,
      @JsonKey(name: 'nextActivityId') String? nextActivityId,
      @JsonKey(name: 'activityStatus') Map<String, String> activityStatus,
      @JsonKey(name: 'totalDays') int totalDays});
}

/// @nodoc
class _$VoiceFoundationsProgressCopyWithImpl<$Res,
        $Val extends VoiceFoundationsProgress>
    implements $VoiceFoundationsProgressCopyWith<$Res> {
  _$VoiceFoundationsProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VoiceFoundationsProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? completedActivityIds = null,
    Object? unlockedDays = null,
    Object? currentDay = null,
    Object? completionPercent = null,
    Object? nextActivityId = freezed,
    Object? activityStatus = null,
    Object? totalDays = null,
  }) {
    return _then(_value.copyWith(
      completedActivityIds: null == completedActivityIds
          ? _value.completedActivityIds
          : completedActivityIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      unlockedDays: null == unlockedDays
          ? _value.unlockedDays
          : unlockedDays // ignore: cast_nullable_to_non_nullable
              as List<int>,
      currentDay: null == currentDay
          ? _value.currentDay
          : currentDay // ignore: cast_nullable_to_non_nullable
              as int,
      completionPercent: null == completionPercent
          ? _value.completionPercent
          : completionPercent // ignore: cast_nullable_to_non_nullable
              as num,
      nextActivityId: freezed == nextActivityId
          ? _value.nextActivityId
          : nextActivityId // ignore: cast_nullable_to_non_nullable
              as String?,
      activityStatus: null == activityStatus
          ? _value.activityStatus
          : activityStatus // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      totalDays: null == totalDays
          ? _value.totalDays
          : totalDays // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VoiceFoundationsProgressImplCopyWith<$Res>
    implements $VoiceFoundationsProgressCopyWith<$Res> {
  factory _$$VoiceFoundationsProgressImplCopyWith(
          _$VoiceFoundationsProgressImpl value,
          $Res Function(_$VoiceFoundationsProgressImpl) then) =
      __$$VoiceFoundationsProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'completedActivityIds') List<String> completedActivityIds,
      @JsonKey(name: 'unlockedDays') List<int> unlockedDays,
      @JsonKey(name: 'currentDay') int currentDay,
      @JsonKey(name: 'completionPercent') num completionPercent,
      @JsonKey(name: 'nextActivityId') String? nextActivityId,
      @JsonKey(name: 'activityStatus') Map<String, String> activityStatus,
      @JsonKey(name: 'totalDays') int totalDays});
}

/// @nodoc
class __$$VoiceFoundationsProgressImplCopyWithImpl<$Res>
    extends _$VoiceFoundationsProgressCopyWithImpl<$Res,
        _$VoiceFoundationsProgressImpl>
    implements _$$VoiceFoundationsProgressImplCopyWith<$Res> {
  __$$VoiceFoundationsProgressImplCopyWithImpl(
      _$VoiceFoundationsProgressImpl _value,
      $Res Function(_$VoiceFoundationsProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of VoiceFoundationsProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? completedActivityIds = null,
    Object? unlockedDays = null,
    Object? currentDay = null,
    Object? completionPercent = null,
    Object? nextActivityId = freezed,
    Object? activityStatus = null,
    Object? totalDays = null,
  }) {
    return _then(_$VoiceFoundationsProgressImpl(
      completedActivityIds: null == completedActivityIds
          ? _value._completedActivityIds
          : completedActivityIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      unlockedDays: null == unlockedDays
          ? _value._unlockedDays
          : unlockedDays // ignore: cast_nullable_to_non_nullable
              as List<int>,
      currentDay: null == currentDay
          ? _value.currentDay
          : currentDay // ignore: cast_nullable_to_non_nullable
              as int,
      completionPercent: null == completionPercent
          ? _value.completionPercent
          : completionPercent // ignore: cast_nullable_to_non_nullable
              as num,
      nextActivityId: freezed == nextActivityId
          ? _value.nextActivityId
          : nextActivityId // ignore: cast_nullable_to_non_nullable
              as String?,
      activityStatus: null == activityStatus
          ? _value._activityStatus
          : activityStatus // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      totalDays: null == totalDays
          ? _value.totalDays
          : totalDays // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VoiceFoundationsProgressImpl implements _VoiceFoundationsProgress {
  const _$VoiceFoundationsProgressImpl(
      {@JsonKey(name: 'completedActivityIds')
      final List<String> completedActivityIds = const [],
      @JsonKey(name: 'unlockedDays') final List<int> unlockedDays = const [],
      @JsonKey(name: 'currentDay') this.currentDay = 1,
      @JsonKey(name: 'completionPercent') this.completionPercent = 0,
      @JsonKey(name: 'nextActivityId') this.nextActivityId,
      @JsonKey(name: 'activityStatus')
      final Map<String, String> activityStatus = const {},
      @JsonKey(name: 'totalDays') this.totalDays = 7})
      : _completedActivityIds = completedActivityIds,
        _unlockedDays = unlockedDays,
        _activityStatus = activityStatus;

  factory _$VoiceFoundationsProgressImpl.fromJson(Map<String, dynamic> json) =>
      _$$VoiceFoundationsProgressImplFromJson(json);

  final List<String> _completedActivityIds;
  @override
  @JsonKey(name: 'completedActivityIds')
  List<String> get completedActivityIds {
    if (_completedActivityIds is EqualUnmodifiableListView)
      return _completedActivityIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_completedActivityIds);
  }

  final List<int> _unlockedDays;
  @override
  @JsonKey(name: 'unlockedDays')
  List<int> get unlockedDays {
    if (_unlockedDays is EqualUnmodifiableListView) return _unlockedDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_unlockedDays);
  }

  @override
  @JsonKey(name: 'currentDay')
  final int currentDay;
  @override
  @JsonKey(name: 'completionPercent')
  final num completionPercent;
  @override
  @JsonKey(name: 'nextActivityId')
  final String? nextActivityId;
  final Map<String, String> _activityStatus;
  @override
  @JsonKey(name: 'activityStatus')
  Map<String, String> get activityStatus {
    if (_activityStatus is EqualUnmodifiableMapView) return _activityStatus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_activityStatus);
  }

  @override
  @JsonKey(name: 'totalDays')
  final int totalDays;

  @override
  String toString() {
    return 'VoiceFoundationsProgress(completedActivityIds: $completedActivityIds, unlockedDays: $unlockedDays, currentDay: $currentDay, completionPercent: $completionPercent, nextActivityId: $nextActivityId, activityStatus: $activityStatus, totalDays: $totalDays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoiceFoundationsProgressImpl &&
            const DeepCollectionEquality()
                .equals(other._completedActivityIds, _completedActivityIds) &&
            const DeepCollectionEquality()
                .equals(other._unlockedDays, _unlockedDays) &&
            (identical(other.currentDay, currentDay) ||
                other.currentDay == currentDay) &&
            (identical(other.completionPercent, completionPercent) ||
                other.completionPercent == completionPercent) &&
            (identical(other.nextActivityId, nextActivityId) ||
                other.nextActivityId == nextActivityId) &&
            const DeepCollectionEquality()
                .equals(other._activityStatus, _activityStatus) &&
            (identical(other.totalDays, totalDays) ||
                other.totalDays == totalDays));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_completedActivityIds),
      const DeepCollectionEquality().hash(_unlockedDays),
      currentDay,
      completionPercent,
      nextActivityId,
      const DeepCollectionEquality().hash(_activityStatus),
      totalDays);

  /// Create a copy of VoiceFoundationsProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VoiceFoundationsProgressImplCopyWith<_$VoiceFoundationsProgressImpl>
      get copyWith => __$$VoiceFoundationsProgressImplCopyWithImpl<
          _$VoiceFoundationsProgressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VoiceFoundationsProgressImplToJson(
      this,
    );
  }
}

abstract class _VoiceFoundationsProgress implements VoiceFoundationsProgress {
  const factory _VoiceFoundationsProgress(
      {@JsonKey(name: 'completedActivityIds')
      final List<String> completedActivityIds,
      @JsonKey(name: 'unlockedDays') final List<int> unlockedDays,
      @JsonKey(name: 'currentDay') final int currentDay,
      @JsonKey(name: 'completionPercent') final num completionPercent,
      @JsonKey(name: 'nextActivityId') final String? nextActivityId,
      @JsonKey(name: 'activityStatus') final Map<String, String> activityStatus,
      @JsonKey(name: 'totalDays')
      final int totalDays}) = _$VoiceFoundationsProgressImpl;

  factory _VoiceFoundationsProgress.fromJson(Map<String, dynamic> json) =
      _$VoiceFoundationsProgressImpl.fromJson;

  @override
  @JsonKey(name: 'completedActivityIds')
  List<String> get completedActivityIds;
  @override
  @JsonKey(name: 'unlockedDays')
  List<int> get unlockedDays;
  @override
  @JsonKey(name: 'currentDay')
  int get currentDay;
  @override
  @JsonKey(name: 'completionPercent')
  num get completionPercent;
  @override
  @JsonKey(name: 'nextActivityId')
  String? get nextActivityId;
  @override
  @JsonKey(name: 'activityStatus')
  Map<String, String> get activityStatus;
  @override
  @JsonKey(name: 'totalDays')
  int get totalDays;

  /// Create a copy of VoiceFoundationsProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VoiceFoundationsProgressImplCopyWith<_$VoiceFoundationsProgressImpl>
      get copyWith => throw _privateConstructorUsedError;
}

VoiceFoundationsAttempt _$VoiceFoundationsAttemptFromJson(
    Map<String, dynamic> json) {
  return _VoiceFoundationsAttempt.fromJson(json);
}

/// @nodoc
mixin _$VoiceFoundationsAttempt {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'activity_id')
  String? get activityId => throw _privateConstructorUsedError;
  int? get day => throw _privateConstructorUsedError;
  @JsonKey(name: 'attempt_status')
  String? get attemptStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'analysis_status')
  String? get analysisStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'analysis_error')
  String? get analysisError => throw _privateConstructorUsedError;
  @JsonKey(name: 'recording_upload_status')
  String? get recordingUploadStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration_seconds')
  int? get durationSeconds => throw _privateConstructorUsedError;
  @JsonKey(name: 'audio_object_key')
  String? get audioObjectKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'audio_mime_type')
  String? get audioMimeType => throw _privateConstructorUsedError;
  Map<String, dynamic>? get scores => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metrics => throw _privateConstructorUsedError;
  String? get transcript => throw _privateConstructorUsedError;
  @JsonKey(name: 'transcript_analysis')
  Map<String, dynamic>? get transcriptAnalysis =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'coach_feedback')
  String? get coachFeedback => throw _privateConstructorUsedError;
  String? get archetype => throw _privateConstructorUsedError;
  @JsonKey(name: 'raw_response')
  Map<String, dynamic>? get rawResponse => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this VoiceFoundationsAttempt to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VoiceFoundationsAttempt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VoiceFoundationsAttemptCopyWith<VoiceFoundationsAttempt> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoiceFoundationsAttemptCopyWith<$Res> {
  factory $VoiceFoundationsAttemptCopyWith(VoiceFoundationsAttempt value,
          $Res Function(VoiceFoundationsAttempt) then) =
      _$VoiceFoundationsAttemptCopyWithImpl<$Res, VoiceFoundationsAttempt>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'activity_id') String? activityId,
      int? day,
      @JsonKey(name: 'attempt_status') String? attemptStatus,
      @JsonKey(name: 'analysis_status') String? analysisStatus,
      @JsonKey(name: 'analysis_error') String? analysisError,
      @JsonKey(name: 'recording_upload_status') String? recordingUploadStatus,
      @JsonKey(name: 'duration_seconds') int? durationSeconds,
      @JsonKey(name: 'audio_object_key') String? audioObjectKey,
      @JsonKey(name: 'audio_mime_type') String? audioMimeType,
      Map<String, dynamic>? scores,
      Map<String, dynamic>? metrics,
      String? transcript,
      @JsonKey(name: 'transcript_analysis')
      Map<String, dynamic>? transcriptAnalysis,
      @JsonKey(name: 'coach_feedback') String? coachFeedback,
      String? archetype,
      @JsonKey(name: 'raw_response') Map<String, dynamic>? rawResponse,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class _$VoiceFoundationsAttemptCopyWithImpl<$Res,
        $Val extends VoiceFoundationsAttempt>
    implements $VoiceFoundationsAttemptCopyWith<$Res> {
  _$VoiceFoundationsAttemptCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VoiceFoundationsAttempt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? activityId = freezed,
    Object? day = freezed,
    Object? attemptStatus = freezed,
    Object? analysisStatus = freezed,
    Object? analysisError = freezed,
    Object? recordingUploadStatus = freezed,
    Object? durationSeconds = freezed,
    Object? audioObjectKey = freezed,
    Object? audioMimeType = freezed,
    Object? scores = freezed,
    Object? metrics = freezed,
    Object? transcript = freezed,
    Object? transcriptAnalysis = freezed,
    Object? coachFeedback = freezed,
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
      activityId: freezed == activityId
          ? _value.activityId
          : activityId // ignore: cast_nullable_to_non_nullable
              as String?,
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int?,
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
      durationSeconds: freezed == durationSeconds
          ? _value.durationSeconds
          : durationSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      audioObjectKey: freezed == audioObjectKey
          ? _value.audioObjectKey
          : audioObjectKey // ignore: cast_nullable_to_non_nullable
              as String?,
      audioMimeType: freezed == audioMimeType
          ? _value.audioMimeType
          : audioMimeType // ignore: cast_nullable_to_non_nullable
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
abstract class _$$VoiceFoundationsAttemptImplCopyWith<$Res>
    implements $VoiceFoundationsAttemptCopyWith<$Res> {
  factory _$$VoiceFoundationsAttemptImplCopyWith(
          _$VoiceFoundationsAttemptImpl value,
          $Res Function(_$VoiceFoundationsAttemptImpl) then) =
      __$$VoiceFoundationsAttemptImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'activity_id') String? activityId,
      int? day,
      @JsonKey(name: 'attempt_status') String? attemptStatus,
      @JsonKey(name: 'analysis_status') String? analysisStatus,
      @JsonKey(name: 'analysis_error') String? analysisError,
      @JsonKey(name: 'recording_upload_status') String? recordingUploadStatus,
      @JsonKey(name: 'duration_seconds') int? durationSeconds,
      @JsonKey(name: 'audio_object_key') String? audioObjectKey,
      @JsonKey(name: 'audio_mime_type') String? audioMimeType,
      Map<String, dynamic>? scores,
      Map<String, dynamic>? metrics,
      String? transcript,
      @JsonKey(name: 'transcript_analysis')
      Map<String, dynamic>? transcriptAnalysis,
      @JsonKey(name: 'coach_feedback') String? coachFeedback,
      String? archetype,
      @JsonKey(name: 'raw_response') Map<String, dynamic>? rawResponse,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class __$$VoiceFoundationsAttemptImplCopyWithImpl<$Res>
    extends _$VoiceFoundationsAttemptCopyWithImpl<$Res,
        _$VoiceFoundationsAttemptImpl>
    implements _$$VoiceFoundationsAttemptImplCopyWith<$Res> {
  __$$VoiceFoundationsAttemptImplCopyWithImpl(
      _$VoiceFoundationsAttemptImpl _value,
      $Res Function(_$VoiceFoundationsAttemptImpl) _then)
      : super(_value, _then);

  /// Create a copy of VoiceFoundationsAttempt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? activityId = freezed,
    Object? day = freezed,
    Object? attemptStatus = freezed,
    Object? analysisStatus = freezed,
    Object? analysisError = freezed,
    Object? recordingUploadStatus = freezed,
    Object? durationSeconds = freezed,
    Object? audioObjectKey = freezed,
    Object? audioMimeType = freezed,
    Object? scores = freezed,
    Object? metrics = freezed,
    Object? transcript = freezed,
    Object? transcriptAnalysis = freezed,
    Object? coachFeedback = freezed,
    Object? archetype = freezed,
    Object? rawResponse = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$VoiceFoundationsAttemptImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      activityId: freezed == activityId
          ? _value.activityId
          : activityId // ignore: cast_nullable_to_non_nullable
              as String?,
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int?,
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
      durationSeconds: freezed == durationSeconds
          ? _value.durationSeconds
          : durationSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      audioObjectKey: freezed == audioObjectKey
          ? _value.audioObjectKey
          : audioObjectKey // ignore: cast_nullable_to_non_nullable
              as String?,
      audioMimeType: freezed == audioMimeType
          ? _value.audioMimeType
          : audioMimeType // ignore: cast_nullable_to_non_nullable
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
class _$VoiceFoundationsAttemptImpl implements _VoiceFoundationsAttempt {
  const _$VoiceFoundationsAttemptImpl(
      {required this.id,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'activity_id') this.activityId,
      this.day,
      @JsonKey(name: 'attempt_status') this.attemptStatus,
      @JsonKey(name: 'analysis_status') this.analysisStatus,
      @JsonKey(name: 'analysis_error') this.analysisError,
      @JsonKey(name: 'recording_upload_status') this.recordingUploadStatus,
      @JsonKey(name: 'duration_seconds') this.durationSeconds,
      @JsonKey(name: 'audio_object_key') this.audioObjectKey,
      @JsonKey(name: 'audio_mime_type') this.audioMimeType,
      final Map<String, dynamic>? scores,
      final Map<String, dynamic>? metrics,
      this.transcript,
      @JsonKey(name: 'transcript_analysis')
      final Map<String, dynamic>? transcriptAnalysis,
      @JsonKey(name: 'coach_feedback') this.coachFeedback,
      this.archetype,
      @JsonKey(name: 'raw_response') final Map<String, dynamic>? rawResponse,
      @JsonKey(name: 'created_at') this.createdAt})
      : _scores = scores,
        _metrics = metrics,
        _transcriptAnalysis = transcriptAnalysis,
        _rawResponse = rawResponse;

  factory _$VoiceFoundationsAttemptImpl.fromJson(Map<String, dynamic> json) =>
      _$$VoiceFoundationsAttemptImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  @JsonKey(name: 'activity_id')
  final String? activityId;
  @override
  final int? day;
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
  @override
  @JsonKey(name: 'duration_seconds')
  final int? durationSeconds;
  @override
  @JsonKey(name: 'audio_object_key')
  final String? audioObjectKey;
  @override
  @JsonKey(name: 'audio_mime_type')
  final String? audioMimeType;
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
    return 'VoiceFoundationsAttempt(id: $id, userId: $userId, activityId: $activityId, day: $day, attemptStatus: $attemptStatus, analysisStatus: $analysisStatus, analysisError: $analysisError, recordingUploadStatus: $recordingUploadStatus, durationSeconds: $durationSeconds, audioObjectKey: $audioObjectKey, audioMimeType: $audioMimeType, scores: $scores, metrics: $metrics, transcript: $transcript, transcriptAnalysis: $transcriptAnalysis, coachFeedback: $coachFeedback, archetype: $archetype, rawResponse: $rawResponse, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoiceFoundationsAttemptImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.activityId, activityId) ||
                other.activityId == activityId) &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.attemptStatus, attemptStatus) ||
                other.attemptStatus == attemptStatus) &&
            (identical(other.analysisStatus, analysisStatus) ||
                other.analysisStatus == analysisStatus) &&
            (identical(other.analysisError, analysisError) ||
                other.analysisError == analysisError) &&
            (identical(other.recordingUploadStatus, recordingUploadStatus) ||
                other.recordingUploadStatus == recordingUploadStatus) &&
            (identical(other.durationSeconds, durationSeconds) ||
                other.durationSeconds == durationSeconds) &&
            (identical(other.audioObjectKey, audioObjectKey) ||
                other.audioObjectKey == audioObjectKey) &&
            (identical(other.audioMimeType, audioMimeType) ||
                other.audioMimeType == audioMimeType) &&
            const DeepCollectionEquality().equals(other._scores, _scores) &&
            const DeepCollectionEquality().equals(other._metrics, _metrics) &&
            (identical(other.transcript, transcript) ||
                other.transcript == transcript) &&
            const DeepCollectionEquality()
                .equals(other._transcriptAnalysis, _transcriptAnalysis) &&
            (identical(other.coachFeedback, coachFeedback) ||
                other.coachFeedback == coachFeedback) &&
            (identical(other.archetype, archetype) ||
                other.archetype == archetype) &&
            const DeepCollectionEquality()
                .equals(other._rawResponse, _rawResponse) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        userId,
        activityId,
        day,
        attemptStatus,
        analysisStatus,
        analysisError,
        recordingUploadStatus,
        durationSeconds,
        audioObjectKey,
        audioMimeType,
        const DeepCollectionEquality().hash(_scores),
        const DeepCollectionEquality().hash(_metrics),
        transcript,
        const DeepCollectionEquality().hash(_transcriptAnalysis),
        coachFeedback,
        archetype,
        const DeepCollectionEquality().hash(_rawResponse),
        createdAt
      ]);

  /// Create a copy of VoiceFoundationsAttempt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VoiceFoundationsAttemptImplCopyWith<_$VoiceFoundationsAttemptImpl>
      get copyWith => __$$VoiceFoundationsAttemptImplCopyWithImpl<
          _$VoiceFoundationsAttemptImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VoiceFoundationsAttemptImplToJson(
      this,
    );
  }
}

abstract class _VoiceFoundationsAttempt implements VoiceFoundationsAttempt {
  const factory _VoiceFoundationsAttempt(
      {required final String id,
      @JsonKey(name: 'user_id') final String? userId,
      @JsonKey(name: 'activity_id') final String? activityId,
      final int? day,
      @JsonKey(name: 'attempt_status') final String? attemptStatus,
      @JsonKey(name: 'analysis_status') final String? analysisStatus,
      @JsonKey(name: 'analysis_error') final String? analysisError,
      @JsonKey(name: 'recording_upload_status')
      final String? recordingUploadStatus,
      @JsonKey(name: 'duration_seconds') final int? durationSeconds,
      @JsonKey(name: 'audio_object_key') final String? audioObjectKey,
      @JsonKey(name: 'audio_mime_type') final String? audioMimeType,
      final Map<String, dynamic>? scores,
      final Map<String, dynamic>? metrics,
      final String? transcript,
      @JsonKey(name: 'transcript_analysis')
      final Map<String, dynamic>? transcriptAnalysis,
      @JsonKey(name: 'coach_feedback') final String? coachFeedback,
      final String? archetype,
      @JsonKey(name: 'raw_response') final Map<String, dynamic>? rawResponse,
      @JsonKey(name: 'created_at')
      final DateTime? createdAt}) = _$VoiceFoundationsAttemptImpl;

  factory _VoiceFoundationsAttempt.fromJson(Map<String, dynamic> json) =
      _$VoiceFoundationsAttemptImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  @JsonKey(name: 'activity_id')
  String? get activityId;
  @override
  int? get day;
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
  @JsonKey(name: 'duration_seconds')
  int? get durationSeconds;
  @override
  @JsonKey(name: 'audio_object_key')
  String? get audioObjectKey;
  @override
  @JsonKey(name: 'audio_mime_type')
  String? get audioMimeType;
  @override
  Map<String, dynamic>? get scores;
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
  @JsonKey(name: 'raw_response')
  Map<String, dynamic>? get rawResponse;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of VoiceFoundationsAttempt
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VoiceFoundationsAttemptImplCopyWith<_$VoiceFoundationsAttemptImpl>
      get copyWith => throw _privateConstructorUsedError;
}

VoiceFoundationsUpload _$VoiceFoundationsUploadFromJson(
    Map<String, dynamic> json) {
  return _VoiceFoundationsUpload.fromJson(json);
}

/// @nodoc
mixin _$VoiceFoundationsUpload {
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'object_key')
  String get objectKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'content_type')
  String get contentType => throw _privateConstructorUsedError;

  /// Serializes this VoiceFoundationsUpload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VoiceFoundationsUpload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VoiceFoundationsUploadCopyWith<VoiceFoundationsUpload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoiceFoundationsUploadCopyWith<$Res> {
  factory $VoiceFoundationsUploadCopyWith(VoiceFoundationsUpload value,
          $Res Function(VoiceFoundationsUpload) then) =
      _$VoiceFoundationsUploadCopyWithImpl<$Res, VoiceFoundationsUpload>;
  @useResult
  $Res call(
      {String url,
      @JsonKey(name: 'object_key') String objectKey,
      @JsonKey(name: 'content_type') String contentType});
}

/// @nodoc
class _$VoiceFoundationsUploadCopyWithImpl<$Res,
        $Val extends VoiceFoundationsUpload>
    implements $VoiceFoundationsUploadCopyWith<$Res> {
  _$VoiceFoundationsUploadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VoiceFoundationsUpload
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
abstract class _$$VoiceFoundationsUploadImplCopyWith<$Res>
    implements $VoiceFoundationsUploadCopyWith<$Res> {
  factory _$$VoiceFoundationsUploadImplCopyWith(
          _$VoiceFoundationsUploadImpl value,
          $Res Function(_$VoiceFoundationsUploadImpl) then) =
      __$$VoiceFoundationsUploadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String url,
      @JsonKey(name: 'object_key') String objectKey,
      @JsonKey(name: 'content_type') String contentType});
}

/// @nodoc
class __$$VoiceFoundationsUploadImplCopyWithImpl<$Res>
    extends _$VoiceFoundationsUploadCopyWithImpl<$Res,
        _$VoiceFoundationsUploadImpl>
    implements _$$VoiceFoundationsUploadImplCopyWith<$Res> {
  __$$VoiceFoundationsUploadImplCopyWithImpl(
      _$VoiceFoundationsUploadImpl _value,
      $Res Function(_$VoiceFoundationsUploadImpl) _then)
      : super(_value, _then);

  /// Create a copy of VoiceFoundationsUpload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? objectKey = null,
    Object? contentType = null,
  }) {
    return _then(_$VoiceFoundationsUploadImpl(
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
class _$VoiceFoundationsUploadImpl implements _VoiceFoundationsUpload {
  const _$VoiceFoundationsUploadImpl(
      {required this.url,
      @JsonKey(name: 'object_key') required this.objectKey,
      @JsonKey(name: 'content_type') required this.contentType});

  factory _$VoiceFoundationsUploadImpl.fromJson(Map<String, dynamic> json) =>
      _$$VoiceFoundationsUploadImplFromJson(json);

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
    return 'VoiceFoundationsUpload(url: $url, objectKey: $objectKey, contentType: $contentType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoiceFoundationsUploadImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.objectKey, objectKey) ||
                other.objectKey == objectKey) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, objectKey, contentType);

  /// Create a copy of VoiceFoundationsUpload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VoiceFoundationsUploadImplCopyWith<_$VoiceFoundationsUploadImpl>
      get copyWith => __$$VoiceFoundationsUploadImplCopyWithImpl<
          _$VoiceFoundationsUploadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VoiceFoundationsUploadImplToJson(
      this,
    );
  }
}

abstract class _VoiceFoundationsUpload implements VoiceFoundationsUpload {
  const factory _VoiceFoundationsUpload(
          {required final String url,
          @JsonKey(name: 'object_key') required final String objectKey,
          @JsonKey(name: 'content_type') required final String contentType}) =
      _$VoiceFoundationsUploadImpl;

  factory _VoiceFoundationsUpload.fromJson(Map<String, dynamic> json) =
      _$VoiceFoundationsUploadImpl.fromJson;

  @override
  String get url;
  @override
  @JsonKey(name: 'object_key')
  String get objectKey;
  @override
  @JsonKey(name: 'content_type')
  String get contentType;

  /// Create a copy of VoiceFoundationsUpload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VoiceFoundationsUploadImplCopyWith<_$VoiceFoundationsUploadImpl>
      get copyWith => throw _privateConstructorUsedError;
}

VoiceFoundationsStartResponse _$VoiceFoundationsStartResponseFromJson(
    Map<String, dynamic> json) {
  return _VoiceFoundationsStartResponse.fromJson(json);
}

/// @nodoc
mixin _$VoiceFoundationsStartResponse {
  VoiceFoundationsAttempt get attempt => throw _privateConstructorUsedError;
  VoiceFoundationsUpload get upload => throw _privateConstructorUsedError;

  /// Serializes this VoiceFoundationsStartResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VoiceFoundationsStartResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VoiceFoundationsStartResponseCopyWith<VoiceFoundationsStartResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoiceFoundationsStartResponseCopyWith<$Res> {
  factory $VoiceFoundationsStartResponseCopyWith(
          VoiceFoundationsStartResponse value,
          $Res Function(VoiceFoundationsStartResponse) then) =
      _$VoiceFoundationsStartResponseCopyWithImpl<$Res,
          VoiceFoundationsStartResponse>;
  @useResult
  $Res call({VoiceFoundationsAttempt attempt, VoiceFoundationsUpload upload});

  $VoiceFoundationsAttemptCopyWith<$Res> get attempt;
  $VoiceFoundationsUploadCopyWith<$Res> get upload;
}

/// @nodoc
class _$VoiceFoundationsStartResponseCopyWithImpl<$Res,
        $Val extends VoiceFoundationsStartResponse>
    implements $VoiceFoundationsStartResponseCopyWith<$Res> {
  _$VoiceFoundationsStartResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VoiceFoundationsStartResponse
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
              as VoiceFoundationsAttempt,
      upload: null == upload
          ? _value.upload
          : upload // ignore: cast_nullable_to_non_nullable
              as VoiceFoundationsUpload,
    ) as $Val);
  }

  /// Create a copy of VoiceFoundationsStartResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VoiceFoundationsAttemptCopyWith<$Res> get attempt {
    return $VoiceFoundationsAttemptCopyWith<$Res>(_value.attempt, (value) {
      return _then(_value.copyWith(attempt: value) as $Val);
    });
  }

  /// Create a copy of VoiceFoundationsStartResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VoiceFoundationsUploadCopyWith<$Res> get upload {
    return $VoiceFoundationsUploadCopyWith<$Res>(_value.upload, (value) {
      return _then(_value.copyWith(upload: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VoiceFoundationsStartResponseImplCopyWith<$Res>
    implements $VoiceFoundationsStartResponseCopyWith<$Res> {
  factory _$$VoiceFoundationsStartResponseImplCopyWith(
          _$VoiceFoundationsStartResponseImpl value,
          $Res Function(_$VoiceFoundationsStartResponseImpl) then) =
      __$$VoiceFoundationsStartResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({VoiceFoundationsAttempt attempt, VoiceFoundationsUpload upload});

  @override
  $VoiceFoundationsAttemptCopyWith<$Res> get attempt;
  @override
  $VoiceFoundationsUploadCopyWith<$Res> get upload;
}

/// @nodoc
class __$$VoiceFoundationsStartResponseImplCopyWithImpl<$Res>
    extends _$VoiceFoundationsStartResponseCopyWithImpl<$Res,
        _$VoiceFoundationsStartResponseImpl>
    implements _$$VoiceFoundationsStartResponseImplCopyWith<$Res> {
  __$$VoiceFoundationsStartResponseImplCopyWithImpl(
      _$VoiceFoundationsStartResponseImpl _value,
      $Res Function(_$VoiceFoundationsStartResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of VoiceFoundationsStartResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attempt = null,
    Object? upload = null,
  }) {
    return _then(_$VoiceFoundationsStartResponseImpl(
      attempt: null == attempt
          ? _value.attempt
          : attempt // ignore: cast_nullable_to_non_nullable
              as VoiceFoundationsAttempt,
      upload: null == upload
          ? _value.upload
          : upload // ignore: cast_nullable_to_non_nullable
              as VoiceFoundationsUpload,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VoiceFoundationsStartResponseImpl
    implements _VoiceFoundationsStartResponse {
  const _$VoiceFoundationsStartResponseImpl(
      {required this.attempt, required this.upload});

  factory _$VoiceFoundationsStartResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$VoiceFoundationsStartResponseImplFromJson(json);

  @override
  final VoiceFoundationsAttempt attempt;
  @override
  final VoiceFoundationsUpload upload;

  @override
  String toString() {
    return 'VoiceFoundationsStartResponse(attempt: $attempt, upload: $upload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoiceFoundationsStartResponseImpl &&
            (identical(other.attempt, attempt) || other.attempt == attempt) &&
            (identical(other.upload, upload) || other.upload == upload));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, attempt, upload);

  /// Create a copy of VoiceFoundationsStartResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VoiceFoundationsStartResponseImplCopyWith<
          _$VoiceFoundationsStartResponseImpl>
      get copyWith => __$$VoiceFoundationsStartResponseImplCopyWithImpl<
          _$VoiceFoundationsStartResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VoiceFoundationsStartResponseImplToJson(
      this,
    );
  }
}

abstract class _VoiceFoundationsStartResponse
    implements VoiceFoundationsStartResponse {
  const factory _VoiceFoundationsStartResponse(
          {required final VoiceFoundationsAttempt attempt,
          required final VoiceFoundationsUpload upload}) =
      _$VoiceFoundationsStartResponseImpl;

  factory _VoiceFoundationsStartResponse.fromJson(Map<String, dynamic> json) =
      _$VoiceFoundationsStartResponseImpl.fromJson;

  @override
  VoiceFoundationsAttempt get attempt;
  @override
  VoiceFoundationsUpload get upload;

  /// Create a copy of VoiceFoundationsStartResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VoiceFoundationsStartResponseImplCopyWith<
          _$VoiceFoundationsStartResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
