// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'interview_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InterviewScenario _$InterviewScenarioFromJson(Map<String, dynamic> json) {
  return _InterviewScenario.fromJson(json);
}

/// @nodoc
mixin _$InterviewScenario {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_role')
  String? get jobRole => throw _privateConstructorUsedError;
  String? get company => throw _privateConstructorUsedError;
  @JsonKey(name: 'interview_type')
  InterviewType? get interviewType => throw _privateConstructorUsedError;
  @JsonKey(name: 'experience_level')
  InterviewExperienceLevel? get experienceLevel =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'job_description')
  String? get jobDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_default')
  bool get isDefault => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this InterviewScenario to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InterviewScenario
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InterviewScenarioCopyWith<InterviewScenario> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InterviewScenarioCopyWith<$Res> {
  factory $InterviewScenarioCopyWith(
          InterviewScenario value, $Res Function(InterviewScenario) then) =
      _$InterviewScenarioCopyWithImpl<$Res, InterviewScenario>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String? userId,
      String title,
      @JsonKey(name: 'job_role') String? jobRole,
      String? company,
      @JsonKey(name: 'interview_type') InterviewType? interviewType,
      @JsonKey(name: 'experience_level')
      InterviewExperienceLevel? experienceLevel,
      @JsonKey(name: 'job_description') String? jobDescription,
      @JsonKey(name: 'is_default') bool isDefault,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class _$InterviewScenarioCopyWithImpl<$Res, $Val extends InterviewScenario>
    implements $InterviewScenarioCopyWith<$Res> {
  _$InterviewScenarioCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InterviewScenario
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? title = null,
    Object? jobRole = freezed,
    Object? company = freezed,
    Object? interviewType = freezed,
    Object? experienceLevel = freezed,
    Object? jobDescription = freezed,
    Object? isDefault = null,
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
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      jobRole: freezed == jobRole
          ? _value.jobRole
          : jobRole // ignore: cast_nullable_to_non_nullable
              as String?,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      interviewType: freezed == interviewType
          ? _value.interviewType
          : interviewType // ignore: cast_nullable_to_non_nullable
              as InterviewType?,
      experienceLevel: freezed == experienceLevel
          ? _value.experienceLevel
          : experienceLevel // ignore: cast_nullable_to_non_nullable
              as InterviewExperienceLevel?,
      jobDescription: freezed == jobDescription
          ? _value.jobDescription
          : jobDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InterviewScenarioImplCopyWith<$Res>
    implements $InterviewScenarioCopyWith<$Res> {
  factory _$$InterviewScenarioImplCopyWith(_$InterviewScenarioImpl value,
          $Res Function(_$InterviewScenarioImpl) then) =
      __$$InterviewScenarioImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String? userId,
      String title,
      @JsonKey(name: 'job_role') String? jobRole,
      String? company,
      @JsonKey(name: 'interview_type') InterviewType? interviewType,
      @JsonKey(name: 'experience_level')
      InterviewExperienceLevel? experienceLevel,
      @JsonKey(name: 'job_description') String? jobDescription,
      @JsonKey(name: 'is_default') bool isDefault,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class __$$InterviewScenarioImplCopyWithImpl<$Res>
    extends _$InterviewScenarioCopyWithImpl<$Res, _$InterviewScenarioImpl>
    implements _$$InterviewScenarioImplCopyWith<$Res> {
  __$$InterviewScenarioImplCopyWithImpl(_$InterviewScenarioImpl _value,
      $Res Function(_$InterviewScenarioImpl) _then)
      : super(_value, _then);

  /// Create a copy of InterviewScenario
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? title = null,
    Object? jobRole = freezed,
    Object? company = freezed,
    Object? interviewType = freezed,
    Object? experienceLevel = freezed,
    Object? jobDescription = freezed,
    Object? isDefault = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$InterviewScenarioImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      jobRole: freezed == jobRole
          ? _value.jobRole
          : jobRole // ignore: cast_nullable_to_non_nullable
              as String?,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      interviewType: freezed == interviewType
          ? _value.interviewType
          : interviewType // ignore: cast_nullable_to_non_nullable
              as InterviewType?,
      experienceLevel: freezed == experienceLevel
          ? _value.experienceLevel
          : experienceLevel // ignore: cast_nullable_to_non_nullable
              as InterviewExperienceLevel?,
      jobDescription: freezed == jobDescription
          ? _value.jobDescription
          : jobDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InterviewScenarioImpl implements _InterviewScenario {
  const _$InterviewScenarioImpl(
      {required this.id,
      @JsonKey(name: 'user_id') this.userId,
      required this.title,
      @JsonKey(name: 'job_role') this.jobRole,
      this.company,
      @JsonKey(name: 'interview_type') this.interviewType,
      @JsonKey(name: 'experience_level') this.experienceLevel,
      @JsonKey(name: 'job_description') this.jobDescription,
      @JsonKey(name: 'is_default') this.isDefault = false,
      @JsonKey(name: 'created_at') this.createdAt});

  factory _$InterviewScenarioImpl.fromJson(Map<String, dynamic> json) =>
      _$$InterviewScenarioImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  final String title;
  @override
  @JsonKey(name: 'job_role')
  final String? jobRole;
  @override
  final String? company;
  @override
  @JsonKey(name: 'interview_type')
  final InterviewType? interviewType;
  @override
  @JsonKey(name: 'experience_level')
  final InterviewExperienceLevel? experienceLevel;
  @override
  @JsonKey(name: 'job_description')
  final String? jobDescription;
  @override
  @JsonKey(name: 'is_default')
  final bool isDefault;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'InterviewScenario(id: $id, userId: $userId, title: $title, jobRole: $jobRole, company: $company, interviewType: $interviewType, experienceLevel: $experienceLevel, jobDescription: $jobDescription, isDefault: $isDefault, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InterviewScenarioImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.jobRole, jobRole) || other.jobRole == jobRole) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.interviewType, interviewType) ||
                other.interviewType == interviewType) &&
            (identical(other.experienceLevel, experienceLevel) ||
                other.experienceLevel == experienceLevel) &&
            (identical(other.jobDescription, jobDescription) ||
                other.jobDescription == jobDescription) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      title,
      jobRole,
      company,
      interviewType,
      experienceLevel,
      jobDescription,
      isDefault,
      createdAt);

  /// Create a copy of InterviewScenario
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InterviewScenarioImplCopyWith<_$InterviewScenarioImpl> get copyWith =>
      __$$InterviewScenarioImplCopyWithImpl<_$InterviewScenarioImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InterviewScenarioImplToJson(
      this,
    );
  }
}

abstract class _InterviewScenario implements InterviewScenario {
  const factory _InterviewScenario(
          {required final String id,
          @JsonKey(name: 'user_id') final String? userId,
          required final String title,
          @JsonKey(name: 'job_role') final String? jobRole,
          final String? company,
          @JsonKey(name: 'interview_type') final InterviewType? interviewType,
          @JsonKey(name: 'experience_level')
          final InterviewExperienceLevel? experienceLevel,
          @JsonKey(name: 'job_description') final String? jobDescription,
          @JsonKey(name: 'is_default') final bool isDefault,
          @JsonKey(name: 'created_at') final DateTime? createdAt}) =
      _$InterviewScenarioImpl;

  factory _InterviewScenario.fromJson(Map<String, dynamic> json) =
      _$InterviewScenarioImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  String get title;
  @override
  @JsonKey(name: 'job_role')
  String? get jobRole;
  @override
  String? get company;
  @override
  @JsonKey(name: 'interview_type')
  InterviewType? get interviewType;
  @override
  @JsonKey(name: 'experience_level')
  InterviewExperienceLevel? get experienceLevel;
  @override
  @JsonKey(name: 'job_description')
  String? get jobDescription;
  @override
  @JsonKey(name: 'is_default')
  bool get isDefault;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of InterviewScenario
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InterviewScenarioImplCopyWith<_$InterviewScenarioImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InterviewQuestion _$InterviewQuestionFromJson(Map<String, dynamic> json) {
  return _InterviewQuestion.fromJson(json);
}

/// @nodoc
mixin _$InterviewQuestion {
  String get id => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_type')
  InterviewQuestionType? get questionType => throw _privateConstructorUsedError;
  InterviewFramework? get framework => throw _privateConstructorUsedError;
  String? get hint => throw _privateConstructorUsedError;

  /// Serializes this InterviewQuestion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InterviewQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InterviewQuestionCopyWith<InterviewQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InterviewQuestionCopyWith<$Res> {
  factory $InterviewQuestionCopyWith(
          InterviewQuestion value, $Res Function(InterviewQuestion) then) =
      _$InterviewQuestionCopyWithImpl<$Res, InterviewQuestion>;
  @useResult
  $Res call(
      {String id,
      String question,
      @JsonKey(name: 'question_type') InterviewQuestionType? questionType,
      InterviewFramework? framework,
      String? hint});
}

/// @nodoc
class _$InterviewQuestionCopyWithImpl<$Res, $Val extends InterviewQuestion>
    implements $InterviewQuestionCopyWith<$Res> {
  _$InterviewQuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InterviewQuestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? questionType = freezed,
    Object? framework = freezed,
    Object? hint = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      questionType: freezed == questionType
          ? _value.questionType
          : questionType // ignore: cast_nullable_to_non_nullable
              as InterviewQuestionType?,
      framework: freezed == framework
          ? _value.framework
          : framework // ignore: cast_nullable_to_non_nullable
              as InterviewFramework?,
      hint: freezed == hint
          ? _value.hint
          : hint // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InterviewQuestionImplCopyWith<$Res>
    implements $InterviewQuestionCopyWith<$Res> {
  factory _$$InterviewQuestionImplCopyWith(_$InterviewQuestionImpl value,
          $Res Function(_$InterviewQuestionImpl) then) =
      __$$InterviewQuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String question,
      @JsonKey(name: 'question_type') InterviewQuestionType? questionType,
      InterviewFramework? framework,
      String? hint});
}

/// @nodoc
class __$$InterviewQuestionImplCopyWithImpl<$Res>
    extends _$InterviewQuestionCopyWithImpl<$Res, _$InterviewQuestionImpl>
    implements _$$InterviewQuestionImplCopyWith<$Res> {
  __$$InterviewQuestionImplCopyWithImpl(_$InterviewQuestionImpl _value,
      $Res Function(_$InterviewQuestionImpl) _then)
      : super(_value, _then);

  /// Create a copy of InterviewQuestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? questionType = freezed,
    Object? framework = freezed,
    Object? hint = freezed,
  }) {
    return _then(_$InterviewQuestionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      questionType: freezed == questionType
          ? _value.questionType
          : questionType // ignore: cast_nullable_to_non_nullable
              as InterviewQuestionType?,
      framework: freezed == framework
          ? _value.framework
          : framework // ignore: cast_nullable_to_non_nullable
              as InterviewFramework?,
      hint: freezed == hint
          ? _value.hint
          : hint // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InterviewQuestionImpl implements _InterviewQuestion {
  const _$InterviewQuestionImpl(
      {required this.id,
      required this.question,
      @JsonKey(name: 'question_type') this.questionType,
      this.framework,
      this.hint});

  factory _$InterviewQuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$InterviewQuestionImplFromJson(json);

  @override
  final String id;
  @override
  final String question;
  @override
  @JsonKey(name: 'question_type')
  final InterviewQuestionType? questionType;
  @override
  final InterviewFramework? framework;
  @override
  final String? hint;

  @override
  String toString() {
    return 'InterviewQuestion(id: $id, question: $question, questionType: $questionType, framework: $framework, hint: $hint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InterviewQuestionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.questionType, questionType) ||
                other.questionType == questionType) &&
            (identical(other.framework, framework) ||
                other.framework == framework) &&
            (identical(other.hint, hint) || other.hint == hint));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, question, questionType, framework, hint);

  /// Create a copy of InterviewQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InterviewQuestionImplCopyWith<_$InterviewQuestionImpl> get copyWith =>
      __$$InterviewQuestionImplCopyWithImpl<_$InterviewQuestionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InterviewQuestionImplToJson(
      this,
    );
  }
}

