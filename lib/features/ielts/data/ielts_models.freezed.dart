// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ielts_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IeltsReportFeedback _$IeltsReportFeedbackFromJson(Map<String, dynamic> json) {
  return _IeltsReportFeedback.fromJson(json);
}

/// @nodoc
mixin _$IeltsReportFeedback {
  String get summary => throw _privateConstructorUsedError;
  List<String> get strengths => throw _privateConstructorUsedError;
  List<String> get improvements => throw _privateConstructorUsedError;

  /// Serializes this IeltsReportFeedback to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IeltsReportFeedback
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IeltsReportFeedbackCopyWith<IeltsReportFeedback> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IeltsReportFeedbackCopyWith<$Res> {
  factory $IeltsReportFeedbackCopyWith(
          IeltsReportFeedback value, $Res Function(IeltsReportFeedback) then) =
      _$IeltsReportFeedbackCopyWithImpl<$Res, IeltsReportFeedback>;
  @useResult
  $Res call(
      {String summary, List<String> strengths, List<String> improvements});
}

/// @nodoc
class _$IeltsReportFeedbackCopyWithImpl<$Res, $Val extends IeltsReportFeedback>
    implements $IeltsReportFeedbackCopyWith<$Res> {
  _$IeltsReportFeedbackCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IeltsReportFeedback
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = null,
    Object? strengths = null,
    Object? improvements = null,
  }) {
    return _then(_value.copyWith(
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      strengths: null == strengths
          ? _value.strengths
          : strengths // ignore: cast_nullable_to_non_nullable
              as List<String>,
      improvements: null == improvements
          ? _value.improvements
          : improvements // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IeltsReportFeedbackImplCopyWith<$Res>
    implements $IeltsReportFeedbackCopyWith<$Res> {
  factory _$$IeltsReportFeedbackImplCopyWith(_$IeltsReportFeedbackImpl value,
          $Res Function(_$IeltsReportFeedbackImpl) then) =
      __$$IeltsReportFeedbackImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String summary, List<String> strengths, List<String> improvements});
}

/// @nodoc
class __$$IeltsReportFeedbackImplCopyWithImpl<$Res>
    extends _$IeltsReportFeedbackCopyWithImpl<$Res, _$IeltsReportFeedbackImpl>
    implements _$$IeltsReportFeedbackImplCopyWith<$Res> {
  __$$IeltsReportFeedbackImplCopyWithImpl(_$IeltsReportFeedbackImpl _value,
      $Res Function(_$IeltsReportFeedbackImpl) _then)
      : super(_value, _then);

  /// Create a copy of IeltsReportFeedback
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = null,
    Object? strengths = null,
    Object? improvements = null,
  }) {
    return _then(_$IeltsReportFeedbackImpl(
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      strengths: null == strengths
          ? _value._strengths
          : strengths // ignore: cast_nullable_to_non_nullable
              as List<String>,
      improvements: null == improvements
          ? _value._improvements
          : improvements // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IeltsReportFeedbackImpl implements _IeltsReportFeedback {
  const _$IeltsReportFeedbackImpl(
      {this.summary = '',
      final List<String> strengths = const [],
      final List<String> improvements = const []})
      : _strengths = strengths,
        _improvements = improvements;

  factory _$IeltsReportFeedbackImpl.fromJson(Map<String, dynamic> json) =>
      _$$IeltsReportFeedbackImplFromJson(json);

  @override
  @JsonKey()
  final String summary;
  final List<String> _strengths;
  @override
  @JsonKey()
  List<String> get strengths {
    if (_strengths is EqualUnmodifiableListView) return _strengths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_strengths);
  }

  final List<String> _improvements;
  @override
  @JsonKey()
  List<String> get improvements {
    if (_improvements is EqualUnmodifiableListView) return _improvements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_improvements);
  }

  @override
  String toString() {
    return 'IeltsReportFeedback(summary: $summary, strengths: $strengths, improvements: $improvements)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IeltsReportFeedbackImpl &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality()
                .equals(other._strengths, _strengths) &&
            const DeepCollectionEquality()
                .equals(other._improvements, _improvements));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      summary,
      const DeepCollectionEquality().hash(_strengths),
      const DeepCollectionEquality().hash(_improvements));

  /// Create a copy of IeltsReportFeedback
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IeltsReportFeedbackImplCopyWith<_$IeltsReportFeedbackImpl> get copyWith =>
      __$$IeltsReportFeedbackImplCopyWithImpl<_$IeltsReportFeedbackImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IeltsReportFeedbackImplToJson(
      this,
    );
  }
}

