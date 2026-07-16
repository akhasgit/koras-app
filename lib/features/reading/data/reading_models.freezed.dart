// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reading_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReadingProfile _$ReadingProfileFromJson(Map<String, dynamic> json) {
  return _ReadingProfile.fromJson(json);
}

/// @nodoc
mixin _$ReadingProfile {
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  String? get intent => throw _privateConstructorUsedError;
  List<String> get goals => throw _privateConstructorUsedError;
  String get persona => throw _privateConstructorUsedError;
  @JsonKey(name: 'grade_level')
  int? get gradeLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'calibration_attempt_id')
  String? get calibrationAttemptId => throw _privateConstructorUsedError;

  /// Serializes this ReadingProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReadingProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReadingProfileCopyWith<ReadingProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadingProfileCopyWith<$Res> {
  factory $ReadingProfileCopyWith(
          ReadingProfile value, $Res Function(ReadingProfile) then) =
      _$ReadingProfileCopyWithImpl<$Res, ReadingProfile>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String? userId,
      String? intent,
      List<String> goals,
      String persona,
      @JsonKey(name: 'grade_level') int? gradeLevel,
      @JsonKey(name: 'calibration_attempt_id') String? calibrationAttemptId});
}

/// @nodoc
class _$ReadingProfileCopyWithImpl<$Res, $Val extends ReadingProfile>
    implements $ReadingProfileCopyWith<$Res> {
  _$ReadingProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReadingProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? intent = freezed,
    Object? goals = null,
    Object? persona = null,
    Object? gradeLevel = freezed,
    Object? calibrationAttemptId = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      intent: freezed == intent
          ? _value.intent
          : intent // ignore: cast_nullable_to_non_nullable
              as String?,
      goals: null == goals
          ? _value.goals
          : goals // ignore: cast_nullable_to_non_nullable
              as List<String>,
      persona: null == persona
          ? _value.persona
          : persona // ignore: cast_nullable_to_non_nullable
              as String,
      gradeLevel: freezed == gradeLevel
          ? _value.gradeLevel
          : gradeLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      calibrationAttemptId: freezed == calibrationAttemptId
          ? _value.calibrationAttemptId
          : calibrationAttemptId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReadingProfileImplCopyWith<$Res>
    implements $ReadingProfileCopyWith<$Res> {
  factory _$$ReadingProfileImplCopyWith(_$ReadingProfileImpl value,
          $Res Function(_$ReadingProfileImpl) then) =
      __$$ReadingProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String? userId,
      String? intent,
      List<String> goals,
      String persona,
      @JsonKey(name: 'grade_level') int? gradeLevel,
      @JsonKey(name: 'calibration_attempt_id') String? calibrationAttemptId});
}

/// @nodoc
class __$$ReadingProfileImplCopyWithImpl<$Res>
    extends _$ReadingProfileCopyWithImpl<$Res, _$ReadingProfileImpl>
    implements _$$ReadingProfileImplCopyWith<$Res> {
  __$$ReadingProfileImplCopyWithImpl(
      _$ReadingProfileImpl _value, $Res Function(_$ReadingProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReadingProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? intent = freezed,
    Object? goals = null,
    Object? persona = null,
    Object? gradeLevel = freezed,
    Object? calibrationAttemptId = freezed,
  }) {
    return _then(_$ReadingProfileImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      intent: freezed == intent
          ? _value.intent
          : intent // ignore: cast_nullable_to_non_nullable
              as String?,
      goals: null == goals
          ? _value._goals
          : goals // ignore: cast_nullable_to_non_nullable
              as List<String>,
      persona: null == persona
          ? _value.persona
          : persona // ignore: cast_nullable_to_non_nullable
              as String,
      gradeLevel: freezed == gradeLevel
          ? _value.gradeLevel
          : gradeLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      calibrationAttemptId: freezed == calibrationAttemptId
          ? _value.calibrationAttemptId
          : calibrationAttemptId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReadingProfileImpl implements _ReadingProfile {
  const _$ReadingProfileImpl(
      {@JsonKey(name: 'user_id') this.userId,
      this.intent,
      final List<String> goals = const [],
      required this.persona,
      @JsonKey(name: 'grade_level') this.gradeLevel,
      @JsonKey(name: 'calibration_attempt_id') this.calibrationAttemptId})
      : _goals = goals;

  factory _$ReadingProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReadingProfileImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  final String? intent;
  final List<String> _goals;
  @override
  @JsonKey()
  List<String> get goals {
    if (_goals is EqualUnmodifiableListView) return _goals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_goals);
  }

  @override
  final String persona;
  @override
  @JsonKey(name: 'grade_level')
  final int? gradeLevel;
  @override
  @JsonKey(name: 'calibration_attempt_id')
  final String? calibrationAttemptId;

  @override
  String toString() {
    return 'ReadingProfile(userId: $userId, intent: $intent, goals: $goals, persona: $persona, gradeLevel: $gradeLevel, calibrationAttemptId: $calibrationAttemptId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReadingProfileImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.intent, intent) || other.intent == intent) &&
            const DeepCollectionEquality().equals(other._goals, _goals) &&
            (identical(other.persona, persona) || other.persona == persona) &&
            (identical(other.gradeLevel, gradeLevel) ||
                other.gradeLevel == gradeLevel) &&
            (identical(other.calibrationAttemptId, calibrationAttemptId) ||
                other.calibrationAttemptId == calibrationAttemptId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      intent,
      const DeepCollectionEquality().hash(_goals),
      persona,
      gradeLevel,
      calibrationAttemptId);

  /// Create a copy of ReadingProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReadingProfileImplCopyWith<_$ReadingProfileImpl> get copyWith =>
      __$$ReadingProfileImplCopyWithImpl<_$ReadingProfileImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReadingProfileImplToJson(
      this,
    );
  }
}

abstract class _ReadingProfile implements ReadingProfile {
  const factory _ReadingProfile(
      {@JsonKey(name: 'user_id') final String? userId,
      final String? intent,
      final List<String> goals,
      required final String persona,
      @JsonKey(name: 'grade_level') final int? gradeLevel,
      @JsonKey(name: 'calibration_attempt_id')
      final String? calibrationAttemptId}) = _$ReadingProfileImpl;

  factory _ReadingProfile.fromJson(Map<String, dynamic> json) =
      _$ReadingProfileImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  String? get intent;
  @override
  List<String> get goals;
  @override
  String get persona;
  @override
  @JsonKey(name: 'grade_level')
  int? get gradeLevel;
  @override
  @JsonKey(name: 'calibration_attempt_id')
  String? get calibrationAttemptId;

  /// Create a copy of ReadingProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReadingProfileImplCopyWith<_$ReadingProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReadingIntakeDefaults _$ReadingIntakeDefaultsFromJson(
    Map<String, dynamic> json) {
  return _ReadingIntakeDefaults.fromJson(json);
}

/// @nodoc
mixin _$ReadingIntakeDefaults {
  String? get intent => throw _privateConstructorUsedError;
  List<String> get goals => throw _privateConstructorUsedError;
  String? get persona => throw _privateConstructorUsedError;
  @JsonKey(name: 'gradeLevel')
  int? get gradeLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'hasBaseline')
  bool get hasBaseline => throw _privateConstructorUsedError;

  /// Serializes this ReadingIntakeDefaults to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReadingIntakeDefaults
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReadingIntakeDefaultsCopyWith<ReadingIntakeDefaults> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadingIntakeDefaultsCopyWith<$Res> {
  factory $ReadingIntakeDefaultsCopyWith(ReadingIntakeDefaults value,
          $Res Function(ReadingIntakeDefaults) then) =
      _$ReadingIntakeDefaultsCopyWithImpl<$Res, ReadingIntakeDefaults>;
  @useResult
  $Res call(
      {String? intent,
      List<String> goals,
      String? persona,
      @JsonKey(name: 'gradeLevel') int? gradeLevel,
      @JsonKey(name: 'hasBaseline') bool hasBaseline});
}

/// @nodoc
class _$ReadingIntakeDefaultsCopyWithImpl<$Res,
        $Val extends ReadingIntakeDefaults>
    implements $ReadingIntakeDefaultsCopyWith<$Res> {
  _$ReadingIntakeDefaultsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReadingIntakeDefaults
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? intent = freezed,
    Object? goals = null,
    Object? persona = freezed,
    Object? gradeLevel = freezed,
    Object? hasBaseline = null,
  }) {
    return _then(_value.copyWith(
      intent: freezed == intent
          ? _value.intent
          : intent // ignore: cast_nullable_to_non_nullable
              as String?,
      goals: null == goals
          ? _value.goals
          : goals // ignore: cast_nullable_to_non_nullable
              as List<String>,
      persona: freezed == persona
          ? _value.persona
          : persona // ignore: cast_nullable_to_non_nullable
              as String?,
      gradeLevel: freezed == gradeLevel
          ? _value.gradeLevel
          : gradeLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      hasBaseline: null == hasBaseline
          ? _value.hasBaseline
          : hasBaseline // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReadingIntakeDefaultsImplCopyWith<$Res>
    implements $ReadingIntakeDefaultsCopyWith<$Res> {
  factory _$$ReadingIntakeDefaultsImplCopyWith(
          _$ReadingIntakeDefaultsImpl value,
          $Res Function(_$ReadingIntakeDefaultsImpl) then) =
      __$$ReadingIntakeDefaultsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? intent,
      List<String> goals,
      String? persona,
      @JsonKey(name: 'gradeLevel') int? gradeLevel,
      @JsonKey(name: 'hasBaseline') bool hasBaseline});
}

/// @nodoc
class __$$ReadingIntakeDefaultsImplCopyWithImpl<$Res>
    extends _$ReadingIntakeDefaultsCopyWithImpl<$Res,
        _$ReadingIntakeDefaultsImpl>
    implements _$$ReadingIntakeDefaultsImplCopyWith<$Res> {
  __$$ReadingIntakeDefaultsImplCopyWithImpl(_$ReadingIntakeDefaultsImpl _value,
      $Res Function(_$ReadingIntakeDefaultsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReadingIntakeDefaults
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? intent = freezed,
    Object? goals = null,
    Object? persona = freezed,
    Object? gradeLevel = freezed,
    Object? hasBaseline = null,
  }) {
    return _then(_$ReadingIntakeDefaultsImpl(
      intent: freezed == intent
          ? _value.intent
          : intent // ignore: cast_nullable_to_non_nullable
              as String?,
      goals: null == goals
          ? _value._goals
          : goals // ignore: cast_nullable_to_non_nullable
              as List<String>,
      persona: freezed == persona
          ? _value.persona
          : persona // ignore: cast_nullable_to_non_nullable
              as String?,
      gradeLevel: freezed == gradeLevel
          ? _value.gradeLevel
          : gradeLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      hasBaseline: null == hasBaseline
          ? _value.hasBaseline
          : hasBaseline // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReadingIntakeDefaultsImpl extends _ReadingIntakeDefaults {
  const _$ReadingIntakeDefaultsImpl(
      {this.intent,
      final List<String> goals = const [],
      this.persona,
      @JsonKey(name: 'gradeLevel') this.gradeLevel,
      @JsonKey(name: 'hasBaseline') this.hasBaseline = false})
      : _goals = goals,
        super._();

  factory _$ReadingIntakeDefaultsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReadingIntakeDefaultsImplFromJson(json);

  @override
  final String? intent;
  final List<String> _goals;
  @override
  @JsonKey()
  List<String> get goals {
    if (_goals is EqualUnmodifiableListView) return _goals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_goals);
  }

  @override
  final String? persona;
  @override
  @JsonKey(name: 'gradeLevel')
  final int? gradeLevel;
  @override
  @JsonKey(name: 'hasBaseline')
  final bool hasBaseline;

  @override
  String toString() {
    return 'ReadingIntakeDefaults(intent: $intent, goals: $goals, persona: $persona, gradeLevel: $gradeLevel, hasBaseline: $hasBaseline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReadingIntakeDefaultsImpl &&
            (identical(other.intent, intent) || other.intent == intent) &&
            const DeepCollectionEquality().equals(other._goals, _goals) &&
            (identical(other.persona, persona) || other.persona == persona) &&
            (identical(other.gradeLevel, gradeLevel) ||
                other.gradeLevel == gradeLevel) &&
            (identical(other.hasBaseline, hasBaseline) ||
                other.hasBaseline == hasBaseline));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      intent,
      const DeepCollectionEquality().hash(_goals),
      persona,
      gradeLevel,
      hasBaseline);

  /// Create a copy of ReadingIntakeDefaults
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReadingIntakeDefaultsImplCopyWith<_$ReadingIntakeDefaultsImpl>
      get copyWith => __$$ReadingIntakeDefaultsImplCopyWithImpl<
          _$ReadingIntakeDefaultsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReadingIntakeDefaultsImplToJson(
      this,
    );
  }
}

abstract class _ReadingIntakeDefaults extends ReadingIntakeDefaults {
  const factory _ReadingIntakeDefaults(
          {final String? intent,
          final List<String> goals,
          final String? persona,
          @JsonKey(name: 'gradeLevel') final int? gradeLevel,
          @JsonKey(name: 'hasBaseline') final bool hasBaseline}) =
      _$ReadingIntakeDefaultsImpl;
  const _ReadingIntakeDefaults._() : super._();

  factory _ReadingIntakeDefaults.fromJson(Map<String, dynamic> json) =
      _$ReadingIntakeDefaultsImpl.fromJson;

  @override
  String? get intent;
  @override
  List<String> get goals;
  @override
  String? get persona;
  @override
  @JsonKey(name: 'gradeLevel')
  int? get gradeLevel;
  @override
  @JsonKey(name: 'hasBaseline')
  bool get hasBaseline;

  /// Create a copy of ReadingIntakeDefaults
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReadingIntakeDefaultsImplCopyWith<_$ReadingIntakeDefaultsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ReadingStageSummary _$ReadingStageSummaryFromJson(Map<String, dynamic> json) {
  return _ReadingStageSummary.fromJson(json);
}

/// @nodoc
mixin _$ReadingStageSummary {
  String get id => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get theme => throw _privateConstructorUsedError;
  @JsonKey(name: 'focus_areas')
  List<String> get focusAreas => throw _privateConstructorUsedError;

  /// locked | generating | unlocked | completed
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'generation_error')
  String? get generationError => throw _privateConstructorUsedError;

  /// Serializes this ReadingStageSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReadingStageSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReadingStageSummaryCopyWith<ReadingStageSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadingStageSummaryCopyWith<$Res> {
  factory $ReadingStageSummaryCopyWith(
          ReadingStageSummary value, $Res Function(ReadingStageSummary) then) =
      _$ReadingStageSummaryCopyWithImpl<$Res, ReadingStageSummary>;
  @useResult
  $Res call(
      {String id,
      int position,
      String title,
      String? theme,
      @JsonKey(name: 'focus_areas') List<String> focusAreas,
      String status,
      @JsonKey(name: 'generation_error') String? generationError});
}

/// @nodoc
class _$ReadingStageSummaryCopyWithImpl<$Res, $Val extends ReadingStageSummary>
    implements $ReadingStageSummaryCopyWith<$Res> {
  _$ReadingStageSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReadingStageSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? position = null,
    Object? title = null,
    Object? theme = freezed,
    Object? focusAreas = null,
    Object? status = null,
    Object? generationError = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      theme: freezed == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String?,
      focusAreas: null == focusAreas
          ? _value.focusAreas
          : focusAreas // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      generationError: freezed == generationError
          ? _value.generationError
          : generationError // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReadingStageSummaryImplCopyWith<$Res>
    implements $ReadingStageSummaryCopyWith<$Res> {
  factory _$$ReadingStageSummaryImplCopyWith(_$ReadingStageSummaryImpl value,
          $Res Function(_$ReadingStageSummaryImpl) then) =
      __$$ReadingStageSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int position,
      String title,
      String? theme,
      @JsonKey(name: 'focus_areas') List<String> focusAreas,
      String status,
      @JsonKey(name: 'generation_error') String? generationError});
}

/// @nodoc
class __$$ReadingStageSummaryImplCopyWithImpl<$Res>
    extends _$ReadingStageSummaryCopyWithImpl<$Res, _$ReadingStageSummaryImpl>
    implements _$$ReadingStageSummaryImplCopyWith<$Res> {
  __$$ReadingStageSummaryImplCopyWithImpl(_$ReadingStageSummaryImpl _value,
      $Res Function(_$ReadingStageSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReadingStageSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? position = null,
    Object? title = null,
    Object? theme = freezed,
    Object? focusAreas = null,
    Object? status = null,
    Object? generationError = freezed,
  }) {
    return _then(_$ReadingStageSummaryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      theme: freezed == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String?,
      focusAreas: null == focusAreas
          ? _value._focusAreas
          : focusAreas // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      generationError: freezed == generationError
          ? _value.generationError
          : generationError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReadingStageSummaryImpl implements _ReadingStageSummary {
  const _$ReadingStageSummaryImpl(
      {required this.id,
      required this.position,
      required this.title,
      this.theme,
      @JsonKey(name: 'focus_areas') final List<String> focusAreas = const [],
      this.status = 'locked',
      @JsonKey(name: 'generation_error') this.generationError})
      : _focusAreas = focusAreas;

  factory _$ReadingStageSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReadingStageSummaryImplFromJson(json);

  @override
  final String id;
  @override
  final int position;
  @override
  final String title;
  @override
  final String? theme;
  final List<String> _focusAreas;
  @override
  @JsonKey(name: 'focus_areas')
  List<String> get focusAreas {
    if (_focusAreas is EqualUnmodifiableListView) return _focusAreas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_focusAreas);
  }

  /// locked | generating | unlocked | completed
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey(name: 'generation_error')
  final String? generationError;

  @override
  String toString() {
    return 'ReadingStageSummary(id: $id, position: $position, title: $title, theme: $theme, focusAreas: $focusAreas, status: $status, generationError: $generationError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReadingStageSummaryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            const DeepCollectionEquality()
                .equals(other._focusAreas, _focusAreas) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.generationError, generationError) ||
                other.generationError == generationError));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      position,
      title,
      theme,
      const DeepCollectionEquality().hash(_focusAreas),
      status,
      generationError);

  /// Create a copy of ReadingStageSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReadingStageSummaryImplCopyWith<_$ReadingStageSummaryImpl> get copyWith =>
      __$$ReadingStageSummaryImplCopyWithImpl<_$ReadingStageSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReadingStageSummaryImplToJson(
      this,
    );
  }
}

