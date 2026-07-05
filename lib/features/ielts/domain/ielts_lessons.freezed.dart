// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ielts_lessons.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IeltsLesson _$IeltsLessonFromJson(Map<String, dynamic> json) {
  return _IeltsLesson.fromJson(json);
}

/// @nodoc
mixin _$IeltsLesson {
  String get id => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get unit => throw _privateConstructorUsedError;
  String get unitTitle => throw _privateConstructorUsedError;
  IeltsPart get part => throw _privateConstructorUsedError;
  int get estimatedMinutes => throw _privateConstructorUsedError;
  List<String> get skillTags => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get learningObjective => throw _privateConstructorUsedError;
  List<IeltsBlock> get blocks => throw _privateConstructorUsedError;
  List<String> get scoringFocus => throw _privateConstructorUsedError;
  int get unlockOrder => throw _privateConstructorUsedError;
  int get xpReward => throw _privateConstructorUsedError;

  /// Serializes this IeltsLesson to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IeltsLesson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IeltsLessonCopyWith<IeltsLesson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IeltsLessonCopyWith<$Res> {
  factory $IeltsLessonCopyWith(
          IeltsLesson value, $Res Function(IeltsLesson) then) =
      _$IeltsLessonCopyWithImpl<$Res, IeltsLesson>;
  @useResult
  $Res call(
      {String id,
      String slug,
      String title,
      int unit,
      String unitTitle,
      IeltsPart part,
      int estimatedMinutes,
      List<String> skillTags,
      String description,
      String learningObjective,
      List<IeltsBlock> blocks,
      List<String> scoringFocus,
      int unlockOrder,
      int xpReward});
}

/// @nodoc
class _$IeltsLessonCopyWithImpl<$Res, $Val extends IeltsLesson>
    implements $IeltsLessonCopyWith<$Res> {
  _$IeltsLessonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IeltsLesson
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? slug = null,
    Object? title = null,
    Object? unit = null,
    Object? unitTitle = null,
    Object? part = null,
    Object? estimatedMinutes = null,
    Object? skillTags = null,
    Object? description = null,
    Object? learningObjective = null,
    Object? blocks = null,
    Object? scoringFocus = null,
    Object? unlockOrder = null,
    Object? xpReward = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as int,
      unitTitle: null == unitTitle
          ? _value.unitTitle
          : unitTitle // ignore: cast_nullable_to_non_nullable
              as String,
      part: null == part
          ? _value.part
          : part // ignore: cast_nullable_to_non_nullable
              as IeltsPart,
      estimatedMinutes: null == estimatedMinutes
          ? _value.estimatedMinutes
          : estimatedMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      skillTags: null == skillTags
          ? _value.skillTags
          : skillTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      learningObjective: null == learningObjective
          ? _value.learningObjective
          : learningObjective // ignore: cast_nullable_to_non_nullable
              as String,
      blocks: null == blocks
          ? _value.blocks
          : blocks // ignore: cast_nullable_to_non_nullable
              as List<IeltsBlock>,
      scoringFocus: null == scoringFocus
          ? _value.scoringFocus
          : scoringFocus // ignore: cast_nullable_to_non_nullable
              as List<String>,
      unlockOrder: null == unlockOrder
          ? _value.unlockOrder
          : unlockOrder // ignore: cast_nullable_to_non_nullable
              as int,
      xpReward: null == xpReward
          ? _value.xpReward
          : xpReward // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IeltsLessonImplCopyWith<$Res>
    implements $IeltsLessonCopyWith<$Res> {
  factory _$$IeltsLessonImplCopyWith(
          _$IeltsLessonImpl value, $Res Function(_$IeltsLessonImpl) then) =
      __$$IeltsLessonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String slug,
      String title,
      int unit,
      String unitTitle,
      IeltsPart part,
      int estimatedMinutes,
      List<String> skillTags,
      String description,
      String learningObjective,
      List<IeltsBlock> blocks,
      List<String> scoringFocus,
      int unlockOrder,
      int xpReward});
}