abstract class _IeltsReportFeedback implements IeltsReportFeedback {
  const factory _IeltsReportFeedback(
      {final String summary,
      final List<String> strengths,
      final List<String> improvements}) = _$IeltsReportFeedbackImpl;

  factory _IeltsReportFeedback.fromJson(Map<String, dynamic> json) =
      _$IeltsReportFeedbackImpl.fromJson;

  @override
  String get summary;
  @override
  List<String> get strengths;
  @override
  List<String> get improvements;

  /// Create a copy of IeltsReportFeedback
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IeltsReportFeedbackImplCopyWith<_$IeltsReportFeedbackImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IeltsReport _$IeltsReportFromJson(Map<String, dynamic> json) {
  return _IeltsReport.fromJson(json);
}

/// @nodoc
mixin _$IeltsReport {
  num get overallScore => throw _privateConstructorUsedError;
  num get practiceBandEstimate => throw _privateConstructorUsedError;
  Map<String, num> get criteriaScores => throw _privateConstructorUsedError;
  Map<String, num> get criteriaBand => throw _privateConstructorUsedError;
  IeltsReportFeedback get feedback => throw _privateConstructorUsedError;
  String? get transcript => throw _privateConstructorUsedError;
  List<String> get detectedLanguages => throw _privateConstructorUsedError;
  bool get codeSwitchingDetected => throw _privateConstructorUsedError;

  /// Serializes this IeltsReport to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IeltsReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IeltsReportCopyWith<IeltsReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IeltsReportCopyWith<$Res> {
  factory $IeltsReportCopyWith(
          IeltsReport value, $Res Function(IeltsReport) then) =
      _$IeltsReportCopyWithImpl<$Res, IeltsReport>;
  @useResult
  $Res call(
      {num overallScore,
      num practiceBandEstimate,
      Map<String, num> criteriaScores,
      Map<String, num> criteriaBand,
      IeltsReportFeedback feedback,
      String? transcript,
      List<String> detectedLanguages,
      bool codeSwitchingDetected});

  $IeltsReportFeedbackCopyWith<$Res> get feedback;
}

/// @nodoc
class _$IeltsReportCopyWithImpl<$Res, $Val extends IeltsReport>
    implements $IeltsReportCopyWith<$Res> {
  _$IeltsReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IeltsReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overallScore = null,
    Object? practiceBandEstimate = null,
    Object? criteriaScores = null,
    Object? criteriaBand = null,
    Object? feedback = null,
    Object? transcript = freezed,
    Object? detectedLanguages = null,
    Object? codeSwitchingDetected = null,
  }) {
    return _then(_value.copyWith(
      overallScore: null == overallScore
          ? _value.overallScore
          : overallScore // ignore: cast_nullable_to_non_nullable
              as num,
      practiceBandEstimate: null == practiceBandEstimate
          ? _value.practiceBandEstimate
          : practiceBandEstimate // ignore: cast_nullable_to_non_nullable
              as num,
      criteriaScores: null == criteriaScores
          ? _value.criteriaScores
          : criteriaScores // ignore: cast_nullable_to_non_nullable
              as Map<String, num>,
      criteriaBand: null == criteriaBand
          ? _value.criteriaBand
          : criteriaBand // ignore: cast_nullable_to_non_nullable
              as Map<String, num>,
      feedback: null == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as IeltsReportFeedback,
      transcript: freezed == transcript
          ? _value.transcript
          : transcript // ignore: cast_nullable_to_non_nullable
              as String?,
      detectedLanguages: null == detectedLanguages
          ? _value.detectedLanguages
          : detectedLanguages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      codeSwitchingDetected: null == codeSwitchingDetected
          ? _value.codeSwitchingDetected
          : codeSwitchingDetected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of IeltsReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IeltsReportFeedbackCopyWith<$Res> get feedback {
    return $IeltsReportFeedbackCopyWith<$Res>(_value.feedback, (value) {
      return _then(_value.copyWith(feedback: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$IeltsReportImplCopyWith<$Res>
    implements $IeltsReportCopyWith<$Res> {
  factory _$$IeltsReportImplCopyWith(
          _$IeltsReportImpl value, $Res Function(_$IeltsReportImpl) then) =
      __$$IeltsReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {num overallScore,
      num practiceBandEstimate,
      Map<String, num> criteriaScores,
      Map<String, num> criteriaBand,
      IeltsReportFeedback feedback,
      String? transcript,
      List<String> detectedLanguages,
      bool codeSwitchingDetected});

  @override
  $IeltsReportFeedbackCopyWith<$Res> get feedback;
}

/// @nodoc
class __$$IeltsReportImplCopyWithImpl<$Res>
    extends _$IeltsReportCopyWithImpl<$Res, _$IeltsReportImpl>
    implements _$$IeltsReportImplCopyWith<$Res> {
  __$$IeltsReportImplCopyWithImpl(
      _$IeltsReportImpl _value, $Res Function(_$IeltsReportImpl) _then)
      : super(_value, _then);

  /// Create a copy of IeltsReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overallScore = null,
    Object? practiceBandEstimate = null,
    Object? criteriaScores = null,
    Object? criteriaBand = null,
    Object? feedback = null,
    Object? transcript = freezed,
    Object? detectedLanguages = null,
    Object? codeSwitchingDetected = null,
  }) {
    return _then(_$IeltsReportImpl(
      overallScore: null == overallScore
          ? _value.overallScore
          : overallScore // ignore: cast_nullable_to_non_nullable
              as num,
      practiceBandEstimate: null == practiceBandEstimate
          ? _value.practiceBandEstimate
          : practiceBandEstimate // ignore: cast_nullable_to_non_nullable
              as num,
      criteriaScores: null == criteriaScores
          ? _value._criteriaScores
          : criteriaScores // ignore: cast_nullable_to_non_nullable
              as Map<String, num>,
      criteriaBand: null == criteriaBand
          ? _value._criteriaBand
          : criteriaBand // ignore: cast_nullable_to_non_nullable
              as Map<String, num>,
      feedback: null == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as IeltsReportFeedback,
      transcript: freezed == transcript
          ? _value.transcript
          : transcript // ignore: cast_nullable_to_non_nullable
              as String?,
      detectedLanguages: null == detectedLanguages
          ? _value._detectedLanguages
          : detectedLanguages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      codeSwitchingDetected: null == codeSwitchingDetected
          ? _value.codeSwitchingDetected
          : codeSwitchingDetected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IeltsReportImpl implements _IeltsReport {
  const _$IeltsReportImpl(
      {this.overallScore = 0,
      this.practiceBandEstimate = 0,
      final Map<String, num> criteriaScores = const {},
      final Map<String, num> criteriaBand = const {},
      this.feedback = const IeltsReportFeedback(),
      this.transcript,
      final List<String> detectedLanguages = const [],
      this.codeSwitchingDetected = false})
      : _criteriaScores = criteriaScores,
        _criteriaBand = criteriaBand,
        _detectedLanguages = detectedLanguages;

  factory _$IeltsReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$IeltsReportImplFromJson(json);

  @override
  @JsonKey()
  final num overallScore;
  @override
  @JsonKey()
  final num practiceBandEstimate;
  final Map<String, num> _criteriaScores;
  @override
  @JsonKey()
  Map<String, num> get criteriaScores {
    if (_criteriaScores is EqualUnmodifiableMapView) return _criteriaScores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_criteriaScores);
  }

  final Map<String, num> _criteriaBand;
  @override
  @JsonKey()
  Map<String, num> get criteriaBand {
    if (_criteriaBand is EqualUnmodifiableMapView) return _criteriaBand;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_criteriaBand);
  }

  @override
  @JsonKey()
  final IeltsReportFeedback feedback;
  @override
  final String? transcript;
  final List<String> _detectedLanguages;
  @override
  @JsonKey()
  List<String> get detectedLanguages {
    if (_detectedLanguages is EqualUnmodifiableListView)
      return _detectedLanguages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_detectedLanguages);
  }

  @override
  @JsonKey()
  final bool codeSwitchingDetected;

  @override
  String toString() {
    return 'IeltsReport(overallScore: $overallScore, practiceBandEstimate: $practiceBandEstimate, criteriaScores: $criteriaScores, criteriaBand: $criteriaBand, feedback: $feedback, transcript: $transcript, detectedLanguages: $detectedLanguages, codeSwitchingDetected: $codeSwitchingDetected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IeltsReportImpl &&
            (identical(other.overallScore, overallScore) ||
                other.overallScore == overallScore) &&
            (identical(other.practiceBandEstimate, practiceBandEstimate) ||
                other.practiceBandEstimate == practiceBandEstimate) &&
            const DeepCollectionEquality()
                .equals(other._criteriaScores, _criteriaScores) &&
            const DeepCollectionEquality()
                .equals(other._criteriaBand, _criteriaBand) &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback) &&
            (identical(other.transcript, transcript) ||
                other.transcript == transcript) &&
            const DeepCollectionEquality()
                .equals(other._detectedLanguages, _detectedLanguages) &&
            (identical(other.codeSwitchingDetected, codeSwitchingDetected) ||
                other.codeSwitchingDetected == codeSwitchingDetected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      overallScore,
      practiceBandEstimate,
      const DeepCollectionEquality().hash(_criteriaScores),
      const DeepCollectionEquality().hash(_criteriaBand),
      feedback,
      transcript,
      const DeepCollectionEquality().hash(_detectedLanguages),
      codeSwitchingDetected);

  /// Create a copy of IeltsReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IeltsReportImplCopyWith<_$IeltsReportImpl> get copyWith =>
      __$$IeltsReportImplCopyWithImpl<_$IeltsReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IeltsReportImplToJson(
      this,
    );
  }
}

abstract class _IeltsReport implements IeltsReport {
  const factory _IeltsReport(
      {final num overallScore,
      final num practiceBandEstimate,
      final Map<String, num> criteriaScores,
      final Map<String, num> criteriaBand,
      final IeltsReportFeedback feedback,
      final String? transcript,
      final List<String> detectedLanguages,
      final bool codeSwitchingDetected}) = _$IeltsReportImpl;

  factory _IeltsReport.fromJson(Map<String, dynamic> json) =
      _$IeltsReportImpl.fromJson;

  @override
  num get overallScore;
  @override
  num get practiceBandEstimate;
  @override
  Map<String, num> get criteriaScores;
  @override
  Map<String, num> get criteriaBand;
  @override
  IeltsReportFeedback get feedback;
  @override
  String? get transcript;
  @override
  List<String> get detectedLanguages;
  @override
  bool get codeSwitchingDetected;

  /// Create a copy of IeltsReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IeltsReportImplCopyWith<_$IeltsReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IeltsProgress _$IeltsProgressFromJson(Map<String, dynamic> json) {
  return _IeltsProgress.fromJson(json);
}

/// @nodoc
mixin _$IeltsProgress {
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'lessons_completed')
  int get lessonsCompleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_attempts')
  int get totalAttempts => throw _privateConstructorUsedError;
  @JsonKey(name: 'best_band')
  double? get bestBand => throw _privateConstructorUsedError;
  @JsonKey(name: 'latest_band')
  double? get latestBand => throw _privateConstructorUsedError;
  @JsonKey(name: 'xp_total')
  int get xpTotal => throw _privateConstructorUsedError;

  /// Serializes this IeltsProgress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IeltsProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IeltsProgressCopyWith<IeltsProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IeltsProgressCopyWith<$Res> {
  factory $IeltsProgressCopyWith(
          IeltsProgress value, $Res Function(IeltsProgress) then) =
      _$IeltsProgressCopyWithImpl<$Res, IeltsProgress>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'lessons_completed') int lessonsCompleted,
      @JsonKey(name: 'total_attempts') int totalAttempts,
      @JsonKey(name: 'best_band') double? bestBand,
      @JsonKey(name: 'latest_band') double? latestBand,
      @JsonKey(name: 'xp_total') int xpTotal});
}

/// @nodoc
class _$IeltsProgressCopyWithImpl<$Res, $Val extends IeltsProgress>
    implements $IeltsProgressCopyWith<$Res> {
  _$IeltsProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IeltsProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? lessonsCompleted = null,
    Object? totalAttempts = null,
    Object? bestBand = freezed,
    Object? latestBand = freezed,
    Object? xpTotal = null,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      lessonsCompleted: null == lessonsCompleted
          ? _value.lessonsCompleted
          : lessonsCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      totalAttempts: null == totalAttempts
          ? _value.totalAttempts
          : totalAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      bestBand: freezed == bestBand
          ? _value.bestBand
          : bestBand // ignore: cast_nullable_to_non_nullable
              as double?,
      latestBand: freezed == latestBand
          ? _value.latestBand
          : latestBand // ignore: cast_nullable_to_non_nullable
              as double?,
      xpTotal: null == xpTotal
          ? _value.xpTotal
          : xpTotal // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IeltsProgressImplCopyWith<$Res>
    implements $IeltsProgressCopyWith<$Res> {
  factory _$$IeltsProgressImplCopyWith(
          _$IeltsProgressImpl value, $Res Function(_$IeltsProgressImpl) then) =
      __$$IeltsProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'lessons_completed') int lessonsCompleted,
      @JsonKey(name: 'total_attempts') int totalAttempts,
      @JsonKey(name: 'best_band') double? bestBand,
      @JsonKey(name: 'latest_band') double? latestBand,
      @JsonKey(name: 'xp_total') int xpTotal});
}