abstract class _ReadingStageSummary implements ReadingStageSummary {
  const factory _ReadingStageSummary(
          {required final String id,
          required final int position,
          required final String title,
          final String? theme,
          @JsonKey(name: 'focus_areas') final List<String> focusAreas,
          final String status,
          @JsonKey(name: 'generation_error') final String? generationError}) =
      _$ReadingStageSummaryImpl;

  factory _ReadingStageSummary.fromJson(Map<String, dynamic> json) =
      _$ReadingStageSummaryImpl.fromJson;

  @override
  String get id;
  @override
  int get position;
  @override
  String get title;
  @override
  String? get theme;
  @override
  @JsonKey(name: 'focus_areas')
  List<String> get focusAreas;

  /// locked | generating | unlocked | completed
  @override
  String get status;
  @override
  @JsonKey(name: 'generation_error')
  String? get generationError;

  /// Create a copy of ReadingStageSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReadingStageSummaryImplCopyWith<_$ReadingStageSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReadingProgram _$ReadingProgramFromJson(Map<String, dynamic> json) {
  return _ReadingProgram.fromJson(json);
}

/// @nodoc
mixin _$ReadingProgram {
  String get id => throw _privateConstructorUsedError;

  /// generating | active | completed | failed
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'generation_error')
  String? get generationError => throw _privateConstructorUsedError;
  List<ReadingStageSummary> get stages => throw _privateConstructorUsedError;

  /// Serializes this ReadingProgram to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReadingProgram
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReadingProgramCopyWith<ReadingProgram> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadingProgramCopyWith<$Res> {
  factory $ReadingProgramCopyWith(
          ReadingProgram value, $Res Function(ReadingProgram) then) =
      _$ReadingProgramCopyWithImpl<$Res, ReadingProgram>;
  @useResult
  $Res call(
      {String id,
      String status,
      @JsonKey(name: 'generation_error') String? generationError,
      List<ReadingStageSummary> stages});
}

/// @nodoc
class _$ReadingProgramCopyWithImpl<$Res, $Val extends ReadingProgram>
    implements $ReadingProgramCopyWith<$Res> {
  _$ReadingProgramCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReadingProgram
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? generationError = freezed,
    Object? stages = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      generationError: freezed == generationError
          ? _value.generationError
          : generationError // ignore: cast_nullable_to_non_nullable
              as String?,
      stages: null == stages
          ? _value.stages
          : stages // ignore: cast_nullable_to_non_nullable
              as List<ReadingStageSummary>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReadingProgramImplCopyWith<$Res>
    implements $ReadingProgramCopyWith<$Res> {
  factory _$$ReadingProgramImplCopyWith(_$ReadingProgramImpl value,
          $Res Function(_$ReadingProgramImpl) then) =
      __$$ReadingProgramImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String status,
      @JsonKey(name: 'generation_error') String? generationError,
      List<ReadingStageSummary> stages});
}