abstract class _InterviewQuestion implements InterviewQuestion {
  const factory _InterviewQuestion(
      {required final String id,
      required final String question,
      @JsonKey(name: 'question_type') final InterviewQuestionType? questionType,
      final InterviewFramework? framework,
      final String? hint}) = _$InterviewQuestionImpl;

  factory _InterviewQuestion.fromJson(Map<String, dynamic> json) =
      _$InterviewQuestionImpl.fromJson;

  @override
  String get id;
  @override
  String get question;
  @override
  @JsonKey(name: 'question_type')
  InterviewQuestionType? get questionType;
  @override
  InterviewFramework? get framework;
  @override
  String? get hint;

  /// Create a copy of InterviewQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InterviewQuestionImplCopyWith<_$InterviewQuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InterviewScores _$InterviewScoresFromJson(Map<String, dynamic> json) {
  return _InterviewScores.fromJson(json);
}

/// @nodoc
mixin _$InterviewScores {
  int get overall => throw _privateConstructorUsedError;
  int get delivery => throw _privateConstructorUsedError;
  int get relevance => throw _privateConstructorUsedError;
  int get structure => throw _privateConstructorUsedError;
  int get specificity => throw _privateConstructorUsedError;
  int get confidence => throw _privateConstructorUsedError;
  int get fluency => throw _privateConstructorUsedError;
  int get grammar => throw _privateConstructorUsedError;
  int get conciseness => throw _privateConstructorUsedError;
  int get professionalism => throw _privateConstructorUsedError;
  int? get star => throw _privateConstructorUsedError;

  /// Serializes this InterviewScores to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InterviewScores
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InterviewScoresCopyWith<InterviewScores> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InterviewScoresCopyWith<$Res> {
  factory $InterviewScoresCopyWith(
          InterviewScores value, $Res Function(InterviewScores) then) =
      _$InterviewScoresCopyWithImpl<$Res, InterviewScores>;
  @useResult
  $Res call(
      {int overall,
      int delivery,
      int relevance,
      int structure,
      int specificity,
      int confidence,
      int fluency,
      int grammar,
      int conciseness,
      int professionalism,
      int? star});
}

/// @nodoc
class _$InterviewScoresCopyWithImpl<$Res, $Val extends InterviewScores>
    implements $InterviewScoresCopyWith<$Res> {
  _$InterviewScoresCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InterviewScores
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overall = null,
    Object? delivery = null,
    Object? relevance = null,
    Object? structure = null,
    Object? specificity = null,
    Object? confidence = null,
    Object? fluency = null,
    Object? grammar = null,
    Object? conciseness = null,
    Object? professionalism = null,
    Object? star = freezed,
  }) {
    return _then(_value.copyWith(
      overall: null == overall
          ? _value.overall
          : overall // ignore: cast_nullable_to_non_nullable
              as int,
      delivery: null == delivery
          ? _value.delivery
          : delivery // ignore: cast_nullable_to_non_nullable
              as int,
      relevance: null == relevance
          ? _value.relevance
          : relevance // ignore: cast_nullable_to_non_nullable
              as int,
      structure: null == structure
          ? _value.structure
          : structure // ignore: cast_nullable_to_non_nullable
              as int,
      specificity: null == specificity
          ? _value.specificity
          : specificity // ignore: cast_nullable_to_non_nullable
              as int,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as int,
      fluency: null == fluency
          ? _value.fluency
          : fluency // ignore: cast_nullable_to_non_nullable
              as int,
      grammar: null == grammar
          ? _value.grammar
          : grammar // ignore: cast_nullable_to_non_nullable
              as int,
      conciseness: null == conciseness
          ? _value.conciseness
          : conciseness // ignore: cast_nullable_to_non_nullable
              as int,
      professionalism: null == professionalism
          ? _value.professionalism
          : professionalism // ignore: cast_nullable_to_non_nullable
              as int,
      star: freezed == star
          ? _value.star
          : star // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InterviewScoresImplCopyWith<$Res>
    implements $InterviewScoresCopyWith<$Res> {
  factory _$$InterviewScoresImplCopyWith(_$InterviewScoresImpl value,
          $Res Function(_$InterviewScoresImpl) then) =
      __$$InterviewScoresImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int overall,
      int delivery,
      int relevance,
      int structure,
      int specificity,
      int confidence,
      int fluency,
      int grammar,
      int conciseness,
      int professionalism,
      int? star});
}

/// @nodoc
class __$$InterviewScoresImplCopyWithImpl<$Res>
    extends _$InterviewScoresCopyWithImpl<$Res, _$InterviewScoresImpl>
    implements _$$InterviewScoresImplCopyWith<$Res> {
  __$$InterviewScoresImplCopyWithImpl(
      _$InterviewScoresImpl _value, $Res Function(_$InterviewScoresImpl) _then)
      : super(_value, _then);

  /// Create a copy of InterviewScores
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overall = null,
    Object? delivery = null,
    Object? relevance = null,
    Object? structure = null,
    Object? specificity = null,
    Object? confidence = null,
    Object? fluency = null,
    Object? grammar = null,
    Object? conciseness = null,
    Object? professionalism = null,
    Object? star = freezed,
  }) {
    return _then(_$InterviewScoresImpl(
      overall: null == overall
          ? _value.overall
          : overall // ignore: cast_nullable_to_non_nullable
              as int,
      delivery: null == delivery
          ? _value.delivery
          : delivery // ignore: cast_nullable_to_non_nullable
              as int,
      relevance: null == relevance
          ? _value.relevance
          : relevance // ignore: cast_nullable_to_non_nullable
              as int,
      structure: null == structure
          ? _value.structure
          : structure // ignore: cast_nullable_to_non_nullable
              as int,
      specificity: null == specificity
          ? _value.specificity
          : specificity // ignore: cast_nullable_to_non_nullable
              as int,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as int,
      fluency: null == fluency
          ? _value.fluency
          : fluency // ignore: cast_nullable_to_non_nullable
              as int,
      grammar: null == grammar
          ? _value.grammar
          : grammar // ignore: cast_nullable_to_non_nullable
              as int,
      conciseness: null == conciseness
          ? _value.conciseness
          : conciseness // ignore: cast_nullable_to_non_nullable
              as int,
      professionalism: null == professionalism
          ? _value.professionalism
          : professionalism // ignore: cast_nullable_to_non_nullable
              as int,
      star: freezed == star
          ? _value.star
          : star // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InterviewScoresImpl implements _InterviewScores {
  const _$InterviewScoresImpl(
      {this.overall = 0,
      this.delivery = 0,
      this.relevance = 0,
      this.structure = 0,
      this.specificity = 0,
      this.confidence = 0,
      this.fluency = 0,
      this.grammar = 0,
      this.conciseness = 0,
      this.professionalism = 0,
      this.star});

  factory _$InterviewScoresImpl.fromJson(Map<String, dynamic> json) =>
      _$$InterviewScoresImplFromJson(json);

  @override
  @JsonKey()
  final int overall;
  @override
  @JsonKey()
  final int delivery;
  @override
  @JsonKey()
  final int relevance;
  @override
  @JsonKey()
  final int structure;
  @override
  @JsonKey()
  final int specificity;
  @override
  @JsonKey()
  final int confidence;
  @override
  @JsonKey()
  final int fluency;
  @override
  @JsonKey()
  final int grammar;
  @override
  @JsonKey()
  final int conciseness;
  @override
  @JsonKey()
  final int professionalism;
  @override
  final int? star;

  @override
  String toString() {
    return 'InterviewScores(overall: $overall, delivery: $delivery, relevance: $relevance, structure: $structure, specificity: $specificity, confidence: $confidence, fluency: $fluency, grammar: $grammar, conciseness: $conciseness, professionalism: $professionalism, star: $star)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InterviewScoresImpl &&
            (identical(other.overall, overall) || other.overall == overall) &&
            (identical(other.delivery, delivery) ||
                other.delivery == delivery) &&
            (identical(other.relevance, relevance) ||
                other.relevance == relevance) &&
            (identical(other.structure, structure) ||
                other.structure == structure) &&
            (identical(other.specificity, specificity) ||
                other.specificity == specificity) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.fluency, fluency) || other.fluency == fluency) &&
            (identical(other.grammar, grammar) || other.grammar == grammar) &&
            (identical(other.conciseness, conciseness) ||
                other.conciseness == conciseness) &&
            (identical(other.professionalism, professionalism) ||
                other.professionalism == professionalism) &&
            (identical(other.star, star) || other.star == star));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      overall,
      delivery,
      relevance,
      structure,
      specificity,
      confidence,
      fluency,
      grammar,
      conciseness,
      professionalism,
      star);

  /// Create a copy of InterviewScores
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InterviewScoresImplCopyWith<_$InterviewScoresImpl> get copyWith =>
      __$$InterviewScoresImplCopyWithImpl<_$InterviewScoresImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InterviewScoresImplToJson(
      this,
    );
  }
}