/// @nodoc
class __$$IeltsProgressImplCopyWithImpl<$Res>
    extends _$IeltsProgressCopyWithImpl<$Res, _$IeltsProgressImpl>
    implements _$$IeltsProgressImplCopyWith<$Res> {
  __$$IeltsProgressImplCopyWithImpl(
      _$IeltsProgressImpl _value, $Res Function(_$IeltsProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of IeltsProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? lessonsCompleted = null,
    Object? totalAttempts = null,
    Object? bestBand = freezed,
    Object? latestBand = freezed,
    Object? xpTotal = null,
  }) {
    return _then(_$IeltsProgressImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      lessonsCompleted: null == lessonsCompleted
          ? _value.lessonsCompleted
          : lessonsCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      totalAttempts: null == totalAttempts
          ? _value.totalAttempts
          : totalAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      bestBand: freezed == bestBand
          ? _value.bestBand
          : bestBand // ignore: cast_nullable_to_non_nullable
              as double?,
      latestBand: freezed == latestBand
          ? _value.latestBand
          : latestBand // ignore: cast_nullable_to_non_nullable
              as double?,
      xpTotal: null == xpTotal
          ? _value.xpTotal
          : xpTotal // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IeltsProgressImpl implements _IeltsProgress {
  const _$IeltsProgressImpl(
      {@JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'lessons_completed') this.lessonsCompleted = 0,
      @JsonKey(name: 'total_attempts') this.totalAttempts = 0,
      @JsonKey(name: 'best_band') this.bestBand,
      @JsonKey(name: 'latest_band') this.latestBand,
      @JsonKey(name: 'xp_total') this.xpTotal = 0});

  factory _$IeltsProgressImpl.fromJson(Map<String, dynamic> json) =>
      _$$IeltsProgressImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  @JsonKey(name: 'lessons_completed')
  final int lessonsCompleted;
  @override
  @JsonKey(name: 'total_attempts')
  final int totalAttempts;
  @override
  @JsonKey(name: 'best_band')
  final double? bestBand;
  @override
  @JsonKey(name: 'latest_band')
  final double? latestBand;
  @override
  @JsonKey(name: 'xp_total')
  final int xpTotal;

  @override
  String toString() {
    return 'IeltsProgress(userId: $userId, lessonsCompleted: $lessonsCompleted, totalAttempts: $totalAttempts, bestBand: $bestBand, latestBand: $latestBand, xpTotal: $xpTotal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IeltsProgressImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.lessonsCompleted, lessonsCompleted) ||
                other.lessonsCompleted == lessonsCompleted) &&
            (identical(other.totalAttempts, totalAttempts) ||
                other.totalAttempts == totalAttempts) &&
            (identical(other.bestBand, bestBand) ||
                other.bestBand == bestBand) &&
            (identical(other.latestBand, latestBand) ||
                other.latestBand == latestBand) &&
            (identical(other.xpTotal, xpTotal) || other.xpTotal == xpTotal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, lessonsCompleted,
      totalAttempts, bestBand, latestBand, xpTotal);

  /// Create a copy of IeltsProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IeltsProgressImplCopyWith<_$IeltsProgressImpl> get copyWith =>
      __$$IeltsProgressImplCopyWithImpl<_$IeltsProgressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IeltsProgressImplToJson(
      this,
    );
  }
}