/// @nodoc
class __$$ReadingProgramImplCopyWithImpl<$Res>
    extends _$ReadingProgramCopyWithImpl<$Res, _$ReadingProgramImpl>
    implements _$$ReadingProgramImplCopyWith<$Res> {
  __$$ReadingProgramImplCopyWithImpl(
      _$ReadingProgramImpl _value, $Res Function(_$ReadingProgramImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReadingProgram
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? generationError = freezed,
    Object? stages = null,
  }) {
    return _then(_$ReadingProgramImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      generationError: freezed == generationError
          ? _value.generationError
          : generationError // ignore: cast_nullable_to_non_nullable
              as String?,
      stages: null == stages
          ? _value._stages
          : stages // ignore: cast_nullable_to_non_nullable
              as List<ReadingStageSummary>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReadingProgramImpl extends _ReadingProgram {
  const _$ReadingProgramImpl(
      {required this.id,
      this.status = 'generating',
      @JsonKey(name: 'generation_error') this.generationError,
      final List<ReadingStageSummary> stages = const []})
      : _stages = stages,
        super._();

  factory _$ReadingProgramImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReadingProgramImplFromJson(json);

  @override
  final String id;

  /// generating | active | completed | failed
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey(name: 'generation_error')
  final String? generationError;
  final List<ReadingStageSummary> _stages;
  @override
  @JsonKey()
  List<ReadingStageSummary> get stages {
    if (_stages is EqualUnmodifiableListView) return _stages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stages);
  }

  @override
  String toString() {
    return 'ReadingProgram(id: $id, status: $status, generationError: $generationError, stages: $stages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReadingProgramImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.generationError, generationError) ||
                other.generationError == generationError) &&
            const DeepCollectionEquality().equals(other._stages, _stages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, status, generationError,
      const DeepCollectionEquality().hash(_stages));

  /// Create a copy of ReadingProgram
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReadingProgramImplCopyWith<_$ReadingProgramImpl> get copyWith =>
      __$$ReadingProgramImplCopyWithImpl<_$ReadingProgramImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReadingProgramImplToJson(
      this,
    );
  }
}

abstract class _ReadingProgram extends ReadingProgram {
  const factory _ReadingProgram(
      {required final String id,
      final String status,
      @JsonKey(name: 'generation_error') final String? generationError,
      final List<ReadingStageSummary> stages}) = _$ReadingProgramImpl;
  const _ReadingProgram._() : super._();

  factory _ReadingProgram.fromJson(Map<String, dynamic> json) =
      _$ReadingProgramImpl.fromJson;

  @override
  String get id;

  /// generating | active | completed | failed
  @override
  String get status;
  @override
  @JsonKey(name: 'generation_error')
  String? get generationError;
  @override
  List<ReadingStageSummary> get stages;

  /// Create a copy of ReadingProgram
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReadingProgramImplCopyWith<_$ReadingProgramImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReadingStep _$ReadingStepFromJson(Map<String, dynamic> json) {
  return _ReadingStep.fromJson(json);
}

/// @nodoc
mixin _$ReadingStep {
  @JsonKey(name: 'step_id')
  String get stepId => throw _privateConstructorUsedError;

  /// free_read | guided_read | echo | cold_read | punctuation |
  /// speed_ladder | vocab_context (§5 catalogue)
  String get type => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  int get xp => throw _privateConstructorUsedError;
  String? get passage => throw _privateConstructorUsedError;
  String? get sentence => throw _privateConstructorUsedError;
  @JsonKey(name: 'guide_wpm')
  int? get guideWpm => throw _privateConstructorUsedError;
  @JsonKey(name: 'target_notes')
  String? get targetNotes => throw _privateConstructorUsedError;

  /// Serializes this ReadingStep to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReadingStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReadingStepCopyWith<ReadingStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadingStepCopyWith<$Res> {
  factory $ReadingStepCopyWith(
          ReadingStep value, $Res Function(ReadingStep) then) =
      _$ReadingStepCopyWithImpl<$Res, ReadingStep>;
  @useResult
  $Res call(
      {@JsonKey(name: 'step_id') String stepId,
      String type,
      String? title,
      int xp,
      String? passage,
      String? sentence,
      @JsonKey(name: 'guide_wpm') int? guideWpm,
      @JsonKey(name: 'target_notes') String? targetNotes});
}

/// @nodoc
class _$ReadingStepCopyWithImpl<$Res, $Val extends ReadingStep>
    implements $ReadingStepCopyWith<$Res> {
  _$ReadingStepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReadingStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stepId = null,
    Object? type = null,
    Object? title = freezed,
    Object? xp = null,
    Object? passage = freezed,
    Object? sentence = freezed,
    Object? guideWpm = freezed,
    Object? targetNotes = freezed,
  }) {
    return _then(_value.copyWith(
      stepId: null == stepId
          ? _value.stepId
          : stepId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      xp: null == xp
          ? _value.xp
          : xp // ignore: cast_nullable_to_non_nullable
              as int,
      passage: freezed == passage
          ? _value.passage
          : passage // ignore: cast_nullable_to_non_nullable
              as String?,
      sentence: freezed == sentence
          ? _value.sentence
          : sentence // ignore: cast_nullable_to_non_nullable
              as String?,
      guideWpm: freezed == guideWpm
          ? _value.guideWpm
          : guideWpm // ignore: cast_nullable_to_non_nullable
              as int?,
      targetNotes: freezed == targetNotes
          ? _value.targetNotes
          : targetNotes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReadingStepImplCopyWith<$Res>
    implements $ReadingStepCopyWith<$Res> {
  factory _$$ReadingStepImplCopyWith(
          _$ReadingStepImpl value, $Res Function(_$ReadingStepImpl) then) =
      __$$ReadingStepImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'step_id') String stepId,
      String type,
      String? title,
      int xp,
      String? passage,
      String? sentence,
      @JsonKey(name: 'guide_wpm') int? guideWpm,
      @JsonKey(name: 'target_notes') String? targetNotes});
}

/// @nodoc
class __$$ReadingStepImplCopyWithImpl<$Res>
    extends _$ReadingStepCopyWithImpl<$Res, _$ReadingStepImpl>
    implements _$$ReadingStepImplCopyWith<$Res> {
  __$$ReadingStepImplCopyWithImpl(
      _$ReadingStepImpl _value, $Res Function(_$ReadingStepImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReadingStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stepId = null,
    Object? type = null,
    Object? title = freezed,
    Object? xp = null,
    Object? passage = freezed,
    Object? sentence = freezed,
    Object? guideWpm = freezed,
    Object? targetNotes = freezed,
  }) {
    return _then(_$ReadingStepImpl(
      stepId: null == stepId
          ? _value.stepId
          : stepId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      xp: null == xp
          ? _value.xp
          : xp // ignore: cast_nullable_to_non_nullable
              as int,
      passage: freezed == passage
          ? _value.passage
          : passage // ignore: cast_nullable_to_non_nullable
              as String?,
      sentence: freezed == sentence
          ? _value.sentence
          : sentence // ignore: cast_nullable_to_non_nullable
              as String?,
      guideWpm: freezed == guideWpm
          ? _value.guideWpm
          : guideWpm // ignore: cast_nullable_to_non_nullable
              as int?,
      targetNotes: freezed == targetNotes
          ? _value.targetNotes
          : targetNotes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReadingStepImpl extends _ReadingStep {
  const _$ReadingStepImpl(
      {@JsonKey(name: 'step_id') required this.stepId,
      this.type = 'free_read',
      this.title,
      this.xp = 6,
      this.passage,
      this.sentence,
      @JsonKey(name: 'guide_wpm') this.guideWpm,
      @JsonKey(name: 'target_notes') this.targetNotes})
      : super._();

  factory _$ReadingStepImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReadingStepImplFromJson(json);

  @override
  @JsonKey(name: 'step_id')
  final String stepId;

  /// free_read | guided_read | echo | cold_read | punctuation |
  /// speed_ladder | vocab_context (§5 catalogue)
  @override
  @JsonKey()
  final String type;
  @override
  final String? title;
  @override
  @JsonKey()
  final int xp;
  @override
  final String? passage;
  @override
  final String? sentence;
  @override
  @JsonKey(name: 'guide_wpm')
  final int? guideWpm;
  @override
  @JsonKey(name: 'target_notes')
  final String? targetNotes;

  @override
  String toString() {
    return 'ReadingStep(stepId: $stepId, type: $type, title: $title, xp: $xp, passage: $passage, sentence: $sentence, guideWpm: $guideWpm, targetNotes: $targetNotes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReadingStepImpl &&
            (identical(other.stepId, stepId) || other.stepId == stepId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.xp, xp) || other.xp == xp) &&
            (identical(other.passage, passage) || other.passage == passage) &&
            (identical(other.sentence, sentence) ||
                other.sentence == sentence) &&
            (identical(other.guideWpm, guideWpm) ||
                other.guideWpm == guideWpm) &&
            (identical(other.targetNotes, targetNotes) ||
                other.targetNotes == targetNotes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, stepId, type, title, xp, passage,
      sentence, guideWpm, targetNotes);

  /// Create a copy of ReadingStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReadingStepImplCopyWith<_$ReadingStepImpl> get copyWith =>
      __$$ReadingStepImplCopyWithImpl<_$ReadingStepImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReadingStepImplToJson(
      this,
    );
  }
}

abstract class _ReadingStep extends ReadingStep {
  const factory _ReadingStep(
          {@JsonKey(name: 'step_id') required final String stepId,
          final String type,
          final String? title,
          final int xp,
          final String? passage,
          final String? sentence,
          @JsonKey(name: 'guide_wpm') final int? guideWpm,
          @JsonKey(name: 'target_notes') final String? targetNotes}) =
      _$ReadingStepImpl;
  const _ReadingStep._() : super._();

  factory _ReadingStep.fromJson(Map<String, dynamic> json) =
      _$ReadingStepImpl.fromJson;

  @override
  @JsonKey(name: 'step_id')
  String get stepId;

  /// free_read | guided_read | echo | cold_read | punctuation |
  /// speed_ladder | vocab_context (§5 catalogue)
  @override
  String get type;
  @override
  String? get title;
  @override
  int get xp;
  @override
  String? get passage;
  @override
  String? get sentence;
  @override
  @JsonKey(name: 'guide_wpm')
  int? get guideWpm;
  @override
  @JsonKey(name: 'target_notes')
  String? get targetNotes;

  /// Create a copy of ReadingStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReadingStepImplCopyWith<_$ReadingStepImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReadingLesson _$ReadingLessonFromJson(Map<String, dynamic> json) {
  return _ReadingLesson.fromJson(json);
}

/// @nodoc
mixin _$ReadingLesson {
  @JsonKey(name: 'lesson_id')
  String get lessonId => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get focus => throw _privateConstructorUsedError;
  @JsonKey(name: 'estimated_min')
  int? get estimatedMin => throw _privateConstructorUsedError;
  int get xp => throw _privateConstructorUsedError;
  List<ReadingStep> get steps => throw _privateConstructorUsedError;

  /// Serializes this ReadingLesson to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReadingLesson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReadingLessonCopyWith<ReadingLesson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadingLessonCopyWith<$Res> {
  factory $ReadingLessonCopyWith(
          ReadingLesson value, $Res Function(ReadingLesson) then) =
      _$ReadingLessonCopyWithImpl<$Res, ReadingLesson>;
  @useResult
  $Res call(
      {@JsonKey(name: 'lesson_id') String lessonId,
      String? title,
      String? focus,
      @JsonKey(name: 'estimated_min') int? estimatedMin,
      int xp,
      List<ReadingStep> steps});
}

/// @nodoc
class _$ReadingLessonCopyWithImpl<$Res, $Val extends ReadingLesson>
    implements $ReadingLessonCopyWith<$Res> {
  _$ReadingLessonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReadingLesson
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lessonId = null,
    Object? title = freezed,
    Object? focus = freezed,
    Object? estimatedMin = freezed,
    Object? xp = null,
    Object? steps = null,
  }) {
    return _then(_value.copyWith(
      lessonId: null == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      focus: freezed == focus
          ? _value.focus
          : focus // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedMin: freezed == estimatedMin
          ? _value.estimatedMin
          : estimatedMin // ignore: cast_nullable_to_non_nullable
              as int?,
      xp: null == xp
          ? _value.xp
          : xp // ignore: cast_nullable_to_non_nullable
              as int,
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<ReadingStep>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReadingLessonImplCopyWith<$Res>
    implements $ReadingLessonCopyWith<$Res> {
  factory _$$ReadingLessonImplCopyWith(
          _$ReadingLessonImpl value, $Res Function(_$ReadingLessonImpl) then) =
      __$$ReadingLessonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'lesson_id') String lessonId,
      String? title,
      String? focus,
      @JsonKey(name: 'estimated_min') int? estimatedMin,
      int xp,
      List<ReadingStep> steps});
}

/// @nodoc
class __$$ReadingLessonImplCopyWithImpl<$Res>
    extends _$ReadingLessonCopyWithImpl<$Res, _$ReadingLessonImpl>
    implements _$$ReadingLessonImplCopyWith<$Res> {
  __$$ReadingLessonImplCopyWithImpl(
      _$ReadingLessonImpl _value, $Res Function(_$ReadingLessonImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReadingLesson
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lessonId = null,
    Object? title = freezed,
    Object? focus = freezed,
    Object? estimatedMin = freezed,
    Object? xp = null,
    Object? steps = null,
  }) {
    return _then(_$ReadingLessonImpl(
      lessonId: null == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      focus: freezed == focus
          ? _value.focus
          : focus // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedMin: freezed == estimatedMin
          ? _value.estimatedMin
          : estimatedMin // ignore: cast_nullable_to_non_nullable
              as int?,
      xp: null == xp
          ? _value.xp
          : xp // ignore: cast_nullable_to_non_nullable
              as int,
      steps: null == steps
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<ReadingStep>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReadingLessonImpl extends _ReadingLesson {
  const _$ReadingLessonImpl(
      {@JsonKey(name: 'lesson_id') required this.lessonId,
      this.title,
      this.focus,
      @JsonKey(name: 'estimated_min') this.estimatedMin,
      this.xp = 0,
      final List<ReadingStep> steps = const []})
      : _steps = steps,
        super._();

  factory _$ReadingLessonImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReadingLessonImplFromJson(json);

  @override
  @JsonKey(name: 'lesson_id')
  final String lessonId;
  @override
  final String? title;
  @override
  final String? focus;
  @override
  @JsonKey(name: 'estimated_min')
  final int? estimatedMin;
  @override
  @JsonKey()
  final int xp;
  final List<ReadingStep> _steps;
  @override
  @JsonKey()
  List<ReadingStep> get steps {
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  @override
  String toString() {
    return 'ReadingLesson(lessonId: $lessonId, title: $title, focus: $focus, estimatedMin: $estimatedMin, xp: $xp, steps: $steps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReadingLessonImpl &&
            (identical(other.lessonId, lessonId) ||
                other.lessonId == lessonId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.focus, focus) || other.focus == focus) &&
            (identical(other.estimatedMin, estimatedMin) ||
                other.estimatedMin == estimatedMin) &&
            (identical(other.xp, xp) || other.xp == xp) &&
            const DeepCollectionEquality().equals(other._steps, _steps));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lessonId, title, focus,
      estimatedMin, xp, const DeepCollectionEquality().hash(_steps));

  /// Create a copy of ReadingLesson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReadingLessonImplCopyWith<_$ReadingLessonImpl> get copyWith =>
      __$$ReadingLessonImplCopyWithImpl<_$ReadingLessonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReadingLessonImplToJson(
      this,
    );
  }
}

abstract class _ReadingLesson extends ReadingLesson {
  const factory _ReadingLesson(
      {@JsonKey(name: 'lesson_id') required final String lessonId,
      final String? title,
      final String? focus,
      @JsonKey(name: 'estimated_min') final int? estimatedMin,
      final int xp,
      final List<ReadingStep> steps}) = _$ReadingLessonImpl;
  const _ReadingLesson._() : super._();

  factory _ReadingLesson.fromJson(Map<String, dynamic> json) =
      _$ReadingLessonImpl.fromJson;

  @override
  @JsonKey(name: 'lesson_id')
  String get lessonId;
  @override
  String? get title;
  @override
  String? get focus;
  @override
  @JsonKey(name: 'estimated_min')
  int? get estimatedMin;
  @override
  int get xp;
  @override
  List<ReadingStep> get steps;

  /// Create a copy of ReadingLesson
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReadingLessonImplCopyWith<_$ReadingLessonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReadingLessonProgress _$ReadingLessonProgressFromJson(
    Map<String, dynamic> json) {
  return _ReadingLessonProgress.fromJson(json);
}

/// @nodoc
mixin _$ReadingLessonProgress {
  @JsonKey(name: 'lesson_id')
  String get lessonId => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_step_ids')
  List<String> get completedStepIds => throw _privateConstructorUsedError;

  /// in_progress | completed
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'best_scores')
  Map<String, dynamic>? get bestScores => throw _privateConstructorUsedError;
  int get xp => throw _privateConstructorUsedError;

  /// Serializes this ReadingLessonProgress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReadingLessonProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReadingLessonProgressCopyWith<ReadingLessonProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadingLessonProgressCopyWith<$Res> {
  factory $ReadingLessonProgressCopyWith(ReadingLessonProgress value,
          $Res Function(ReadingLessonProgress) then) =
      _$ReadingLessonProgressCopyWithImpl<$Res, ReadingLessonProgress>;
  @useResult
  $Res call(
      {@JsonKey(name: 'lesson_id') String lessonId,
      @JsonKey(name: 'completed_step_ids') List<String> completedStepIds,
      String status,
      @JsonKey(name: 'best_scores') Map<String, dynamic>? bestScores,
      int xp});
}

/// @nodoc
class _$ReadingLessonProgressCopyWithImpl<$Res,
        $Val extends ReadingLessonProgress>
    implements $ReadingLessonProgressCopyWith<$Res> {
  _$ReadingLessonProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReadingLessonProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lessonId = null,
    Object? completedStepIds = null,
    Object? status = null,
    Object? bestScores = freezed,
    Object? xp = null,
  }) {
    return _then(_value.copyWith(
      lessonId: null == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as String,
      completedStepIds: null == completedStepIds
          ? _value.completedStepIds
          : completedStepIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      bestScores: freezed == bestScores
          ? _value.bestScores
          : bestScores // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      xp: null == xp
          ? _value.xp
          : xp // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReadingLessonProgressImplCopyWith<$Res>
    implements $ReadingLessonProgressCopyWith<$Res> {
  factory _$$ReadingLessonProgressImplCopyWith(
          _$ReadingLessonProgressImpl value,
          $Res Function(_$ReadingLessonProgressImpl) then) =
      __$$ReadingLessonProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'lesson_id') String lessonId,
      @JsonKey(name: 'completed_step_ids') List<String> completedStepIds,
      String status,
      @JsonKey(name: 'best_scores') Map<String, dynamic>? bestScores,
      int xp});
}

/// @nodoc
class __$$ReadingLessonProgressImplCopyWithImpl<$Res>
    extends _$ReadingLessonProgressCopyWithImpl<$Res,
        _$ReadingLessonProgressImpl>
    implements _$$ReadingLessonProgressImplCopyWith<$Res> {
  __$$ReadingLessonProgressImplCopyWithImpl(_$ReadingLessonProgressImpl _value,
      $Res Function(_$ReadingLessonProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReadingLessonProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lessonId = null,
    Object? completedStepIds = null,
    Object? status = null,
    Object? bestScores = freezed,
    Object? xp = null,
  }) {
    return _then(_$ReadingLessonProgressImpl(
      lessonId: null == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as String,
      completedStepIds: null == completedStepIds
          ? _value._completedStepIds
          : completedStepIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      bestScores: freezed == bestScores
          ? _value._bestScores
          : bestScores // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      xp: null == xp
          ? _value.xp
          : xp // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReadingLessonProgressImpl implements _ReadingLessonProgress {
  const _$ReadingLessonProgressImpl(
      {@JsonKey(name: 'lesson_id') required this.lessonId,
      @JsonKey(name: 'completed_step_ids')
      final List<String> completedStepIds = const [],
      this.status = 'in_progress',
      @JsonKey(name: 'best_scores') final Map<String, dynamic>? bestScores,
      this.xp = 0})
      : _completedStepIds = completedStepIds,
        _bestScores = bestScores;

  factory _$ReadingLessonProgressImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReadingLessonProgressImplFromJson(json);

  @override
  @JsonKey(name: 'lesson_id')
  final String lessonId;
  final List<String> _completedStepIds;
  @override
  @JsonKey(name: 'completed_step_ids')
  List<String> get completedStepIds {
    if (_completedStepIds is EqualUnmodifiableListView)
      return _completedStepIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_completedStepIds);
  }

  /// in_progress | completed
  @override
  @JsonKey()
  final String status;
  final Map<String, dynamic>? _bestScores;
  @override
  @JsonKey(name: 'best_scores')
  Map<String, dynamic>? get bestScores {
    final value = _bestScores;
    if (value == null) return null;
    if (_bestScores is EqualUnmodifiableMapView) return _bestScores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey()
  final int xp;

  @override
  String toString() {
    return 'ReadingLessonProgress(lessonId: $lessonId, completedStepIds: $completedStepIds, status: $status, bestScores: $bestScores, xp: $xp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReadingLessonProgressImpl &&
            (identical(other.lessonId, lessonId) ||
                other.lessonId == lessonId) &&
            const DeepCollectionEquality()
                .equals(other._completedStepIds, _completedStepIds) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._bestScores, _bestScores) &&
            (identical(other.xp, xp) || other.xp == xp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      lessonId,
      const DeepCollectionEquality().hash(_completedStepIds),
      status,
      const DeepCollectionEquality().hash(_bestScores),
      xp);

  /// Create a copy of ReadingLessonProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReadingLessonProgressImplCopyWith<_$ReadingLessonProgressImpl>
      get copyWith => __$$ReadingLessonProgressImplCopyWithImpl<
          _$ReadingLessonProgressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReadingLessonProgressImplToJson(
      this,
    );
  }
}

abstract class _ReadingLessonProgress implements ReadingLessonProgress {
  const factory _ReadingLessonProgress(
      {@JsonKey(name: 'lesson_id') required final String lessonId,
      @JsonKey(name: 'completed_step_ids') final List<String> completedStepIds,
      final String status,
      @JsonKey(name: 'best_scores') final Map<String, dynamic>? bestScores,
      final int xp}) = _$ReadingLessonProgressImpl;

  factory _ReadingLessonProgress.fromJson(Map<String, dynamic> json) =
      _$ReadingLessonProgressImpl.fromJson;

  @override
  @JsonKey(name: 'lesson_id')
  String get lessonId;
  @override
  @JsonKey(name: 'completed_step_ids')
  List<String> get completedStepIds;

  /// in_progress | completed
  @override
  String get status;
  @override
  @JsonKey(name: 'best_scores')
  Map<String, dynamic>? get bestScores;
  @override
  int get xp;

  /// Create a copy of ReadingLessonProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReadingLessonProgressImplCopyWith<_$ReadingLessonProgressImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ReadingStage _$ReadingStageFromJson(Map<String, dynamic> json) {
  return _ReadingStage.fromJson(json);
}

/// @nodoc
mixin _$ReadingStage {
  String get id => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get theme => throw _privateConstructorUsedError;
  @JsonKey(name: 'focus_areas')
  List<String> get focusAreas => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'generation_error')
  String? get generationError => throw _privateConstructorUsedError;
  List<ReadingLesson> get lessons => throw _privateConstructorUsedError;
  @JsonKey(name: 'target_vocab')
  List<Map<String, dynamic>> get targetVocab =>
      throw _privateConstructorUsedError;
  List<ReadingLessonProgress> get progress =>
      throw _privateConstructorUsedError;

  /// Serializes this ReadingStage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReadingStage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReadingStageCopyWith<ReadingStage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadingStageCopyWith<$Res> {
  factory $ReadingStageCopyWith(
          ReadingStage value, $Res Function(ReadingStage) then) =
      _$ReadingStageCopyWithImpl<$Res, ReadingStage>;
  @useResult
  $Res call(
      {String id,
      int position,
      String title,
      String? theme,
      @JsonKey(name: 'focus_areas') List<String> focusAreas,
      String status,
      @JsonKey(name: 'generation_error') String? generationError,
      List<ReadingLesson> lessons,
      @JsonKey(name: 'target_vocab') List<Map<String, dynamic>> targetVocab,
      List<ReadingLessonProgress> progress});
}

/// @nodoc
class _$ReadingStageCopyWithImpl<$Res, $Val extends ReadingStage>
    implements $ReadingStageCopyWith<$Res> {
  _$ReadingStageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReadingStage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? position = null,
    Object? title = null,
    Object? theme = freezed,
    Object? focusAreas = null,
    Object? status = null,
    Object? generationError = freezed,
    Object? lessons = null,
    Object? targetVocab = null,
    Object? progress = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      theme: freezed == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String?,
      focusAreas: null == focusAreas
          ? _value.focusAreas
          : focusAreas // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      generationError: freezed == generationError
          ? _value.generationError
          : generationError // ignore: cast_nullable_to_non_nullable
              as String?,
      lessons: null == lessons
          ? _value.lessons
          : lessons // ignore: cast_nullable_to_non_nullable
              as List<ReadingLesson>,
      targetVocab: null == targetVocab
          ? _value.targetVocab
          : targetVocab // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as List<ReadingLessonProgress>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReadingStageImplCopyWith<$Res>
    implements $ReadingStageCopyWith<$Res> {
  factory _$$ReadingStageImplCopyWith(
          _$ReadingStageImpl value, $Res Function(_$ReadingStageImpl) then) =
      __$$ReadingStageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int position,
      String title,
      String? theme,
      @JsonKey(name: 'focus_areas') List<String> focusAreas,
      String status,
      @JsonKey(name: 'generation_error') String? generationError,
      List<ReadingLesson> lessons,
      @JsonKey(name: 'target_vocab') List<Map<String, dynamic>> targetVocab,
      List<ReadingLessonProgress> progress});
}

/// @nodoc
class __$$ReadingStageImplCopyWithImpl<$Res>
    extends _$ReadingStageCopyWithImpl<$Res, _$ReadingStageImpl>
    implements _$$ReadingStageImplCopyWith<$Res> {
  __$$ReadingStageImplCopyWithImpl(
      _$ReadingStageImpl _value, $Res Function(_$ReadingStageImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReadingStage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? position = null,
    Object? title = null,
    Object? theme = freezed,
    Object? focusAreas = null,
    Object? status = null,
    Object? generationError = freezed,
    Object? lessons = null,
    Object? targetVocab = null,
    Object? progress = null,
  }) {
    return _then(_$ReadingStageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      theme: freezed == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String?,
      focusAreas: null == focusAreas
          ? _value._focusAreas
          : focusAreas // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      generationError: freezed == generationError
          ? _value.generationError
          : generationError // ignore: cast_nullable_to_non_nullable
              as String?,
      lessons: null == lessons
          ? _value._lessons
          : lessons // ignore: cast_nullable_to_non_nullable
              as List<ReadingLesson>,
      targetVocab: null == targetVocab
          ? _value._targetVocab
          : targetVocab // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      progress: null == progress
          ? _value._progress
          : progress // ignore: cast_nullable_to_non_nullable
              as List<ReadingLessonProgress>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReadingStageImpl extends _ReadingStage {
  const _$ReadingStageImpl(
      {required this.id,
      required this.position,
      required this.title,
      this.theme,
      @JsonKey(name: 'focus_areas') final List<String> focusAreas = const [],
      this.status = 'locked',
      @JsonKey(name: 'generation_error') this.generationError,
      final List<ReadingLesson> lessons = const [],
      @JsonKey(name: 'target_vocab')
      final List<Map<String, dynamic>> targetVocab = const [],
      final List<ReadingLessonProgress> progress = const []})
      : _focusAreas = focusAreas,
        _lessons = lessons,
        _targetVocab = targetVocab,
        _progress = progress,
        super._();

  factory _$ReadingStageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReadingStageImplFromJson(json);

  @override
  final String id;
  @override
  final int position;
  @override
  final String title;
  @override
  final String? theme;
  final List<String> _focusAreas;
  @override
  @JsonKey(name: 'focus_areas')
  List<String> get focusAreas {
    if (_focusAreas is EqualUnmodifiableListView) return _focusAreas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_focusAreas);
  }

  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey(name: 'generation_error')
  final String? generationError;
  final List<ReadingLesson> _lessons;
  @override
  @JsonKey()
  List<ReadingLesson> get lessons {
    if (_lessons is EqualUnmodifiableListView) return _lessons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lessons);
  }

  final List<Map<String, dynamic>> _targetVocab;
  @override
  @JsonKey(name: 'target_vocab')
  List<Map<String, dynamic>> get targetVocab {
    if (_targetVocab is EqualUnmodifiableListView) return _targetVocab;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_targetVocab);
  }

  final List<ReadingLessonProgress> _progress;
  @override
  @JsonKey()
  List<ReadingLessonProgress> get progress {
    if (_progress is EqualUnmodifiableListView) return _progress;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_progress);
  }

  @override
  String toString() {
    return 'ReadingStage(id: $id, position: $position, title: $title, theme: $theme, focusAreas: $focusAreas, status: $status, generationError: $generationError, lessons: $lessons, targetVocab: $targetVocab, progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReadingStageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            const DeepCollectionEquality()
                .equals(other._focusAreas, _focusAreas) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.generationError, generationError) ||
                other.generationError == generationError) &&
            const DeepCollectionEquality().equals(other._lessons, _lessons) &&
            const DeepCollectionEquality()
                .equals(other._targetVocab, _targetVocab) &&
            const DeepCollectionEquality().equals(other._progress, _progress));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      position,
      title,
      theme,
      const DeepCollectionEquality().hash(_focusAreas),
      status,
      generationError,
      const DeepCollectionEquality().hash(_lessons),
      const DeepCollectionEquality().hash(_targetVocab),
      const DeepCollectionEquality().hash(_progress));

  /// Create a copy of ReadingStage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReadingStageImplCopyWith<_$ReadingStageImpl> get copyWith =>
      __$$ReadingStageImplCopyWithImpl<_$ReadingStageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReadingStageImplToJson(
      this,
    );
  }
}

