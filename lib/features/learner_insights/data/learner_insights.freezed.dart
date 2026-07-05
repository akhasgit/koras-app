// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learner_insights.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LearnerInsights _$LearnerInsightsFromJson(Map<String, dynamic> json) {
  return _LearnerInsights.fromJson(json);
}

/// @nodoc
mixin _$LearnerInsights {
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'overall_score_avg')
  num get overallScoreAvg => throw _privateConstructorUsedError;
  @JsonKey(name: 'score_trend')
  ScoreTrend get scoreTrend => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_level')
  int get currentLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'xp_total')
  int get xpTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_streak_days')
  int get currentStreakDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'longest_streak_days')
  int get longestStreakDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_sessions')
  int get totalSessions => throw _privateConstructorUsedError;
  @JsonKey(name: 'improvement_last_30d')
  num get improvementLast30d => throw _privateConstructorUsedError;
  @JsonKey(name: 'most_improved_dimension')
  String? get mostImprovedDimension => throw _privateConstructorUsedError;
  @JsonKey(name: 'strengths_tags')
  List<String> get strengthsTags => throw _privateConstructorUsedError;
  @JsonKey(name: 'weaknesses_tags')
  List<String> get weaknessesTags => throw _privateConstructorUsedError;
  @JsonKey(name: 'score_history')
  List<Map<String, dynamic>> get scoreHistory =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this LearnerInsights to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LearnerInsights
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LearnerInsightsCopyWith<LearnerInsights> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LearnerInsightsCopyWith<$Res> {
  factory $LearnerInsightsCopyWith(
          LearnerInsights value, $Res Function(LearnerInsights) then) =
      _$LearnerInsightsCopyWithImpl<$Res, LearnerInsights>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'overall_score_avg') num overallScoreAvg,
      @JsonKey(name: 'score_trend') ScoreTrend scoreTrend,
      @JsonKey(name: 'current_level') int currentLevel,
      @JsonKey(name: 'xp_total') int xpTotal,
      @JsonKey(name: 'current_streak_days') int currentStreakDays,
      @JsonKey(name: 'longest_streak_days') int longestStreakDays,
      @JsonKey(name: 'total_sessions') int totalSessions,
      @JsonKey(name: 'improvement_last_30d') num improvementLast30d,
      @JsonKey(name: 'most_improved_dimension') String? mostImprovedDimension,
      @JsonKey(name: 'strengths_tags') List<String> strengthsTags,
      @JsonKey(name: 'weaknesses_tags') List<String> weaknessesTags,
      @JsonKey(name: 'score_history') List<Map<String, dynamic>> scoreHistory,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$LearnerInsightsCopyWithImpl<$Res, $Val extends LearnerInsights>
    implements $LearnerInsightsCopyWith<$Res> {
  _$LearnerInsightsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LearnerInsights
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? overallScoreAvg = null,
    Object? scoreTrend = null,
    Object? currentLevel = null,
    Object? xpTotal = null,
    Object? currentStreakDays = null,
    Object? longestStreakDays = null,
    Object? totalSessions = null,
    Object? improvementLast30d = null,
    Object? mostImprovedDimension = freezed,
    Object? strengthsTags = null,
    Object? weaknessesTags = null,
    Object? scoreHistory = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      overallScoreAvg: null == overallScoreAvg
          ? _value.overallScoreAvg
          : overallScoreAvg // ignore: cast_nullable_to_non_nullable
              as num,
      scoreTrend: null == scoreTrend
          ? _value.scoreTrend
          : scoreTrend // ignore: cast_nullable_to_non_nullable
              as ScoreTrend,
      currentLevel: null == currentLevel
          ? _value.currentLevel
          : currentLevel // ignore: cast_nullable_to_non_nullable
              as int,
      xpTotal: null == xpTotal
          ? _value.xpTotal
          : xpTotal // ignore: cast_nullable_to_non_nullable
              as int,
      currentStreakDays: null == currentStreakDays
          ? _value.currentStreakDays
          : currentStreakDays // ignore: cast_nullable_to_non_nullable
              as int,
      longestStreakDays: null == longestStreakDays
          ? _value.longestStreakDays
          : longestStreakDays // ignore: cast_nullable_to_non_nullable
              as int,
      totalSessions: null == totalSessions
          ? _value.totalSessions
          : totalSessions // ignore: cast_nullable_to_non_nullable
              as int,
      improvementLast30d: null == improvementLast30d
          ? _value.improvementLast30d
          : improvementLast30d // ignore: cast_nullable_to_non_nullable
              as num,
      mostImprovedDimension: freezed == mostImprovedDimension
          ? _value.mostImprovedDimension
          : mostImprovedDimension // ignore: cast_nullable_to_non_nullable
              as String?,
      strengthsTags: null == strengthsTags
          ? _value.strengthsTags
          : strengthsTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      weaknessesTags: null == weaknessesTags
          ? _value.weaknessesTags
          : weaknessesTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      scoreHistory: null == scoreHistory
          ? _value.scoreHistory
          : scoreHistory // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LearnerInsightsImplCopyWith<$Res>
    implements $LearnerInsightsCopyWith<$Res> {
  factory _$$LearnerInsightsImplCopyWith(_$LearnerInsightsImpl value,
          $Res Function(_$LearnerInsightsImpl) then) =
      __$$LearnerInsightsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'overall_score_avg') num overallScoreAvg,
      @JsonKey(name: 'score_trend') ScoreTrend scoreTrend,
      @JsonKey(name: 'current_level') int currentLevel,
      @JsonKey(name: 'xp_total') int xpTotal,
      @JsonKey(name: 'current_streak_days') int currentStreakDays,
      @JsonKey(name: 'longest_streak_days') int longestStreakDays,
      @JsonKey(name: 'total_sessions') int totalSessions,
      @JsonKey(name: 'improvement_last_30d') num improvementLast30d,
      @JsonKey(name: 'most_improved_dimension') String? mostImprovedDimension,
      @JsonKey(name: 'strengths_tags') List<String> strengthsTags,
      @JsonKey(name: 'weaknesses_tags') List<String> weaknessesTags,
      @JsonKey(name: 'score_history') List<Map<String, dynamic>> scoreHistory,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$LearnerInsightsImplCopyWithImpl<$Res>
    extends _$LearnerInsightsCopyWithImpl<$Res, _$LearnerInsightsImpl>
    implements _$$LearnerInsightsImplCopyWith<$Res> {
  __$$LearnerInsightsImplCopyWithImpl(
      _$LearnerInsightsImpl _value, $Res Function(_$LearnerInsightsImpl) _then)
      : super(_value, _then);

  /// Create a copy of LearnerInsights
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? overallScoreAvg = null,
    Object? scoreTrend = null,
    Object? currentLevel = null,
    Object? xpTotal = null,
    Object? currentStreakDays = null,
    Object? longestStreakDays = null,
    Object? totalSessions = null,
    Object? improvementLast30d = null,
    Object? mostImprovedDimension = freezed,
    Object? strengthsTags = null,
    Object? weaknessesTags = null,
    Object? scoreHistory = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$LearnerInsightsImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      overallScoreAvg: null == overallScoreAvg
          ? _value.overallScoreAvg
          : overallScoreAvg // ignore: cast_nullable_to_non_nullable
              as num,
      scoreTrend: null == scoreTrend
          ? _value.scoreTrend
          : scoreTrend // ignore: cast_nullable_to_non_nullable
              as ScoreTrend,
      currentLevel: null == currentLevel
          ? _value.currentLevel
          : currentLevel // ignore: cast_nullable_to_non_nullable
              as int,
      xpTotal: null == xpTotal
          ? _value.xpTotal
          : xpTotal // ignore: cast_nullable_to_non_nullable
              as int,
      currentStreakDays: null == currentStreakDays
          ? _value.currentStreakDays
          : currentStreakDays // ignore: cast_nullable_to_non_nullable
              as int,
      longestStreakDays: null == longestStreakDays
          ? _value.longestStreakDays
          : longestStreakDays // ignore: cast_nullable_to_non_nullable
              as int,
      totalSessions: null == totalSessions
          ? _value.totalSessions
          : totalSessions // ignore: cast_nullable_to_non_nullable
              as int,
      improvementLast30d: null == improvementLast30d
          ? _value.improvementLast30d
          : improvementLast30d // ignore: cast_nullable_to_non_nullable
              as num,
      mostImprovedDimension: freezed == mostImprovedDimension
          ? _value.mostImprovedDimension
          : mostImprovedDimension // ignore: cast_nullable_to_non_nullable
              as String?,
      strengthsTags: null == strengthsTags
          ? _value._strengthsTags
          : strengthsTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      weaknessesTags: null == weaknessesTags
          ? _value._weaknessesTags
          : weaknessesTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      scoreHistory: null == scoreHistory
          ? _value._scoreHistory
          : scoreHistory // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LearnerInsightsImpl implements _LearnerInsights {
  const _$LearnerInsightsImpl(
      {@JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'overall_score_avg') this.overallScoreAvg = 0,
      @JsonKey(name: 'score_trend') this.scoreTrend = ScoreTrend.stable,
      @JsonKey(name: 'current_level') this.currentLevel = 1,
      @JsonKey(name: 'xp_total') this.xpTotal = 0,
      @JsonKey(name: 'current_streak_days') this.currentStreakDays = 0,
      @JsonKey(name: 'longest_streak_days') this.longestStreakDays = 0,
      @JsonKey(name: 'total_sessions') this.totalSessions = 0,
      @JsonKey(name: 'improvement_last_30d') this.improvementLast30d = 0,
      @JsonKey(name: 'most_improved_dimension') this.mostImprovedDimension,
      @JsonKey(name: 'strengths_tags')
      final List<String> strengthsTags = const [],
      @JsonKey(name: 'weaknesses_tags')
      final List<String> weaknessesTags = const [],
      @JsonKey(name: 'score_history')
      final List<Map<String, dynamic>> scoreHistory = const [],
      @JsonKey(name: 'updated_at') this.updatedAt})
      : _strengthsTags = strengthsTags,
        _weaknessesTags = weaknessesTags,
        _scoreHistory = scoreHistory;

  factory _$LearnerInsightsImpl.fromJson(Map<String, dynamic> json) =>
      _$$LearnerInsightsImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'overall_score_avg')
  final num overallScoreAvg;
  @override
  @JsonKey(name: 'score_trend')
  final ScoreTrend scoreTrend;
  @override
  @JsonKey(name: 'current_level')
  final int currentLevel;
  @override
  @JsonKey(name: 'xp_total')
  final int xpTotal;
  @override
  @JsonKey(name: 'current_streak_days')
  final int currentStreakDays;
  @override
  @JsonKey(name: 'longest_streak_days')
  final int longestStreakDays;
  @override
  @JsonKey(name: 'total_sessions')
  final int totalSessions;
  @override
  @JsonKey(name: 'improvement_last_30d')
  final num improvementLast30d;
  @override
  @JsonKey(name: 'most_improved_dimension')
  final String? mostImprovedDimension;
  final List<String> _strengthsTags;
  @override
  @JsonKey(name: 'strengths_tags')
  List<String> get strengthsTags {
    if (_strengthsTags is EqualUnmodifiableListView) return _strengthsTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_strengthsTags);
  }

  final List<String> _weaknessesTags;
  @override
  @JsonKey(name: 'weaknesses_tags')
  List<String> get weaknessesTags {
    if (_weaknessesTags is EqualUnmodifiableListView) return _weaknessesTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weaknessesTags);
  }

  final List<Map<String, dynamic>> _scoreHistory;
  @override
  @JsonKey(name: 'score_history')
  List<Map<String, dynamic>> get scoreHistory {
    if (_scoreHistory is EqualUnmodifiableListView) return _scoreHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scoreHistory);
  }

  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'LearnerInsights(userId: $userId, overallScoreAvg: $overallScoreAvg, scoreTrend: $scoreTrend, currentLevel: $currentLevel, xpTotal: $xpTotal, currentStreakDays: $currentStreakDays, longestStreakDays: $longestStreakDays, totalSessions: $totalSessions, improvementLast30d: $improvementLast30d, mostImprovedDimension: $mostImprovedDimension, strengthsTags: $strengthsTags, weaknessesTags: $weaknessesTags, scoreHistory: $scoreHistory, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LearnerInsightsImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.overallScoreAvg, overallScoreAvg) ||
                other.overallScoreAvg == overallScoreAvg) &&
            (identical(other.scoreTrend, scoreTrend) ||
                other.scoreTrend == scoreTrend) &&
            (identical(other.currentLevel, currentLevel) ||
                other.currentLevel == currentLevel) &&
            (identical(other.xpTotal, xpTotal) || other.xpTotal == xpTotal) &&
            (identical(other.currentStreakDays, currentStreakDays) ||
                other.currentStreakDays == currentStreakDays) &&
            (identical(other.longestStreakDays, longestStreakDays) ||
                other.longestStreakDays == longestStreakDays) &&
            (identical(other.totalSessions, totalSessions) ||
                other.totalSessions == totalSessions) &&
            (identical(other.improvementLast30d, improvementLast30d) ||
                other.improvementLast30d == improvementLast30d) &&
            (identical(other.mostImprovedDimension, mostImprovedDimension) ||
                other.mostImprovedDimension == mostImprovedDimension) &&
            const DeepCollectionEquality()
                .equals(other._strengthsTags, _strengthsTags) &&
            const DeepCollectionEquality()
                .equals(other._weaknessesTags, _weaknessesTags) &&
            const DeepCollectionEquality()
                .equals(other._scoreHistory, _scoreHistory) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      overallScoreAvg,
      scoreTrend,
      currentLevel,
      xpTotal,
      currentStreakDays,
      longestStreakDays,
      totalSessions,
      improvementLast30d,
      mostImprovedDimension,
      const DeepCollectionEquality().hash(_strengthsTags),
      const DeepCollectionEquality().hash(_weaknessesTags),
      const DeepCollectionEquality().hash(_scoreHistory),
      updatedAt);

  /// Create a copy of LearnerInsights
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LearnerInsightsImplCopyWith<_$LearnerInsightsImpl> get copyWith =>
      __$$LearnerInsightsImplCopyWithImpl<_$LearnerInsightsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LearnerInsightsImplToJson(
      this,
    );
  }
}