abstract class _IeltsProgress implements IeltsProgress {
  const factory _IeltsProgress(
      {@JsonKey(name: 'user_id') final String? userId,
      @JsonKey(name: 'lessons_completed') final int lessonsCompleted,
      @JsonKey(name: 'total_attempts') final int totalAttempts,
      @JsonKey(name: 'best_band') final double? bestBand,
      @JsonKey(name: 'latest_band') final double? latestBand,
      @JsonKey(name: 'xp_total') final int xpTotal}) = _$IeltsProgressImpl;

  factory _IeltsProgress.fromJson(Map<String, dynamic> json) =
      _$IeltsProgressImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  @JsonKey(name: 'lessons_completed')
  int get lessonsCompleted;
  @override
  @JsonKey(name: 'total_attempts')
  int get totalAttempts;
  @override
  @JsonKey(name: 'best_band')
  double? get bestBand;
  @override
  @JsonKey(name: 'latest_band')
  double? get latestBand;
  @override
  @JsonKey(name: 'xp_total')
  int get xpTotal;

  /// Create a copy of IeltsProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IeltsProgressImplCopyWith<_$IeltsProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IeltsAttempt _$IeltsAttemptFromJson(Map<String, dynamic> json) {
  return _IeltsAttempt.fromJson(json);
}