abstract class _ReadingStage extends ReadingStage {
  const factory _ReadingStage(
      {required final String id,
      required final int position,
      required final String title,
      final String? theme,
      @JsonKey(name: 'focus_areas') final List<String> focusAreas,
      final String status,
      @JsonKey(name: 'generation_error') final String? generationError,
      final List<ReadingLesson> lessons,
      @JsonKey(name: 'target_vocab')
      final List<Map<String, dynamic>> targetVocab,
      final List<ReadingLessonProgress> progress}) = _$ReadingStageImpl;
  const _ReadingStage._() : super._();

  factory _ReadingStage.fromJson(Map<String, dynamic> json) =
      _$ReadingStageImpl.fromJson;

  @override
  String get id;
  @override
  int get position;
  @override
  String get title;
  @override
  String? get theme;
  @override
  @JsonKey(name: 'focus_areas')
  List<String> get focusAreas;
  @override
  String get status;
  @override
  @JsonKey(name: 'generation_error')
  String? get generationError;
  @override
  List<ReadingLesson> get lessons;
  @override
  @JsonKey(name: 'target_vocab')
  List<Map<String, dynamic>> get targetVocab;
  @override
  List<ReadingLessonProgress> get progress;

  /// Create a copy of ReadingStage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReadingStageImplCopyWith<_$ReadingStageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReadingWordFeedback _$ReadingWordFeedbackFromJson(Map<String, dynamic> json) {
  return _ReadingWordFeedback.fromJson(json);
}