/// @nodoc
class __$$IeltsLessonImplCopyWithImpl<$Res>
    extends _$IeltsLessonCopyWithImpl<$Res, _$IeltsLessonImpl>
    implements _$$IeltsLessonImplCopyWith<$Res> {
  __$$IeltsLessonImplCopyWithImpl(
      _$IeltsLessonImpl _value, $Res Function(_$IeltsLessonImpl) _then)
      : super(_value, _then);

  /// Create a copy of IeltsLesson
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? slug = null,
    Object? title = null,
    Object? unit = null,
    Object? unitTitle = null,
    Object? part = null,
    Object? estimatedMinutes = null,
    Object? skillTags = null,
    Object? description = null,
    Object? learningObjective = null,
    Object? blocks = null,
    Object? scoringFocus = null,
    Object? unlockOrder = null,
    Object? xpReward = null,
  }) {
    return _then(_$IeltsLessonImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as int,
      unitTitle: null == unitTitle
          ? _value.unitTitle
          : unitTitle // ignore: cast_nullable_to_non_nullable
              as String,
      part: null == part
          ? _value.part
          : part // ignore: cast_nullable_to_non_nullable
              as IeltsPart,
      estimatedMinutes: null == estimatedMinutes
          ? _value.estimatedMinutes
          : estimatedMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      skillTags: null == skillTags
          ? _value._skillTags
          : skillTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      learningObjective: null == learningObjective
          ? _value.learningObjective
          : learningObjective // ignore: cast_nullable_to_non_nullable
              as String,
      blocks: null == blocks
          ? _value._blocks
          : blocks // ignore: cast_nullable_to_non_nullable
              as List<IeltsBlock>,
      scoringFocus: null == scoringFocus
          ? _value._scoringFocus
          : scoringFocus // ignore: cast_nullable_to_non_nullable
              as List<String>,
      unlockOrder: null == unlockOrder
          ? _value.unlockOrder
          : unlockOrder // ignore: cast_nullable_to_non_nullable
              as int,
      xpReward: null == xpReward
          ? _value.xpReward
          : xpReward // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IeltsLessonImpl implements _IeltsLesson {
  const _$IeltsLessonImpl(
      {required this.id,
      required this.slug,
      required this.title,
      required this.unit,
      required this.unitTitle,
      required this.part,
      required this.estimatedMinutes,
      required final List<String> skillTags,
      required this.description,
      required this.learningObjective,
      required final List<IeltsBlock> blocks,
      required final List<String> scoringFocus,
      required this.unlockOrder,
      required this.xpReward})
      : _skillTags = skillTags,
        _blocks = blocks,
        _scoringFocus = scoringFocus;

  factory _$IeltsLessonImpl.fromJson(Map<String, dynamic> json) =>
      _$$IeltsLessonImplFromJson(json);

  @override
  final String id;
  @override
  final String slug;
  @override
  final String title;
  @override
  final int unit;
  @override
  final String unitTitle;
  @override
  final IeltsPart part;
  @override
  final int estimatedMinutes;
  final List<String> _skillTags;
  @override
  List<String> get skillTags {
    if (_skillTags is EqualUnmodifiableListView) return _skillTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skillTags);
  }

  @override
  final String description;
  @override
  final String learningObjective;
  final List<IeltsBlock> _blocks;
  @override
  List<IeltsBlock> get blocks {
    if (_blocks is EqualUnmodifiableListView) return _blocks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_blocks);
  }

  final List<String> _scoringFocus;
  @override
  List<String> get scoringFocus {
    if (_scoringFocus is EqualUnmodifiableListView) return _scoringFocus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scoringFocus);
  }

  @override
  final int unlockOrder;
  @override
  final int xpReward;

  @override
  String toString() {
    return 'IeltsLesson(id: $id, slug: $slug, title: $title, unit: $unit, unitTitle: $unitTitle, part: $part, estimatedMinutes: $estimatedMinutes, skillTags: $skillTags, description: $description, learningObjective: $learningObjective, blocks: $blocks, scoringFocus: $scoringFocus, unlockOrder: $unlockOrder, xpReward: $xpReward)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IeltsLessonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.unitTitle, unitTitle) ||
                other.unitTitle == unitTitle) &&
            (identical(other.part, part) || other.part == part) &&
            (identical(other.estimatedMinutes, estimatedMinutes) ||
                other.estimatedMinutes == estimatedMinutes) &&
            const DeepCollectionEquality()
                .equals(other._skillTags, _skillTags) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.learningObjective, learningObjective) ||
                other.learningObjective == learningObjective) &&
            const DeepCollectionEquality().equals(other._blocks, _blocks) &&
            const DeepCollectionEquality()
                .equals(other._scoringFocus, _scoringFocus) &&
            (identical(other.unlockOrder, unlockOrder) ||
                other.unlockOrder == unlockOrder) &&
            (identical(other.xpReward, xpReward) ||
                other.xpReward == xpReward));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      slug,
      title,
      unit,
      unitTitle,
      part,
      estimatedMinutes,
      const DeepCollectionEquality().hash(_skillTags),
      description,
      learningObjective,
      const DeepCollectionEquality().hash(_blocks),
      const DeepCollectionEquality().hash(_scoringFocus),
      unlockOrder,
      xpReward);

  /// Create a copy of IeltsLesson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IeltsLessonImplCopyWith<_$IeltsLessonImpl> get copyWith =>
      __$$IeltsLessonImplCopyWithImpl<_$IeltsLessonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IeltsLessonImplToJson(
      this,
    );
  }
}

abstract class _IeltsLesson implements IeltsLesson {
  const factory _IeltsLesson(
      {required final String id,
      required final String slug,
      required final String title,
      required final int unit,
      required final String unitTitle,
      required final IeltsPart part,
      required final int estimatedMinutes,
      required final List<String> skillTags,
      required final String description,
      required final String learningObjective,
      required final List<IeltsBlock> blocks,
      required final List<String> scoringFocus,
      required final int unlockOrder,
      required final int xpReward}) = _$IeltsLessonImpl;

  factory _IeltsLesson.fromJson(Map<String, dynamic> json) =
      _$IeltsLessonImpl.fromJson;

  @override
  String get id;
  @override
  String get slug;
  @override
  String get title;
  @override
  int get unit;
  @override
  String get unitTitle;
  @override
  IeltsPart get part;
  @override
  int get estimatedMinutes;
  @override
  List<String> get skillTags;
  @override
  String get description;
  @override
  String get learningObjective;
  @override
  List<IeltsBlock> get blocks;
  @override
  List<String> get scoringFocus;
  @override
  int get unlockOrder;
  @override
  int get xpReward;

  /// Create a copy of IeltsLesson
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IeltsLessonImplCopyWith<_$IeltsLessonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