/// @nodoc
mixin _$IeltsAttempt {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'lesson_id')
  String? get lessonId => throw _privateConstructorUsedError;
  IeltsPart? get part => throw _privateConstructorUsedError;
  @JsonKey(name: 'practice_band')
  double? get practiceBand => throw _privateConstructorUsedError;
  @JsonKey(name: 'overall_score')
  int? get overallScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this IeltsAttempt to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IeltsAttempt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IeltsAttemptCopyWith<IeltsAttempt> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IeltsAttemptCopyWith<$Res> {
  factory $IeltsAttemptCopyWith(
          IeltsAttempt value, $Res Function(IeltsAttempt) then) =
      _$IeltsAttemptCopyWithImpl<$Res, IeltsAttempt>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'lesson_id') String? lessonId,
      IeltsPart? part,
      @JsonKey(name: 'practice_band') double? practiceBand,
      @JsonKey(name: 'overall_score') int? overallScore,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class _$IeltsAttemptCopyWithImpl<$Res, $Val extends IeltsAttempt>
    implements $IeltsAttemptCopyWith<$Res> {
  _$IeltsAttemptCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IeltsAttempt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lessonId = freezed,
    Object? part = freezed,
    Object? practiceBand = freezed,
    Object? overallScore = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      lessonId: freezed == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as String?,
      part: freezed == part
          ? _value.part
          : part // ignore: cast_nullable_to_non_nullable
              as IeltsPart?,
      practiceBand: freezed == practiceBand
          ? _value.practiceBand
          : practiceBand // ignore: cast_nullable_to_non_nullable
              as double?,
      overallScore: freezed == overallScore
          ? _value.overallScore
          : overallScore // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IeltsAttemptImplCopyWith<$Res>
    implements $IeltsAttemptCopyWith<$Res> {
  factory _$$IeltsAttemptImplCopyWith(
          _$IeltsAttemptImpl value, $Res Function(_$IeltsAttemptImpl) then) =
      __$$IeltsAttemptImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'lesson_id') String? lessonId,
      IeltsPart? part,
      @JsonKey(name: 'practice_band') double? practiceBand,
      @JsonKey(name: 'overall_score') int? overallScore,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class __$$IeltsAttemptImplCopyWithImpl<$Res>
    extends _$IeltsAttemptCopyWithImpl<$Res, _$IeltsAttemptImpl>
    implements _$$IeltsAttemptImplCopyWith<$Res> {
  __$$IeltsAttemptImplCopyWithImpl(
      _$IeltsAttemptImpl _value, $Res Function(_$IeltsAttemptImpl) _then)
      : super(_value, _then);

  /// Create a copy of IeltsAttempt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? lessonId = freezed,
    Object? part = freezed,
    Object? practiceBand = freezed,
    Object? overallScore = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$IeltsAttemptImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      lessonId: freezed == lessonId
          ? _value.lessonId
          : lessonId // ignore: cast_nullable_to_non_nullable
              as String?,
      part: freezed == part
          ? _value.part
          : part // ignore: cast_nullable_to_non_nullable
              as IeltsPart?,
      practiceBand: freezed == practiceBand
          ? _value.practiceBand
          : practiceBand // ignore: cast_nullable_to_non_nullable
              as double?,
      overallScore: freezed == overallScore
          ? _value.overallScore
          : overallScore // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IeltsAttemptImpl implements _IeltsAttempt {
  const _$IeltsAttemptImpl(
      {required this.id,
      @JsonKey(name: 'lesson_id') this.lessonId,
      this.part,
      @JsonKey(name: 'practice_band') this.practiceBand,
      @JsonKey(name: 'overall_score') this.overallScore,
      @JsonKey(name: 'created_at') this.createdAt});

  factory _$IeltsAttemptImpl.fromJson(Map<String, dynamic> json) =>
      _$$IeltsAttemptImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'lesson_id')
  final String? lessonId;
  @override
  final IeltsPart? part;
  @override
  @JsonKey(name: 'practice_band')
  final double? practiceBand;
  @override
  @JsonKey(name: 'overall_score')
  final int? overallScore;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'IeltsAttempt(id: $id, lessonId: $lessonId, part: $part, practiceBand: $practiceBand, overallScore: $overallScore, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IeltsAttemptImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lessonId, lessonId) ||
                other.lessonId == lessonId) &&
            (identical(other.part, part) || other.part == part) &&
            (identical(other.practiceBand, practiceBand) ||
                other.practiceBand == practiceBand) &&
            (identical(other.overallScore, overallScore) ||
                other.overallScore == overallScore) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, lessonId, part, practiceBand, overallScore, createdAt);

  /// Create a copy of IeltsAttempt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IeltsAttemptImplCopyWith<_$IeltsAttemptImpl> get copyWith =>
      __$$IeltsAttemptImplCopyWithImpl<_$IeltsAttemptImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IeltsAttemptImplToJson(
      this,
    );
  }
}