/// @nodoc
mixin _$ReadingWordFeedback {
  String get word => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;

  /// correct | substituted | skipped | inserted-neighbour
  String get status => throw _privateConstructorUsedError;
  String? get heard => throw _privateConstructorUsedError;
  @JsonKey(name: 'pause_before_ms')
  int? get pauseBeforeMs => throw _privateConstructorUsedError;
  bool get hesitation => throw _privateConstructorUsedError;

  /// Serializes this ReadingWordFeedback to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReadingWordFeedback
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReadingWordFeedbackCopyWith<ReadingWordFeedback> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadingWordFeedbackCopyWith<$Res> {
  factory $ReadingWordFeedbackCopyWith(
          ReadingWordFeedback value, $Res Function(ReadingWordFeedback) then) =
      _$ReadingWordFeedbackCopyWithImpl<$Res, ReadingWordFeedback>;
  @useResult
  $Res call(
      {String word,
      int index,
      String status,
      String? heard,
      @JsonKey(name: 'pause_before_ms') int? pauseBeforeMs,
      bool hesitation});
}

/// @nodoc
class _$ReadingWordFeedbackCopyWithImpl<$Res, $Val extends ReadingWordFeedback>
    implements $ReadingWordFeedbackCopyWith<$Res> {
  _$ReadingWordFeedbackCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReadingWordFeedback
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? index = null,
    Object? status = null,
    Object? heard = freezed,
    Object? pauseBeforeMs = freezed,
    Object? hesitation = null,
  }) {
    return _then(_value.copyWith(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      heard: freezed == heard
          ? _value.heard
          : heard // ignore: cast_nullable_to_non_nullable
              as String?,
      pauseBeforeMs: freezed == pauseBeforeMs
          ? _value.pauseBeforeMs
          : pauseBeforeMs // ignore: cast_nullable_to_non_nullable
              as int?,
      hesitation: null == hesitation
          ? _value.hesitation
          : hesitation // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReadingWordFeedbackImplCopyWith<$Res>
    implements $ReadingWordFeedbackCopyWith<$Res> {
  factory _$$ReadingWordFeedbackImplCopyWith(_$ReadingWordFeedbackImpl value,
          $Res Function(_$ReadingWordFeedbackImpl) then) =
      __$$ReadingWordFeedbackImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String word,
      int index,
      String status,
      String? heard,
      @JsonKey(name: 'pause_before_ms') int? pauseBeforeMs,
      bool hesitation});
}

/// @nodoc
class __$$ReadingWordFeedbackImplCopyWithImpl<$Res>
    extends _$ReadingWordFeedbackCopyWithImpl<$Res, _$ReadingWordFeedbackImpl>
    implements _$$ReadingWordFeedbackImplCopyWith<$Res> {
  __$$ReadingWordFeedbackImplCopyWithImpl(_$ReadingWordFeedbackImpl _value,
      $Res Function(_$ReadingWordFeedbackImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReadingWordFeedback
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? index = null,
    Object? status = null,
    Object? heard = freezed,
    Object? pauseBeforeMs = freezed,
    Object? hesitation = null,
  }) {
    return _then(_$ReadingWordFeedbackImpl(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      heard: freezed == heard
          ? _value.heard
          : heard // ignore: cast_nullable_to_non_nullable
              as String?,
      pauseBeforeMs: freezed == pauseBeforeMs
          ? _value.pauseBeforeMs
          : pauseBeforeMs // ignore: cast_nullable_to_non_nullable
              as int?,
      hesitation: null == hesitation
          ? _value.hesitation
          : hesitation // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReadingWordFeedbackImpl implements _ReadingWordFeedback {
  const _$ReadingWordFeedbackImpl(
      {required this.word,
      required this.index,
      this.status = 'correct',
      this.heard,
      @JsonKey(name: 'pause_before_ms') this.pauseBeforeMs,
      this.hesitation = false});

  factory _$ReadingWordFeedbackImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReadingWordFeedbackImplFromJson(json);

  @override
  final String word;
  @override
  final int index;

  /// correct | substituted | skipped | inserted-neighbour
  @override
  @JsonKey()
  final String status;
  @override
  final String? heard;
  @override
  @JsonKey(name: 'pause_before_ms')
  final int? pauseBeforeMs;
  @override
  @JsonKey()
  final bool hesitation;

  @override
  String toString() {
    return 'ReadingWordFeedback(word: $word, index: $index, status: $status, heard: $heard, pauseBeforeMs: $pauseBeforeMs, hesitation: $hesitation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReadingWordFeedbackImpl &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.heard, heard) || other.heard == heard) &&
            (identical(other.pauseBeforeMs, pauseBeforeMs) ||
                other.pauseBeforeMs == pauseBeforeMs) &&
            (identical(other.hesitation, hesitation) ||
                other.hesitation == hesitation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, word, index, status, heard, pauseBeforeMs, hesitation);

  /// Create a copy of ReadingWordFeedback
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReadingWordFeedbackImplCopyWith<_$ReadingWordFeedbackImpl> get copyWith =>
      __$$ReadingWordFeedbackImplCopyWithImpl<_$ReadingWordFeedbackImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReadingWordFeedbackImplToJson(
      this,
    );
  }
}

abstract class _ReadingWordFeedback implements ReadingWordFeedback {
  const factory _ReadingWordFeedback(
      {required final String word,
      required final int index,
      final String status,
      final String? heard,
      @JsonKey(name: 'pause_before_ms') final int? pauseBeforeMs,
      final bool hesitation}) = _$ReadingWordFeedbackImpl;

  factory _ReadingWordFeedback.fromJson(Map<String, dynamic> json) =
      _$ReadingWordFeedbackImpl.fromJson;

  @override
  String get word;
  @override
  int get index;

  /// correct | substituted | skipped | inserted-neighbour
  @override
  String get status;
  @override
  String? get heard;
  @override
  @JsonKey(name: 'pause_before_ms')
  int? get pauseBeforeMs;
  @override
  bool get hesitation;

  /// Create a copy of ReadingWordFeedback
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReadingWordFeedbackImplCopyWith<_$ReadingWordFeedbackImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReadingAttempt _$ReadingAttemptFromJson(Map<String, dynamic> json) {
  return _ReadingAttempt.fromJson(json);
}

/// @nodoc
mixin _$ReadingAttempt {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'program_id')
  String? get programId => throw _privateConstructorUsedError;
  @JsonKey(name: 'stage_id')
  String? get stageId => throw _privateConstructorUsedError;
  @JsonKey(name: 'lesson_id')
  String? get lessonId => throw _privateConstructorUsedError;
  @JsonKey(name: 'step_id')
  String? get stepId => throw _privateConstructorUsedError;
  @JsonKey(name: 'attempt_type')
  String get attemptType => throw _privateConstructorUsedError;
  @JsonKey(name: 'passage_text')
  String? get passageText => throw _privateConstructorUsedError;
  @JsonKey(name: 'guide_wpm')
  int? get guideWpm => throw _privateConstructorUsedError;
  @JsonKey(name: 'recording_upload_status')
  String? get recordingUploadStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'attempt_status')
  String? get attemptStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'analysis_status')
  String? get analysisStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'analysis_error')
  String? get analysisError => throw _privateConstructorUsedError;
  String? get transcript => throw _privateConstructorUsedError;
  @JsonKey(name: 'match_pct')
  int? get matchPct => throw _privateConstructorUsedError;
  @JsonKey(name: 'hesitance_score')
  int? get hesitanceScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'pace_score')
  int? get paceScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'flow_score')
  int? get flowScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'overall_score')
  int? get overallScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'pace_delta_pct')
  int? get paceDeltaPct => throw _privateConstructorUsedError;
  @JsonKey(name: 'word_feedback')
  List<ReadingWordFeedback> get wordFeedback =>
      throw _privateConstructorUsedError;
  Map<String, dynamic>? get analysis => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration_seconds')
  num? get durationSeconds => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this ReadingAttempt to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReadingAttempt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReadingAttemptCopyWith<ReadingAttempt> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadingAttemptCopyWith<$Res> {
  factory $ReadingAttemptCopyWith(
          ReadingAttempt value, $Res Function(ReadingAttempt) then) =
      _$ReadingAttemptCopyWithImpl<$Res, ReadingAttempt>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'program_id') String? programId,
      @JsonKey(name: 'stage_id') String? stageId,
      @JsonKey(name: 'lesson_id') String? lessonId,
      @JsonKey(name: 'step_id') String? stepId,
      @JsonKey(name: 'attempt_type') String attemptType,
      @JsonKey(name: 'passage_text') String? passageText,
      @JsonKey(name: 'guide_wpm') int? guideWpm,
      @JsonKey(name: 'recording_upload_status') String? recordingUploadStatus,
      @JsonKey(name: 'attempt_status') String? attemptStatus,
      @JsonKey(name: 'analysis_status') String? analysisStatus,
      @JsonKey(name: 'analysis_error') String? analysisError,
      String? transcript,
      @JsonKey(name: 'match_pct') int? matchPct,
      @JsonKey(name: 'hesitance_score') int? hesitanceScore,
      @JsonKey(name: 'pace_score') int? paceScore,
      @JsonKey(name: 'flow_score') int? flowScore,
      @JsonKey(name: 'overall_score') int? overallScore,
      @JsonKey(name: 'pace_delta_pct') int? paceDeltaPct,
      @JsonKey(name: 'word_feedback') List<ReadingWordFeedback> wordFeedback,
      Map<String, dynamic>? analysis,
      @JsonKey(name: 'duration_seconds') num? durationSeconds,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class _$ReadingAttemptCopyWithImpl<$Res, $Val extends ReadingAttempt>
    implements $ReadingAttemptCopyWith<$Res> {
  _$ReadingAttemptCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReadingAttempt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? programId = freezed,
    Object? stageId = freezed,
    Object? lessonId = freezed,
    Object? stepId = freezed,
    Object? attemptType = null,
    Object? passageText = freezed,
    Object? guideWpm = freezed,
    Object? recordingUploadStatus = freezed,
    Object? attemptStatus = freezed,
    Object? analysisStatus = freezed,
    Object? analysisError = freezed,
    Object? transcript = freezed,
    Object? matchPct = freezed,
    Object? hesitanceScore = freezed,
    Object? paceScore = freezed,
    Object? flowScore = freezed,
    Object? overallScore = freezed,
    Object? paceDeltaPct = freezed,
    Object? wordFeedback = null,
    Object? analysis = freezed,
    Object? durationSeconds = freezed,
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
      programId: freezed == programId
          ? _value.programId
          : programId // ignore: cast_nullable_to_non_nullable
              as String?,
      stageId: freezed == stageId
          ? _value.stageId
          : stageId // ignore: cast_nullable_to_non_nullable
              as String?,
      lessonId: freezed == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as String?,
      stepId: freezed == stepId
          ? _value.stepId
          : stepId // ignore: cast_nullable_to_non_nullable
              as String?,
      attemptType: null == attemptType
          ? _value.attemptType
          : attemptType // ignore: cast_nullable_to_non_nullable
              as String,
      passageText: freezed == passageText
          ? _value.passageText
          : passageText // ignore: cast_nullable_to_non_nullable
              as String?,
      guideWpm: freezed == guideWpm
          ? _value.guideWpm
          : guideWpm // ignore: cast_nullable_to_non_nullable
              as int?,
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
      transcript: freezed == transcript
          ? _value.transcript
          : transcript // ignore: cast_nullable_to_non_nullable
              as String?,
      matchPct: freezed == matchPct
          ? _value.matchPct
          : matchPct // ignore: cast_nullable_to_non_nullable
              as int?,
      hesitanceScore: freezed == hesitanceScore
          ? _value.hesitanceScore
          : hesitanceScore // ignore: cast_nullable_to_non_nullable
              as int?,
      paceScore: freezed == paceScore
          ? _value.paceScore
          : paceScore // ignore: cast_nullable_to_non_nullable
              as int?,
      flowScore: freezed == flowScore
          ? _value.flowScore
          : flowScore // ignore: cast_nullable_to_non_nullable
              as int?,
      overallScore: freezed == overallScore
          ? _value.overallScore
          : overallScore // ignore: cast_nullable_to_non_nullable
              as int?,
      paceDeltaPct: freezed == paceDeltaPct
          ? _value.paceDeltaPct
          : paceDeltaPct // ignore: cast_nullable_to_non_nullable
              as int?,
      wordFeedback: null == wordFeedback
          ? _value.wordFeedback
          : wordFeedback // ignore: cast_nullable_to_non_nullable
              as List<ReadingWordFeedback>,
      analysis: freezed == analysis
          ? _value.analysis
          : analysis // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      durationSeconds: freezed == durationSeconds
          ? _value.durationSeconds
          : durationSeconds // ignore: cast_nullable_to_non_nullable
              as num?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReadingAttemptImplCopyWith<$Res>
    implements $ReadingAttemptCopyWith<$Res> {
  factory _$$ReadingAttemptImplCopyWith(_$ReadingAttemptImpl value,
          $Res Function(_$ReadingAttemptImpl) then) =
      __$$ReadingAttemptImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'program_id') String? programId,
      @JsonKey(name: 'stage_id') String? stageId,
      @JsonKey(name: 'lesson_id') String? lessonId,
      @JsonKey(name: 'step_id') String? stepId,
      @JsonKey(name: 'attempt_type') String attemptType,
      @JsonKey(name: 'passage_text') String? passageText,
      @JsonKey(name: 'guide_wpm') int? guideWpm,
      @JsonKey(name: 'recording_upload_status') String? recordingUploadStatus,
      @JsonKey(name: 'attempt_status') String? attemptStatus,
      @JsonKey(name: 'analysis_status') String? analysisStatus,
      @JsonKey(name: 'analysis_error') String? analysisError,
      String? transcript,
      @JsonKey(name: 'match_pct') int? matchPct,
      @JsonKey(name: 'hesitance_score') int? hesitanceScore,
      @JsonKey(name: 'pace_score') int? paceScore,
      @JsonKey(name: 'flow_score') int? flowScore,
      @JsonKey(name: 'overall_score') int? overallScore,
      @JsonKey(name: 'pace_delta_pct') int? paceDeltaPct,
      @JsonKey(name: 'word_feedback') List<ReadingWordFeedback> wordFeedback,
      Map<String, dynamic>? analysis,
      @JsonKey(name: 'duration_seconds') num? durationSeconds,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class __$$ReadingAttemptImplCopyWithImpl<$Res>
    extends _$ReadingAttemptCopyWithImpl<$Res, _$ReadingAttemptImpl>
    implements _$$ReadingAttemptImplCopyWith<$Res> {
  __$$ReadingAttemptImplCopyWithImpl(
      _$ReadingAttemptImpl _value, $Res Function(_$ReadingAttemptImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReadingAttempt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? programId = freezed,
    Object? stageId = freezed,
    Object? lessonId = freezed,
    Object? stepId = freezed,
    Object? attemptType = null,
    Object? passageText = freezed,
    Object? guideWpm = freezed,
    Object? recordingUploadStatus = freezed,
    Object? attemptStatus = freezed,
    Object? analysisStatus = freezed,
    Object? analysisError = freezed,
    Object? transcript = freezed,
    Object? matchPct = freezed,
    Object? hesitanceScore = freezed,
    Object? paceScore = freezed,
    Object? flowScore = freezed,
    Object? overallScore = freezed,
    Object? paceDeltaPct = freezed,
    Object? wordFeedback = null,
    Object? analysis = freezed,
    Object? durationSeconds = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$ReadingAttemptImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      programId: freezed == programId
          ? _value.programId
          : programId // ignore: cast_nullable_to_non_nullable
              as String?,
      stageId: freezed == stageId
          ? _value.stageId
          : stageId // ignore: cast_nullable_to_non_nullable
              as String?,
      lessonId: freezed == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as String?,
      stepId: freezed == stepId
          ? _value.stepId
          : stepId // ignore: cast_nullable_to_non_nullable
              as String?,
      attemptType: null == attemptType
          ? _value.attemptType
          : attemptType // ignore: cast_nullable_to_non_nullable
              as String,
      passageText: freezed == passageText
          ? _value.passageText
          : passageText // ignore: cast_nullable_to_non_nullable
              as String?,
      guideWpm: freezed == guideWpm
          ? _value.guideWpm
          : guideWpm // ignore: cast_nullable_to_non_nullable
              as int?,
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
      transcript: freezed == transcript
          ? _value.transcript
          : transcript // ignore: cast_nullable_to_non_nullable
              as String?,
      matchPct: freezed == matchPct
          ? _value.matchPct
          : matchPct // ignore: cast_nullable_to_non_nullable
              as int?,
      hesitanceScore: freezed == hesitanceScore
          ? _value.hesitanceScore
          : hesitanceScore // ignore: cast_nullable_to_non_nullable
              as int?,
      paceScore: freezed == paceScore
          ? _value.paceScore
          : paceScore // ignore: cast_nullable_to_non_nullable
              as int?,
      flowScore: freezed == flowScore
          ? _value.flowScore
          : flowScore // ignore: cast_nullable_to_non_nullable
              as int?,
      overallScore: freezed == overallScore
          ? _value.overallScore
          : overallScore // ignore: cast_nullable_to_non_nullable
              as int?,
      paceDeltaPct: freezed == paceDeltaPct
          ? _value.paceDeltaPct
          : paceDeltaPct // ignore: cast_nullable_to_non_nullable
              as int?,
      wordFeedback: null == wordFeedback
          ? _value._wordFeedback
          : wordFeedback // ignore: cast_nullable_to_non_nullable
              as List<ReadingWordFeedback>,
      analysis: freezed == analysis
          ? _value._analysis
          : analysis // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      durationSeconds: freezed == durationSeconds
          ? _value.durationSeconds
          : durationSeconds // ignore: cast_nullable_to_non_nullable
              as num?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReadingAttemptImpl extends _ReadingAttempt {
  const _$ReadingAttemptImpl(
      {required this.id,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'program_id') this.programId,
      @JsonKey(name: 'stage_id') this.stageId,
      @JsonKey(name: 'lesson_id') this.lessonId,
      @JsonKey(name: 'step_id') this.stepId,
      @JsonKey(name: 'attempt_type') this.attemptType = 'free_read',
      @JsonKey(name: 'passage_text') this.passageText,
      @JsonKey(name: 'guide_wpm') this.guideWpm,
      @JsonKey(name: 'recording_upload_status') this.recordingUploadStatus,
      @JsonKey(name: 'attempt_status') this.attemptStatus,
      @JsonKey(name: 'analysis_status') this.analysisStatus,
      @JsonKey(name: 'analysis_error') this.analysisError,
      this.transcript,
      @JsonKey(name: 'match_pct') this.matchPct,
      @JsonKey(name: 'hesitance_score') this.hesitanceScore,
      @JsonKey(name: 'pace_score') this.paceScore,
      @JsonKey(name: 'flow_score') this.flowScore,
      @JsonKey(name: 'overall_score') this.overallScore,
      @JsonKey(name: 'pace_delta_pct') this.paceDeltaPct,
      @JsonKey(name: 'word_feedback')
      final List<ReadingWordFeedback> wordFeedback = const [],
      final Map<String, dynamic>? analysis,
      @JsonKey(name: 'duration_seconds') this.durationSeconds,
      @JsonKey(name: 'created_at') this.createdAt})
      : _wordFeedback = wordFeedback,
        _analysis = analysis,
        super._();

  factory _$ReadingAttemptImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReadingAttemptImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  @JsonKey(name: 'program_id')
  final String? programId;
  @override
  @JsonKey(name: 'stage_id')
  final String? stageId;
  @override
  @JsonKey(name: 'lesson_id')
  final String? lessonId;
  @override
  @JsonKey(name: 'step_id')
  final String? stepId;
  @override
  @JsonKey(name: 'attempt_type')
  final String attemptType;
  @override
  @JsonKey(name: 'passage_text')
  final String? passageText;
  @override
  @JsonKey(name: 'guide_wpm')
  final int? guideWpm;
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
  final String? transcript;
  @override
  @JsonKey(name: 'match_pct')
  final int? matchPct;
  @override
  @JsonKey(name: 'hesitance_score')
  final int? hesitanceScore;
  @override
  @JsonKey(name: 'pace_score')
  final int? paceScore;
  @override
  @JsonKey(name: 'flow_score')
  final int? flowScore;
  @override
  @JsonKey(name: 'overall_score')
  final int? overallScore;
  @override
  @JsonKey(name: 'pace_delta_pct')
  final int? paceDeltaPct;
  final List<ReadingWordFeedback> _wordFeedback;
  @override
  @JsonKey(name: 'word_feedback')
  List<ReadingWordFeedback> get wordFeedback {
    if (_wordFeedback is EqualUnmodifiableListView) return _wordFeedback;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wordFeedback);
  }

  final Map<String, dynamic>? _analysis;
  @override
  Map<String, dynamic>? get analysis {
    final value = _analysis;
    if (value == null) return null;
    if (_analysis is EqualUnmodifiableMapView) return _analysis;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'duration_seconds')
  final num? durationSeconds;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'ReadingAttempt(id: $id, userId: $userId, programId: $programId, stageId: $stageId, lessonId: $lessonId, stepId: $stepId, attemptType: $attemptType, passageText: $passageText, guideWpm: $guideWpm, recordingUploadStatus: $recordingUploadStatus, attemptStatus: $attemptStatus, analysisStatus: $analysisStatus, analysisError: $analysisError, transcript: $transcript, matchPct: $matchPct, hesitanceScore: $hesitanceScore, paceScore: $paceScore, flowScore: $flowScore, overallScore: $overallScore, paceDeltaPct: $paceDeltaPct, wordFeedback: $wordFeedback, analysis: $analysis, durationSeconds: $durationSeconds, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReadingAttemptImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.programId, programId) ||
                other.programId == programId) &&
            (identical(other.stageId, stageId) || other.stageId == stageId) &&
            (identical(other.lessonId, lessonId) ||
                other.lessonId == lessonId) &&
            (identical(other.stepId, stepId) || other.stepId == stepId) &&
            (identical(other.attemptType, attemptType) ||
                other.attemptType == attemptType) &&
            (identical(other.passageText, passageText) ||
                other.passageText == passageText) &&
            (identical(other.guideWpm, guideWpm) ||
                other.guideWpm == guideWpm) &&
            (identical(other.recordingUploadStatus, recordingUploadStatus) ||
                other.recordingUploadStatus == recordingUploadStatus) &&
            (identical(other.attemptStatus, attemptStatus) ||
                other.attemptStatus == attemptStatus) &&
            (identical(other.analysisStatus, analysisStatus) ||
                other.analysisStatus == analysisStatus) &&
            (identical(other.analysisError, analysisError) ||
                other.analysisError == analysisError) &&
            (identical(other.transcript, transcript) ||
                other.transcript == transcript) &&
            (identical(other.matchPct, matchPct) ||
                other.matchPct == matchPct) &&
            (identical(other.hesitanceScore, hesitanceScore) ||
                other.hesitanceScore == hesitanceScore) &&
            (identical(other.paceScore, paceScore) ||
                other.paceScore == paceScore) &&
            (identical(other.flowScore, flowScore) ||
                other.flowScore == flowScore) &&
            (identical(other.overallScore, overallScore) ||
                other.overallScore == overallScore) &&
            (identical(other.paceDeltaPct, paceDeltaPct) ||
                other.paceDeltaPct == paceDeltaPct) &&
            const DeepCollectionEquality()
                .equals(other._wordFeedback, _wordFeedback) &&
            const DeepCollectionEquality().equals(other._analysis, _analysis) &&
            (identical(other.durationSeconds, durationSeconds) ||
                other.durationSeconds == durationSeconds) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        userId,
        programId,
        stageId,
        lessonId,
        stepId,
        attemptType,
        passageText,
        guideWpm,
        recordingUploadStatus,
        attemptStatus,
        analysisStatus,
        analysisError,
        transcript,
        matchPct,
        hesitanceScore,
        paceScore,
        flowScore,
        overallScore,
        paceDeltaPct,
        const DeepCollectionEquality().hash(_wordFeedback),
        const DeepCollectionEquality().hash(_analysis),
        durationSeconds,
        createdAt
      ]);

  /// Create a copy of ReadingAttempt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReadingAttemptImplCopyWith<_$ReadingAttemptImpl> get copyWith =>
      __$$ReadingAttemptImplCopyWithImpl<_$ReadingAttemptImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReadingAttemptImplToJson(
      this,
    );
  }
}