abstract class _InterviewScores implements InterviewScores {
  const factory _InterviewScores(
      {final int overall,
      final int delivery,
      final int relevance,
      final int structure,
      final int specificity,
      final int confidence,
      final int fluency,
      final int grammar,
      final int conciseness,
      final int professionalism,
      final int? star}) = _$InterviewScoresImpl;

  factory _InterviewScores.fromJson(Map<String, dynamic> json) =
      _$InterviewScoresImpl.fromJson;

  @override
  int get overall;
  @override
  int get delivery;
  @override
  int get relevance;
  @override
  int get structure;
  @override
  int get specificity;
  @override
  int get confidence;
  @override
  int get fluency;
  @override
  int get grammar;
  @override
  int get conciseness;
  @override
  int get professionalism;
  @override
  int? get star;

  /// Create a copy of InterviewScores
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InterviewScoresImplCopyWith<_$InterviewScoresImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InterviewAttempt _$InterviewAttemptFromJson(Map<String, dynamic> json) {
  return _InterviewAttempt.fromJson(json);
}

/// @nodoc
mixin _$InterviewAttempt {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_id')
  String? get questionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'recording_upload_status')
  InterviewRecordingUploadStatus get recordingUploadStatus =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'analysis_status')
  InterviewAnalysisStatus get analysisStatus =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'attempt_status')
  InterviewAttemptStatus get attemptStatus =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'overall_score')
  int? get overallScore => throw _privateConstructorUsedError;
  String? get transcript => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this InterviewAttempt to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InterviewAttempt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InterviewAttemptCopyWith<InterviewAttempt> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InterviewAttemptCopyWith<$Res> {
  factory $InterviewAttemptCopyWith(
          InterviewAttempt value, $Res Function(InterviewAttempt) then) =
      _$InterviewAttemptCopyWithImpl<$Res, InterviewAttempt>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'question_id') String? questionId,
      @JsonKey(name: 'recording_upload_status')
      InterviewRecordingUploadStatus recordingUploadStatus,
      @JsonKey(name: 'analysis_status') InterviewAnalysisStatus analysisStatus,
      @JsonKey(name: 'attempt_status') InterviewAttemptStatus attemptStatus,
      @JsonKey(name: 'overall_score') int? overallScore,
      String? transcript,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class _$InterviewAttemptCopyWithImpl<$Res, $Val extends InterviewAttempt>
    implements $InterviewAttemptCopyWith<$Res> {
  _$InterviewAttemptCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InterviewAttempt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? questionId = freezed,
    Object? recordingUploadStatus = null,
    Object? analysisStatus = null,
    Object? attemptStatus = null,
    Object? overallScore = freezed,
    Object? transcript = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String?,
      recordingUploadStatus: null == recordingUploadStatus
          ? _value.recordingUploadStatus
          : recordingUploadStatus // ignore: cast_nullable_to_non_nullable
              as InterviewRecordingUploadStatus,
      analysisStatus: null == analysisStatus
          ? _value.analysisStatus
          : analysisStatus // ignore: cast_nullable_to_non_nullable
              as InterviewAnalysisStatus,
      attemptStatus: null == attemptStatus
          ? _value.attemptStatus
          : attemptStatus // ignore: cast_nullable_to_non_nullable
              as InterviewAttemptStatus,
      overallScore: freezed == overallScore
          ? _value.overallScore
          : overallScore // ignore: cast_nullable_to_non_nullable
              as int?,
      transcript: freezed == transcript
          ? _value.transcript
          : transcript // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InterviewAttemptImplCopyWith<$Res>
    implements $InterviewAttemptCopyWith<$Res> {
  factory _$$InterviewAttemptImplCopyWith(_$InterviewAttemptImpl value,
          $Res Function(_$InterviewAttemptImpl) then) =
      __$$InterviewAttemptImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'question_id') String? questionId,
      @JsonKey(name: 'recording_upload_status')
      InterviewRecordingUploadStatus recordingUploadStatus,
      @JsonKey(name: 'analysis_status') InterviewAnalysisStatus analysisStatus,
      @JsonKey(name: 'attempt_status') InterviewAttemptStatus attemptStatus,
      @JsonKey(name: 'overall_score') int? overallScore,
      String? transcript,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class __$$InterviewAttemptImplCopyWithImpl<$Res>
    extends _$InterviewAttemptCopyWithImpl<$Res, _$InterviewAttemptImpl>
    implements _$$InterviewAttemptImplCopyWith<$Res> {
  __$$InterviewAttemptImplCopyWithImpl(_$InterviewAttemptImpl _value,
      $Res Function(_$InterviewAttemptImpl) _then)
      : super(_value, _then);

  /// Create a copy of InterviewAttempt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? questionId = freezed,
    Object? recordingUploadStatus = null,
    Object? analysisStatus = null,
    Object? attemptStatus = null,
    Object? overallScore = freezed,
    Object? transcript = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$InterviewAttemptImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String?,
      recordingUploadStatus: null == recordingUploadStatus
          ? _value.recordingUploadStatus
          : recordingUploadStatus // ignore: cast_nullable_to_non_nullable
              as InterviewRecordingUploadStatus,
      analysisStatus: null == analysisStatus
          ? _value.analysisStatus
          : analysisStatus // ignore: cast_nullable_to_non_nullable
              as InterviewAnalysisStatus,
      attemptStatus: null == attemptStatus
          ? _value.attemptStatus
          : attemptStatus // ignore: cast_nullable_to_non_nullable
              as InterviewAttemptStatus,
      overallScore: freezed == overallScore
          ? _value.overallScore
          : overallScore // ignore: cast_nullable_to_non_nullable
              as int?,
      transcript: freezed == transcript
          ? _value.transcript
          : transcript // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InterviewAttemptImpl extends _InterviewAttempt {
  const _$InterviewAttemptImpl(
      {required this.id,
      @JsonKey(name: 'question_id') this.questionId,
      @JsonKey(name: 'recording_upload_status')
      this.recordingUploadStatus = InterviewRecordingUploadStatus.none,
      @JsonKey(name: 'analysis_status')
      this.analysisStatus = InterviewAnalysisStatus.created,
      @JsonKey(name: 'attempt_status')
      this.attemptStatus = InterviewAttemptStatus.started,
      @JsonKey(name: 'overall_score') this.overallScore,
      this.transcript,
      @JsonKey(name: 'created_at') this.createdAt})
      : super._();

  factory _$InterviewAttemptImpl.fromJson(Map<String, dynamic> json) =>
      _$$InterviewAttemptImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'question_id')
  final String? questionId;
  @override
  @JsonKey(name: 'recording_upload_status')
  final InterviewRecordingUploadStatus recordingUploadStatus;
  @override
  @JsonKey(name: 'analysis_status')
  final InterviewAnalysisStatus analysisStatus;
  @override
  @JsonKey(name: 'attempt_status')
  final InterviewAttemptStatus attemptStatus;
  @override
  @JsonKey(name: 'overall_score')
  final int? overallScore;
  @override
  final String? transcript;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'InterviewAttempt(id: $id, questionId: $questionId, recordingUploadStatus: $recordingUploadStatus, analysisStatus: $analysisStatus, attemptStatus: $attemptStatus, overallScore: $overallScore, transcript: $transcript, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InterviewAttemptImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.recordingUploadStatus, recordingUploadStatus) ||
                other.recordingUploadStatus == recordingUploadStatus) &&
            (identical(other.analysisStatus, analysisStatus) ||
                other.analysisStatus == analysisStatus) &&
            (identical(other.attemptStatus, attemptStatus) ||
                other.attemptStatus == attemptStatus) &&
            (identical(other.overallScore, overallScore) ||
                other.overallScore == overallScore) &&
            (identical(other.transcript, transcript) ||
                other.transcript == transcript) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      questionId,
      recordingUploadStatus,
      analysisStatus,
      attemptStatus,
      overallScore,
      transcript,
      createdAt);

  /// Create a copy of InterviewAttempt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InterviewAttemptImplCopyWith<_$InterviewAttemptImpl> get copyWith =>
      __$$InterviewAttemptImplCopyWithImpl<_$InterviewAttemptImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InterviewAttemptImplToJson(
      this,
    );
  }
}