abstract class _LearnerInsights implements LearnerInsights {
  const factory _LearnerInsights(
          {@JsonKey(name: 'user_id') required final String userId,
          @JsonKey(name: 'overall_score_avg') final num overallScoreAvg,
          @JsonKey(name: 'score_trend') final ScoreTrend scoreTrend,
          @JsonKey(name: 'current_level') final int currentLevel,
          @JsonKey(name: 'xp_total') final int xpTotal,
          @JsonKey(name: 'current_streak_days') final int currentStreakDays,
          @JsonKey(name: 'longest_streak_days') final int longestStreakDays,
          @JsonKey(name: 'total_sessions') final int totalSessions,
          @JsonKey(name: 'improvement_last_30d') final num improvementLast30d,
          @JsonKey(name: 'most_improved_dimension')
          final String? mostImprovedDimension,
          @JsonKey(name: 'strengths_tags') final List<String> strengthsTags,
          @JsonKey(name: 'weaknesses_tags') final List<String> weaknessesTags,
          @JsonKey(name: 'score_history')
          final List<Map<String, dynamic>> scoreHistory,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt}) =
      _$LearnerInsightsImpl;

  factory _LearnerInsights.fromJson(Map<String, dynamic> json) =
      _$LearnerInsightsImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'overall_score_avg')
  num get overallScoreAvg;
  @override
  @JsonKey(name: 'score_trend')
  ScoreTrend get scoreTrend;
  @override
  @JsonKey(name: 'current_level')
  int get currentLevel;
  @override
  @JsonKey(name: 'xp_total')
  int get xpTotal;
  @override
  @JsonKey(name: 'current_streak_days')
  int get currentStreakDays;
  @override
  @JsonKey(name: 'longest_streak_days')
  int get longestStreakDays;
  @override
  @JsonKey(name: 'total_sessions')
  int get totalSessions;
  @override
  @JsonKey(name: 'improvement_last_30d')
  num get improvementLast30d;
  @override
  @JsonKey(name: 'most_improved_dimension')
  String? get mostImprovedDimension;
  @override
  @JsonKey(name: 'strengths_tags')
  List<String> get strengthsTags;
  @override
  @JsonKey(name: 'weaknesses_tags')
  List<String> get weaknessesTags;
  @override
  @JsonKey(name: 'score_history')
  List<Map<String, dynamic>> get scoreHistory;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of LearnerInsights
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LearnerInsightsImplCopyWith<_$LearnerInsightsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