abstract class _ReadingAttempt extends ReadingAttempt {
  const factory _ReadingAttempt(
          {required final String id,
          @JsonKey(name: 'user_id') final String? userId,
          @JsonKey(name: 'program_id') final String? programId,
          @JsonKey(name: 'stage_id') final String? stageId,
          @JsonKey(name: 'lesson_id') final String? lessonId,
          @JsonKey(name: 'step_id') final String? stepId,
          @JsonKey(name: 'attempt_type') final String attemptType,
          @JsonKey(name: 'passage_text') final String? passageText,
          @JsonKey(name: 'guide_wpm') final int? guideWpm,
          @JsonKey(name: 'recording_upload_status')
          final String? recordingUploadStatus,
          @JsonKey(name: 'attempt_status') final String? attemptStatus,
          @JsonKey(name: 'analysis_status') final String? analysisStatus,
          @JsonKey(name: 'analysis_error') final String? analysisError,
          final String? transcript,
          @JsonKey(name: 'match_pct') final int? matchPct,
          @JsonKey(name: 'hesitance_score') final int? hesitanceScore,
          @JsonKey(name: 'pace_score') final int? paceScore,
          @JsonKey(name: 'flow_score') final int? flowScore,
          @JsonKey(name: 'overall_score') final int? overallScore,
          @JsonKey(name: 'pace_delta_pct') final int? paceDeltaPct,
          @JsonKey(name: 'word_feedback')
          final List<ReadingWordFeedback> wordFeedback,
          final Map<String, dynamic>? analysis,
          @JsonKey(name: 'duration_seconds') final num? durationSeconds,
          @JsonKey(name: 'created_at') final DateTime? createdAt}) =
      _$ReadingAttemptImpl;
  const _ReadingAttempt._() : super._();