abstract class _InterviewAttempt extends InterviewAttempt {
  const factory _InterviewAttempt(
          {required final String id,
          @JsonKey(name: 'question_id') final String? questionId,
          @JsonKey(name: 'recording_upload_status')
          final InterviewRecordingUploadStatus recordingUploadStatus,
          @JsonKey(name: 'analysis_status')
          final InterviewAnalysisStatus analysisStatus,
          @JsonKey(name: 'attempt_status')
          final InterviewAttemptStatus attemptStatus,
          @JsonKey(name: 'overall_score') final int? overallScore,
          final String? transcript,
          @JsonKey(name: 'created_at') final DateTime? createdAt}) =
      _$InterviewAttemptImpl;
  const _InterviewAttempt._() : super._();

  factory _InterviewAttempt.fromJson(Map<String, dynamic> json) =
      _$InterviewAttemptImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'question_id')
  String? get questionId;
  @override
  @JsonKey(name: 'recording_upload_status')
  InterviewRecordingUploadStatus get recordingUploadStatus;
  @override
  @JsonKey(name: 'analysis_status')
  InterviewAnalysisStatus get analysisStatus;
  @override
  @JsonKey(name: 'attempt_status')
  InterviewAttemptStatus get attemptStatus;
  @override
  @JsonKey(name: 'overall_score')
  int? get overallScore;
  @override
  String? get transcript;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of InterviewAttempt
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InterviewAttemptImplCopyWith<_$InterviewAttemptImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InterviewPracticeSessionState _$InterviewPracticeSessionStateFromJson(
    Map<String, dynamic> json) {
  return _InterviewPracticeSessionState.fromJson(json);
}