abstract class _IeltsAttempt implements IeltsAttempt {
  const factory _IeltsAttempt(
          {required final String id,
          @JsonKey(name: 'lesson_id') final String? lessonId,
          final IeltsPart? part,
          @JsonKey(name: 'practice_band') final double? practiceBand,
          @JsonKey(name: 'overall_score') final int? overallScore,
          @JsonKey(name: 'created_at') final DateTime? createdAt}) =
      _$IeltsAttemptImpl;

  factory _IeltsAttempt.fromJson(Map<String, dynamic> json) =
      _$IeltsAttemptImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'lesson_id')
  String? get lessonId;
  @override
  IeltsPart? get part;
  @override
  @JsonKey(name: 'practice_band')
  double? get practiceBand;
  @override
  @JsonKey(name: 'overall_score')
  int? get overallScore;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of IeltsAttempt
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IeltsAttemptImplCopyWith<_$IeltsAttemptImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IeltsMockTest _$IeltsMockTestFromJson(Map<String, dynamic> json) {
  return _IeltsMockTest.fromJson(json);
}

/// @nodoc
mixin _$IeltsMockTest {
  String get id => throw _privateConstructorUsedError;
  IeltsMockStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'part1_attempt_id')
  String? get part1AttemptId => throw _privateConstructorUsedError;
  @JsonKey(name: 'part2_attempt_id')
  String? get part2AttemptId => throw _privateConstructorUsedError;
  @JsonKey(name: 'part3_attempt_id')
  String? get part3AttemptId => throw _privateConstructorUsedError;
  @JsonKey(name: 'overall_band')
  double? get overallBand => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this IeltsMockTest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IeltsMockTest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IeltsMockTestCopyWith<IeltsMockTest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IeltsMockTestCopyWith<$Res> {
  factory $IeltsMockTestCopyWith(
          IeltsMockTest value, $Res Function(IeltsMockTest) then) =
      _$IeltsMockTestCopyWithImpl<$Res, IeltsMockTest>;
  @useResult
  $Res call(
      {String id,
      IeltsMockStatus status,
      @JsonKey(name: 'part1_attempt_id') String? part1AttemptId,
      @JsonKey(name: 'part2_attempt_id') String? part2AttemptId,
      @JsonKey(name: 'part3_attempt_id') String? part3AttemptId,
      @JsonKey(name: 'overall_band') double? overallBand,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class _$IeltsMockTestCopyWithImpl<$Res, $Val extends IeltsMockTest>
    implements $IeltsMockTestCopyWith<$Res> {
  _$IeltsMockTestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IeltsMockTest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? part1AttemptId = freezed,
    Object? part2AttemptId = freezed,
    Object? part3AttemptId = freezed,
    Object? overallBand = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as IeltsMockStatus,
      part1AttemptId: freezed == part1AttemptId
          ? _value.part1AttemptId
          : part1AttemptId // ignore: cast_nullable_to_non_nullable
              as String?,
      part2AttemptId: freezed == part2AttemptId
          ? _value.part2AttemptId
          : part2AttemptId // ignore: cast_nullable_to_non_nullable
              as String?,
      part3AttemptId: freezed == part3AttemptId
          ? _value.part3AttemptId
          : part3AttemptId // ignore: cast_nullable_to_non_nullable
              as String?,
      overallBand: freezed == overallBand
          ? _value.overallBand
          : overallBand // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IeltsMockTestImplCopyWith<$Res>
    implements $IeltsMockTestCopyWith<$Res> {
  factory _$$IeltsMockTestImplCopyWith(
          _$IeltsMockTestImpl value, $Res Function(_$IeltsMockTestImpl) then) =
      __$$IeltsMockTestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      IeltsMockStatus status,
      @JsonKey(name: 'part1_attempt_id') String? part1AttemptId,
      @JsonKey(name: 'part2_attempt_id') String? part2AttemptId,
      @JsonKey(name: 'part3_attempt_id') String? part3AttemptId,
      @JsonKey(name: 'overall_band') double? overallBand,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class __$$IeltsMockTestImplCopyWithImpl<$Res>
    extends _$IeltsMockTestCopyWithImpl<$Res, _$IeltsMockTestImpl>
    implements _$$IeltsMockTestImplCopyWith<$Res> {
  __$$IeltsMockTestImplCopyWithImpl(
      _$IeltsMockTestImpl _value, $Res Function(_$IeltsMockTestImpl) _then)
      : super(_value, _then);

  /// Create a copy of IeltsMockTest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? part1AttemptId = freezed,
    Object? part2AttemptId = freezed,
    Object? part3AttemptId = freezed,
    Object? overallBand = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$IeltsMockTestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as IeltsMockStatus,
      part1AttemptId: freezed == part1AttemptId
          ? _value.part1AttemptId
          : part1AttemptId // ignore: cast_nullable_to_non_nullable
              as String?,
      part2AttemptId: freezed == part2AttemptId
          ? _value.part2AttemptId
          : part2AttemptId // ignore: cast_nullable_to_non_nullable
              as String?,
      part3AttemptId: freezed == part3AttemptId
          ? _value.part3AttemptId
          : part3AttemptId // ignore: cast_nullable_to_non_nullable
              as String?,
      overallBand: freezed == overallBand
          ? _value.overallBand
          : overallBand // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IeltsMockTestImpl implements _IeltsMockTest {
  const _$IeltsMockTestImpl(
      {required this.id,
      required this.status,
      @JsonKey(name: 'part1_attempt_id') this.part1AttemptId,
      @JsonKey(name: 'part2_attempt_id') this.part2AttemptId,
      @JsonKey(name: 'part3_attempt_id') this.part3AttemptId,
      @JsonKey(name: 'overall_band') this.overallBand,
      @JsonKey(name: 'created_at') this.createdAt});

  factory _$IeltsMockTestImpl.fromJson(Map<String, dynamic> json) =>
      _$$IeltsMockTestImplFromJson(json);

  @override
  final String id;
  @override
  final IeltsMockStatus status;
  @override
  @JsonKey(name: 'part1_attempt_id')
  final String? part1AttemptId;
  @override
  @JsonKey(name: 'part2_attempt_id')
  final String? part2AttemptId;
  @override
  @JsonKey(name: 'part3_attempt_id')
  final String? part3AttemptId;
  @override
  @JsonKey(name: 'overall_band')
  final double? overallBand;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'IeltsMockTest(id: $id, status: $status, part1AttemptId: $part1AttemptId, part2AttemptId: $part2AttemptId, part3AttemptId: $part3AttemptId, overallBand: $overallBand, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IeltsMockTestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.part1AttemptId, part1AttemptId) ||
                other.part1AttemptId == part1AttemptId) &&
            (identical(other.part2AttemptId, part2AttemptId) ||
                other.part2AttemptId == part2AttemptId) &&
            (identical(other.part3AttemptId, part3AttemptId) ||
                other.part3AttemptId == part3AttemptId) &&
            (identical(other.overallBand, overallBand) ||
                other.overallBand == overallBand) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, status, part1AttemptId,
      part2AttemptId, part3AttemptId, overallBand, createdAt);

  /// Create a copy of IeltsMockTest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IeltsMockTestImplCopyWith<_$IeltsMockTestImpl> get copyWith =>
      __$$IeltsMockTestImplCopyWithImpl<_$IeltsMockTestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IeltsMockTestImplToJson(
      this,
    );
  }
}

abstract class _IeltsMockTest implements IeltsMockTest {
  const factory _IeltsMockTest(
          {required final String id,
          required final IeltsMockStatus status,
          @JsonKey(name: 'part1_attempt_id') final String? part1AttemptId,
          @JsonKey(name: 'part2_attempt_id') final String? part2AttemptId,
          @JsonKey(name: 'part3_attempt_id') final String? part3AttemptId,
          @JsonKey(name: 'overall_band') final double? overallBand,
          @JsonKey(name: 'created_at') final DateTime? createdAt}) =
      _$IeltsMockTestImpl;

  factory _IeltsMockTest.fromJson(Map<String, dynamic> json) =
      _$IeltsMockTestImpl.fromJson;

  @override
  String get id;
  @override
  IeltsMockStatus get status;
  @override
  @JsonKey(name: 'part1_attempt_id')
  String? get part1AttemptId;
  @override
  @JsonKey(name: 'part2_attempt_id')
  String? get part2AttemptId;
  @override
  @JsonKey(name: 'part3_attempt_id')
  String? get part3AttemptId;
  @override
  @JsonKey(name: 'overall_band')
  double? get overallBand;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of IeltsMockTest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IeltsMockTestImplCopyWith<_$IeltsMockTestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