  factory _ReadingAttempt.fromJson(Map<String, dynamic> json) =
      _$ReadingAttemptImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  @JsonKey(name: 'program_id')
  String? get programId;
  @override
  @JsonKey(name: 'stage_id')
  String? get stageId;
  @override
  @JsonKey(name: 'lesson_id')
  String? get lessonId;
  @override
  @JsonKey(name: 'step_id')
  String? get stepId;
  @override
  @JsonKey(name: 'attempt_type')
  String get attemptType;
  @override
  @JsonKey(name: 'passage_text')
  String? get passageText;
  @override
  @JsonKey(name: 'guide_wpm')
  int? get guideWpm;
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
  String? get transcript;
  @override
  @JsonKey(name: 'match_pct')
  int? get matchPct;
  @override
  @JsonKey(name: 'hesitance_score')
  int? get hesitanceScore;
  @override
  @JsonKey(name: 'pace_score')
  int? get paceScore;
  @override
  @JsonKey(name: 'flow_score')
  int? get flowScore;
  @override
  @JsonKey(name: 'overall_score')
  int? get overallScore;
  @override
  @JsonKey(name: 'pace_delta_pct')
  int? get paceDeltaPct;
  @override
  @JsonKey(name: 'word_feedback')
  List<ReadingWordFeedback> get wordFeedback;
  @override
  Map<String, dynamic>? get analysis;
  @override
  @JsonKey(name: 'duration_seconds')
  num? get durationSeconds;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of ReadingAttempt
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReadingAttemptImplCopyWith<_$ReadingAttemptImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReadingUpload _$ReadingUploadFromJson(Map<String, dynamic> json) {
  return _ReadingUpload.fromJson(json);
}

/// @nodoc
mixin _$ReadingUpload {
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'object_key')
  String get objectKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'content_type')
  String get contentType => throw _privateConstructorUsedError;

  /// Serializes this ReadingUpload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReadingUpload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReadingUploadCopyWith<ReadingUpload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadingUploadCopyWith<$Res> {
  factory $ReadingUploadCopyWith(
          ReadingUpload value, $Res Function(ReadingUpload) then) =
      _$ReadingUploadCopyWithImpl<$Res, ReadingUpload>;
  @useResult
  $Res call(
      {String url,
      @JsonKey(name: 'object_key') String objectKey,
      @JsonKey(name: 'content_type') String contentType});
}

/// @nodoc
class _$ReadingUploadCopyWithImpl<$Res, $Val extends ReadingUpload>
    implements $ReadingUploadCopyWith<$Res> {
  _$ReadingUploadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReadingUpload
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
abstract class _$$ReadingUploadImplCopyWith<$Res>
    implements $ReadingUploadCopyWith<$Res> {
  factory _$$ReadingUploadImplCopyWith(
          _$ReadingUploadImpl value, $Res Function(_$ReadingUploadImpl) then) =
      __$$ReadingUploadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String url,
      @JsonKey(name: 'object_key') String objectKey,
      @JsonKey(name: 'content_type') String contentType});
}