/// @nodoc
mixin _$InterviewPracticeSessionState {
  String get scenarioId => throw _privateConstructorUsedError;
  String get practiceSessionId => throw _privateConstructorUsedError;
  int get currentQuestionIndex => throw _privateConstructorUsedError;
  List<String> get answeredQuestionIds => throw _privateConstructorUsedError;
  Map<String, String> get attemptIdsByQuestionId =>
      throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this InterviewPracticeSessionState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InterviewPracticeSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InterviewPracticeSessionStateCopyWith<InterviewPracticeSessionState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InterviewPracticeSessionStateCopyWith<$Res> {
  factory $InterviewPracticeSessionStateCopyWith(
          InterviewPracticeSessionState value,
          $Res Function(InterviewPracticeSessionState) then) =
      _$InterviewPracticeSessionStateCopyWithImpl<$Res,
          InterviewPracticeSessionState>;
  @useResult
  $Res call(
      {String scenarioId,
      String practiceSessionId,
      int currentQuestionIndex,
      List<String> answeredQuestionIds,
      Map<String, String> attemptIdsByQuestionId,
      DateTime? updatedAt});
}

/// @nodoc
class _$InterviewPracticeSessionStateCopyWithImpl<$Res,
        $Val extends InterviewPracticeSessionState>
    implements $InterviewPracticeSessionStateCopyWith<$Res> {
  _$InterviewPracticeSessionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InterviewPracticeSessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scenarioId = null,
    Object? practiceSessionId = null,
    Object? currentQuestionIndex = null,
    Object? answeredQuestionIds = null,
    Object? attemptIdsByQuestionId = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      scenarioId: null == scenarioId
          ? _value.scenarioId
          : scenarioId // ignore: cast_nullable_to_non_nullable
              as String,
      practiceSessionId: null == practiceSessionId
          ? _value.practiceSessionId
          : practiceSessionId // ignore: cast_nullable_to_non_nullable
              as String,
      currentQuestionIndex: null == currentQuestionIndex
          ? _value.currentQuestionIndex
          : currentQuestionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      answeredQuestionIds: null == answeredQuestionIds
          ? _value.answeredQuestionIds
          : answeredQuestionIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      attemptIdsByQuestionId: null == attemptIdsByQuestionId
          ? _value.attemptIdsByQuestionId
          : attemptIdsByQuestionId // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InterviewPracticeSessionStateImplCopyWith<$Res>
    implements $InterviewPracticeSessionStateCopyWith<$Res> {
  factory _$$InterviewPracticeSessionStateImplCopyWith(
          _$InterviewPracticeSessionStateImpl value,
          $Res Function(_$InterviewPracticeSessionStateImpl) then) =
      __$$InterviewPracticeSessionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String scenarioId,
      String practiceSessionId,
      int currentQuestionIndex,
      List<String> answeredQuestionIds,
      Map<String, String> attemptIdsByQuestionId,
      DateTime? updatedAt});
}

/// @nodoc
class __$$InterviewPracticeSessionStateImplCopyWithImpl<$Res>
    extends _$InterviewPracticeSessionStateCopyWithImpl<$Res,
        _$InterviewPracticeSessionStateImpl>
    implements _$$InterviewPracticeSessionStateImplCopyWith<$Res> {
  __$$InterviewPracticeSessionStateImplCopyWithImpl(
      _$InterviewPracticeSessionStateImpl _value,
      $Res Function(_$InterviewPracticeSessionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of InterviewPracticeSessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scenarioId = null,
    Object? practiceSessionId = null,
    Object? currentQuestionIndex = null,
    Object? answeredQuestionIds = null,
    Object? attemptIdsByQuestionId = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$InterviewPracticeSessionStateImpl(
      scenarioId: null == scenarioId
          ? _value.scenarioId
          : scenarioId // ignore: cast_nullable_to_non_nullable
              as String,
      practiceSessionId: null == practiceSessionId
          ? _value.practiceSessionId
          : practiceSessionId // ignore: cast_nullable_to_non_nullable
              as String,
      currentQuestionIndex: null == currentQuestionIndex
          ? _value.currentQuestionIndex
          : currentQuestionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      answeredQuestionIds: null == answeredQuestionIds
          ? _value._answeredQuestionIds
          : answeredQuestionIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      attemptIdsByQuestionId: null == attemptIdsByQuestionId
          ? _value._attemptIdsByQuestionId
          : attemptIdsByQuestionId // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InterviewPracticeSessionStateImpl
    implements _InterviewPracticeSessionState {
  const _$InterviewPracticeSessionStateImpl(
      {required this.scenarioId,
      required this.practiceSessionId,
      this.currentQuestionIndex = 0,
      final List<String> answeredQuestionIds = const [],
      final Map<String, String> attemptIdsByQuestionId = const {},
      this.updatedAt})
      : _answeredQuestionIds = answeredQuestionIds,
        _attemptIdsByQuestionId = attemptIdsByQuestionId;

  factory _$InterviewPracticeSessionStateImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$InterviewPracticeSessionStateImplFromJson(json);

  @override
  final String scenarioId;
  @override
  final String practiceSessionId;
  @override
  @JsonKey()
  final int currentQuestionIndex;
  final List<String> _answeredQuestionIds;
  @override
  @JsonKey()
  List<String> get answeredQuestionIds {
    if (_answeredQuestionIds is EqualUnmodifiableListView)
      return _answeredQuestionIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answeredQuestionIds);
  }

  final Map<String, String> _attemptIdsByQuestionId;
  @override
  @JsonKey()
  Map<String, String> get attemptIdsByQuestionId {
    if (_attemptIdsByQuestionId is EqualUnmodifiableMapView)
      return _attemptIdsByQuestionId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_attemptIdsByQuestionId);
  }

  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'InterviewPracticeSessionState(scenarioId: $scenarioId, practiceSessionId: $practiceSessionId, currentQuestionIndex: $currentQuestionIndex, answeredQuestionIds: $answeredQuestionIds, attemptIdsByQuestionId: $attemptIdsByQuestionId, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InterviewPracticeSessionStateImpl &&
            (identical(other.scenarioId, scenarioId) ||
                other.scenarioId == scenarioId) &&
            (identical(other.practiceSessionId, practiceSessionId) ||
                other.practiceSessionId == practiceSessionId) &&
            (identical(other.currentQuestionIndex, currentQuestionIndex) ||
                other.currentQuestionIndex == currentQuestionIndex) &&
            const DeepCollectionEquality()
                .equals(other._answeredQuestionIds, _answeredQuestionIds) &&
            const DeepCollectionEquality().equals(
                other._attemptIdsByQuestionId, _attemptIdsByQuestionId) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      scenarioId,
      practiceSessionId,
      currentQuestionIndex,
      const DeepCollectionEquality().hash(_answeredQuestionIds),
      const DeepCollectionEquality().hash(_attemptIdsByQuestionId),
      updatedAt);

  /// Create a copy of InterviewPracticeSessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InterviewPracticeSessionStateImplCopyWith<
          _$InterviewPracticeSessionStateImpl>
      get copyWith => __$$InterviewPracticeSessionStateImplCopyWithImpl<
          _$InterviewPracticeSessionStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InterviewPracticeSessionStateImplToJson(
      this,
    );
  }
}

abstract class _InterviewPracticeSessionState
    implements InterviewPracticeSessionState {
  const factory _InterviewPracticeSessionState(
      {required final String scenarioId,
      required final String practiceSessionId,
      final int currentQuestionIndex,
      final List<String> answeredQuestionIds,
      final Map<String, String> attemptIdsByQuestionId,
      final DateTime? updatedAt}) = _$InterviewPracticeSessionStateImpl;

  factory _InterviewPracticeSessionState.fromJson(Map<String, dynamic> json) =
      _$InterviewPracticeSessionStateImpl.fromJson;

  @override
  String get scenarioId;
  @override
  String get practiceSessionId;
  @override
  int get currentQuestionIndex;
  @override
  List<String> get answeredQuestionIds;
  @override
  Map<String, String> get attemptIdsByQuestionId;
  @override
  DateTime? get updatedAt;

  /// Create a copy of InterviewPracticeSessionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InterviewPracticeSessionStateImplCopyWith<
          _$InterviewPracticeSessionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