/// @nodoc
class __$$ReadingUploadImplCopyWithImpl<$Res>
    extends _$ReadingUploadCopyWithImpl<$Res, _$ReadingUploadImpl>
    implements _$$ReadingUploadImplCopyWith<$Res> {
  __$$ReadingUploadImplCopyWithImpl(
      _$ReadingUploadImpl _value, $Res Function(_$ReadingUploadImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReadingUpload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? objectKey = null,
    Object? contentType = null,
  }) {
    return _then(_$ReadingUploadImpl(
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
class _$ReadingUploadImpl implements _ReadingUpload {
  const _$ReadingUploadImpl(
      {required this.url,
      @JsonKey(name: 'object_key') required this.objectKey,
      @JsonKey(name: 'content_type') required this.contentType});

  factory _$ReadingUploadImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReadingUploadImplFromJson(json);

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
    return 'ReadingUpload(url: $url, objectKey: $objectKey, contentType: $contentType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReadingUploadImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.objectKey, objectKey) ||
                other.objectKey == objectKey) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, objectKey, contentType);

  /// Create a copy of ReadingUpload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReadingUploadImplCopyWith<_$ReadingUploadImpl> get copyWith =>
      __$$ReadingUploadImplCopyWithImpl<_$ReadingUploadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReadingUploadImplToJson(
      this,
    );
  }
}

abstract class _ReadingUpload implements ReadingUpload {
  const factory _ReadingUpload(
          {required final String url,
          @JsonKey(name: 'object_key') required final String objectKey,
          @JsonKey(name: 'content_type') required final String contentType}) =
      _$ReadingUploadImpl;

  factory _ReadingUpload.fromJson(Map<String, dynamic> json) =
      _$ReadingUploadImpl.fromJson;

  @override
  String get url;
  @override
  @JsonKey(name: 'object_key')
  String get objectKey;
  @override
  @JsonKey(name: 'content_type')
  String get contentType;

  /// Create a copy of ReadingUpload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReadingUploadImplCopyWith<_$ReadingUploadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReadingStartResponse _$ReadingStartResponseFromJson(Map<String, dynamic> json) {
  return _ReadingStartResponse.fromJson(json);
}

/// @nodoc
mixin _$ReadingStartResponse {
  ReadingAttempt get attempt => throw _privateConstructorUsedError;
  ReadingUpload get upload => throw _privateConstructorUsedError;

  /// Serializes this ReadingStartResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReadingStartResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReadingStartResponseCopyWith<ReadingStartResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadingStartResponseCopyWith<$Res> {
  factory $ReadingStartResponseCopyWith(ReadingStartResponse value,
          $Res Function(ReadingStartResponse) then) =
      _$ReadingStartResponseCopyWithImpl<$Res, ReadingStartResponse>;
  @useResult
  $Res call({ReadingAttempt attempt, ReadingUpload upload});

  $ReadingAttemptCopyWith<$Res> get attempt;
  $ReadingUploadCopyWith<$Res> get upload;
}

/// @nodoc
class _$ReadingStartResponseCopyWithImpl<$Res,
        $Val extends ReadingStartResponse>
    implements $ReadingStartResponseCopyWith<$Res> {
  _$ReadingStartResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReadingStartResponse
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
              as ReadingAttempt,
      upload: null == upload
          ? _value.upload
          : upload // ignore: cast_nullable_to_non_nullable
              as ReadingUpload,
    ) as $Val);
  }

  /// Create a copy of ReadingStartResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReadingAttemptCopyWith<$Res> get attempt {
    return $ReadingAttemptCopyWith<$Res>(_value.attempt, (value) {
      return _then(_value.copyWith(attempt: value) as $Val);
    });
  }

  /// Create a copy of ReadingStartResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReadingUploadCopyWith<$Res> get upload {
    return $ReadingUploadCopyWith<$Res>(_value.upload, (value) {
      return _then(_value.copyWith(upload: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReadingStartResponseImplCopyWith<$Res>
    implements $ReadingStartResponseCopyWith<$Res> {
  factory _$$ReadingStartResponseImplCopyWith(_$ReadingStartResponseImpl value,
          $Res Function(_$ReadingStartResponseImpl) then) =
      __$$ReadingStartResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ReadingAttempt attempt, ReadingUpload upload});

  @override
  $ReadingAttemptCopyWith<$Res> get attempt;
  @override
  $ReadingUploadCopyWith<$Res> get upload;
}

/// @nodoc
class __$$ReadingStartResponseImplCopyWithImpl<$Res>
    extends _$ReadingStartResponseCopyWithImpl<$Res, _$ReadingStartResponseImpl>
    implements _$$ReadingStartResponseImplCopyWith<$Res> {
  __$$ReadingStartResponseImplCopyWithImpl(_$ReadingStartResponseImpl _value,
      $Res Function(_$ReadingStartResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReadingStartResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attempt = null,
    Object? upload = null,
  }) {
    return _then(_$ReadingStartResponseImpl(
      attempt: null == attempt
          ? _value.attempt
          : attempt // ignore: cast_nullable_to_non_nullable
              as ReadingAttempt,
      upload: null == upload
          ? _value.upload
          : upload // ignore: cast_nullable_to_non_nullable
              as ReadingUpload,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReadingStartResponseImpl implements _ReadingStartResponse {
  const _$ReadingStartResponseImpl(
      {required this.attempt, required this.upload});

  factory _$ReadingStartResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReadingStartResponseImplFromJson(json);

  @override
  final ReadingAttempt attempt;
  @override
  final ReadingUpload upload;

  @override
  String toString() {
    return 'ReadingStartResponse(attempt: $attempt, upload: $upload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReadingStartResponseImpl &&
            (identical(other.attempt, attempt) || other.attempt == attempt) &&
            (identical(other.upload, upload) || other.upload == upload));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, attempt, upload);

  /// Create a copy of ReadingStartResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReadingStartResponseImplCopyWith<_$ReadingStartResponseImpl>
      get copyWith =>
          __$$ReadingStartResponseImplCopyWithImpl<_$ReadingStartResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReadingStartResponseImplToJson(
      this,
    );
  }
}

abstract class _ReadingStartResponse implements ReadingStartResponse {
  const factory _ReadingStartResponse(
      {required final ReadingAttempt attempt,
      required final ReadingUpload upload}) = _$ReadingStartResponseImpl;

  factory _ReadingStartResponse.fromJson(Map<String, dynamic> json) =
      _$ReadingStartResponseImpl.fromJson;

  @override
  ReadingAttempt get attempt;
  @override
  ReadingUpload get upload;

  /// Create a copy of ReadingStartResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReadingStartResponseImplCopyWith<_$ReadingStartResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ReadingProgress _$ReadingProgressFromJson(Map<String, dynamic> json) {
  return _ReadingProgress.fromJson(json);
}

/// @nodoc
mixin _$ReadingProgress {
  @JsonKey(name: 'total_xp')
  int get totalXp => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_streak_days')
  int get currentStreakDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'longest_streak_days')
  int get longestStreakDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_practiced_at')
  DateTime? get lastPracticedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_attempts')
  int get totalAttempts => throw _privateConstructorUsedError;
  @JsonKey(name: 'lessons_completed')
  int get lessonsCompleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'stages_completed')
  int get stagesCompleted => throw _privateConstructorUsedError;

  /// Serializes this ReadingProgress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReadingProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReadingProgressCopyWith<ReadingProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadingProgressCopyWith<$Res> {
  factory $ReadingProgressCopyWith(
          ReadingProgress value, $Res Function(ReadingProgress) then) =
      _$ReadingProgressCopyWithImpl<$Res, ReadingProgress>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_xp') int totalXp,
      @JsonKey(name: 'current_streak_days') int currentStreakDays,
      @JsonKey(name: 'longest_streak_days') int longestStreakDays,
      @JsonKey(name: 'last_practiced_at') DateTime? lastPracticedAt,
      @JsonKey(name: 'total_attempts') int totalAttempts,
      @JsonKey(name: 'lessons_completed') int lessonsCompleted,
      @JsonKey(name: 'stages_completed') int stagesCompleted});
}

/// @nodoc
class _$ReadingProgressCopyWithImpl<$Res, $Val extends ReadingProgress>
    implements $ReadingProgressCopyWith<$Res> {
  _$ReadingProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReadingProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalXp = null,
    Object? currentStreakDays = null,
    Object? longestStreakDays = null,
    Object? lastPracticedAt = freezed,
    Object? totalAttempts = null,
    Object? lessonsCompleted = null,
    Object? stagesCompleted = null,
  }) {
    return _then(_value.copyWith(
      totalXp: null == totalXp
          ? _value.totalXp
          : totalXp // ignore: cast_nullable_to_non_nullable
              as int,
      currentStreakDays: null == currentStreakDays
          ? _value.currentStreakDays
          : currentStreakDays // ignore: cast_nullable_to_non_nullable
              as int,
      longestStreakDays: null == longestStreakDays
          ? _value.longestStreakDays
          : longestStreakDays // ignore: cast_nullable_to_non_nullable
              as int,
      lastPracticedAt: freezed == lastPracticedAt
          ? _value.lastPracticedAt
          : lastPracticedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalAttempts: null == totalAttempts
          ? _value.totalAttempts
          : totalAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      lessonsCompleted: null == lessonsCompleted
          ? _value.lessonsCompleted
          : lessonsCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      stagesCompleted: null == stagesCompleted
          ? _value.stagesCompleted
          : stagesCompleted // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReadingProgressImplCopyWith<$Res>
    implements $ReadingProgressCopyWith<$Res> {
  factory _$$ReadingProgressImplCopyWith(_$ReadingProgressImpl value,
          $Res Function(_$ReadingProgressImpl) then) =
      __$$ReadingProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_xp') int totalXp,
      @JsonKey(name: 'current_streak_days') int currentStreakDays,
      @JsonKey(name: 'longest_streak_days') int longestStreakDays,
      @JsonKey(name: 'last_practiced_at') DateTime? lastPracticedAt,
      @JsonKey(name: 'total_attempts') int totalAttempts,
      @JsonKey(name: 'lessons_completed') int lessonsCompleted,
      @JsonKey(name: 'stages_completed') int stagesCompleted});
}

/// @nodoc
class __$$ReadingProgressImplCopyWithImpl<$Res>
    extends _$ReadingProgressCopyWithImpl<$Res, _$ReadingProgressImpl>
    implements _$$ReadingProgressImplCopyWith<$Res> {
  __$$ReadingProgressImplCopyWithImpl(
      _$ReadingProgressImpl _value, $Res Function(_$ReadingProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReadingProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalXp = null,
    Object? currentStreakDays = null,
    Object? longestStreakDays = null,
    Object? lastPracticedAt = freezed,
    Object? totalAttempts = null,
    Object? lessonsCompleted = null,
    Object? stagesCompleted = null,
  }) {
    return _then(_$ReadingProgressImpl(
      totalXp: null == totalXp
          ? _value.totalXp
          : totalXp // ignore: cast_nullable_to_non_nullable
              as int,
      currentStreakDays: null == currentStreakDays
          ? _value.currentStreakDays
          : currentStreakDays // ignore: cast_nullable_to_non_nullable
              as int,
      longestStreakDays: null == longestStreakDays
          ? _value.longestStreakDays
          : longestStreakDays // ignore: cast_nullable_to_non_nullable
              as int,
      lastPracticedAt: freezed == lastPracticedAt
          ? _value.lastPracticedAt
          : lastPracticedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalAttempts: null == totalAttempts
          ? _value.totalAttempts
          : totalAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      lessonsCompleted: null == lessonsCompleted
          ? _value.lessonsCompleted
          : lessonsCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      stagesCompleted: null == stagesCompleted
          ? _value.stagesCompleted
          : stagesCompleted // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReadingProgressImpl implements _ReadingProgress {
  const _$ReadingProgressImpl(
      {@JsonKey(name: 'total_xp') this.totalXp = 0,
      @JsonKey(name: 'current_streak_days') this.currentStreakDays = 0,
      @JsonKey(name: 'longest_streak_days') this.longestStreakDays = 0,
      @JsonKey(name: 'last_practiced_at') this.lastPracticedAt,
      @JsonKey(name: 'total_attempts') this.totalAttempts = 0,
      @JsonKey(name: 'lessons_completed') this.lessonsCompleted = 0,
      @JsonKey(name: 'stages_completed') this.stagesCompleted = 0});

  factory _$ReadingProgressImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReadingProgressImplFromJson(json);

  @override
  @JsonKey(name: 'total_xp')
  final int totalXp;
  @override
  @JsonKey(name: 'current_streak_days')
  final int currentStreakDays;
  @override
  @JsonKey(name: 'longest_streak_days')
  final int longestStreakDays;
  @override
  @JsonKey(name: 'last_practiced_at')
  final DateTime? lastPracticedAt;
  @override
  @JsonKey(name: 'total_attempts')
  final int totalAttempts;
  @override
  @JsonKey(name: 'lessons_completed')
  final int lessonsCompleted;
  @override
  @JsonKey(name: 'stages_completed')
  final int stagesCompleted;

  @override
  String toString() {
    return 'ReadingProgress(totalXp: $totalXp, currentStreakDays: $currentStreakDays, longestStreakDays: $longestStreakDays, lastPracticedAt: $lastPracticedAt, totalAttempts: $totalAttempts, lessonsCompleted: $lessonsCompleted, stagesCompleted: $stagesCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReadingProgressImpl &&
            (identical(other.totalXp, totalXp) || other.totalXp == totalXp) &&
            (identical(other.currentStreakDays, currentStreakDays) ||
                other.currentStreakDays == currentStreakDays) &&
            (identical(other.longestStreakDays, longestStreakDays) ||
                other.longestStreakDays == longestStreakDays) &&
            (identical(other.lastPracticedAt, lastPracticedAt) ||
                other.lastPracticedAt == lastPracticedAt) &&
            (identical(other.totalAttempts, totalAttempts) ||
                other.totalAttempts == totalAttempts) &&
            (identical(other.lessonsCompleted, lessonsCompleted) ||
                other.lessonsCompleted == lessonsCompleted) &&
            (identical(other.stagesCompleted, stagesCompleted) ||
                other.stagesCompleted == stagesCompleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalXp,
      currentStreakDays,
      longestStreakDays,
      lastPracticedAt,
      totalAttempts,
      lessonsCompleted,
      stagesCompleted);

  /// Create a copy of ReadingProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReadingProgressImplCopyWith<_$ReadingProgressImpl> get copyWith =>
      __$$ReadingProgressImplCopyWithImpl<_$ReadingProgressImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReadingProgressImplToJson(
      this,
    );
  }
}

abstract class _ReadingProgress implements ReadingProgress {
  const factory _ReadingProgress(
          {@JsonKey(name: 'total_xp') final int totalXp,
          @JsonKey(name: 'current_streak_days') final int currentStreakDays,
          @JsonKey(name: 'longest_streak_days') final int longestStreakDays,
          @JsonKey(name: 'last_practiced_at') final DateTime? lastPracticedAt,
          @JsonKey(name: 'total_attempts') final int totalAttempts,
          @JsonKey(name: 'lessons_completed') final int lessonsCompleted,
          @JsonKey(name: 'stages_completed') final int stagesCompleted}) =
      _$ReadingProgressImpl;

  factory _ReadingProgress.fromJson(Map<String, dynamic> json) =
      _$ReadingProgressImpl.fromJson;

  @override
  @JsonKey(name: 'total_xp')
  int get totalXp;
  @override
  @JsonKey(name: 'current_streak_days')
  int get currentStreakDays;
  @override
  @JsonKey(name: 'longest_streak_days')
  int get longestStreakDays;
  @override
  @JsonKey(name: 'last_practiced_at')
  DateTime? get lastPracticedAt;
  @override
  @JsonKey(name: 'total_attempts')
  int get totalAttempts;
  @override
  @JsonKey(name: 'lessons_completed')
  int get lessonsCompleted;
  @override
  @JsonKey(name: 'stages_completed')
  int get stagesCompleted;

  /// Create a copy of ReadingProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReadingProgressImplCopyWith<_$ReadingProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
