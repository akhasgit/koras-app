// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listening_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ListeningQuestionOption _$ListeningQuestionOptionFromJson(
    Map<String, dynamic> json) {
  return _ListeningQuestionOption.fromJson(json);
}

/// @nodoc
mixin _$ListeningQuestionOption {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  /// Serializes this ListeningQuestionOption to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ListeningQuestionOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListeningQuestionOptionCopyWith<ListeningQuestionOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListeningQuestionOptionCopyWith<$Res> {
  factory $ListeningQuestionOptionCopyWith(ListeningQuestionOption value,
          $Res Function(ListeningQuestionOption) then) =
      _$ListeningQuestionOptionCopyWithImpl<$Res, ListeningQuestionOption>;
  @useResult
  $Res call({String id, String text});
}

/// @nodoc
class _$ListeningQuestionOptionCopyWithImpl<$Res,
        $Val extends ListeningQuestionOption>
    implements $ListeningQuestionOptionCopyWith<$Res> {
  _$ListeningQuestionOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListeningQuestionOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListeningQuestionOptionImplCopyWith<$Res>
    implements $ListeningQuestionOptionCopyWith<$Res> {
  factory _$$ListeningQuestionOptionImplCopyWith(
          _$ListeningQuestionOptionImpl value,
          $Res Function(_$ListeningQuestionOptionImpl) then) =
      __$$ListeningQuestionOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String text});
}

/// @nodoc
class __$$ListeningQuestionOptionImplCopyWithImpl<$Res>
    extends _$ListeningQuestionOptionCopyWithImpl<$Res,
        _$ListeningQuestionOptionImpl>
    implements _$$ListeningQuestionOptionImplCopyWith<$Res> {
  __$$ListeningQuestionOptionImplCopyWithImpl(
      _$ListeningQuestionOptionImpl _value,
      $Res Function(_$ListeningQuestionOptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListeningQuestionOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
  }) {
    return _then(_$ListeningQuestionOptionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListeningQuestionOptionImpl implements _ListeningQuestionOption {
  const _$ListeningQuestionOptionImpl({required this.id, required this.text});

  factory _$ListeningQuestionOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListeningQuestionOptionImplFromJson(json);

  @override
  final String id;
  @override
  final String text;

  @override
  String toString() {
    return 'ListeningQuestionOption(id: $id, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListeningQuestionOptionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, text);

  /// Create a copy of ListeningQuestionOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListeningQuestionOptionImplCopyWith<_$ListeningQuestionOptionImpl>
      get copyWith => __$$ListeningQuestionOptionImplCopyWithImpl<
          _$ListeningQuestionOptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListeningQuestionOptionImplToJson(
      this,
    );
  }
}

abstract class _ListeningQuestionOption implements ListeningQuestionOption {
  const factory _ListeningQuestionOption(
      {required final String id,
      required final String text}) = _$ListeningQuestionOptionImpl;

  factory _ListeningQuestionOption.fromJson(Map<String, dynamic> json) =
      _$ListeningQuestionOptionImpl.fromJson;

  @override
  String get id;
  @override
  String get text;

  /// Create a copy of ListeningQuestionOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListeningQuestionOptionImplCopyWith<_$ListeningQuestionOptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ListeningQuestion _$ListeningQuestionFromJson(Map<String, dynamic> json) {
  return _ListeningQuestion.fromJson(json);
}

/// @nodoc
mixin _$ListeningQuestion {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get prompt => throw _privateConstructorUsedError;
  @JsonKey(name: 'targetSkill')
  String? get targetSkill => throw _privateConstructorUsedError;
  @JsonKey(name: 'segmentIndex')
  int? get segmentIndex => throw _privateConstructorUsedError;
  List<ListeningQuestionOption>? get options =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'correctOptionId')
  String? get correctOptionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'expectedPoints')
  List<String>? get expectedPoints => throw _privateConstructorUsedError;
  @JsonKey(name: 'sampleStrongAnswer')
  String? get sampleStrongAnswer => throw _privateConstructorUsedError;

  /// Serializes this ListeningQuestion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ListeningQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListeningQuestionCopyWith<ListeningQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListeningQuestionCopyWith<$Res> {
  factory $ListeningQuestionCopyWith(
          ListeningQuestion value, $Res Function(ListeningQuestion) then) =
      _$ListeningQuestionCopyWithImpl<$Res, ListeningQuestion>;
  @useResult
  $Res call(
      {String id,
      String type,
      String prompt,
      @JsonKey(name: 'targetSkill') String? targetSkill,
      @JsonKey(name: 'segmentIndex') int? segmentIndex,
      List<ListeningQuestionOption>? options,
      @JsonKey(name: 'correctOptionId') String? correctOptionId,
      @JsonKey(name: 'expectedPoints') List<String>? expectedPoints,
      @JsonKey(name: 'sampleStrongAnswer') String? sampleStrongAnswer});
}

/// @nodoc
class _$ListeningQuestionCopyWithImpl<$Res, $Val extends ListeningQuestion>
    implements $ListeningQuestionCopyWith<$Res> {
  _$ListeningQuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListeningQuestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? prompt = null,
    Object? targetSkill = freezed,
    Object? segmentIndex = freezed,
    Object? options = freezed,
    Object? correctOptionId = freezed,
    Object? expectedPoints = freezed,
    Object? sampleStrongAnswer = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
      targetSkill: freezed == targetSkill
          ? _value.targetSkill
          : targetSkill // ignore: cast_nullable_to_non_nullable
              as String?,
      segmentIndex: freezed == segmentIndex
          ? _value.segmentIndex
          : segmentIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<ListeningQuestionOption>?,
      correctOptionId: freezed == correctOptionId
          ? _value.correctOptionId
          : correctOptionId // ignore: cast_nullable_to_non_nullable
              as String?,
      expectedPoints: freezed == expectedPoints
          ? _value.expectedPoints
          : expectedPoints // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      sampleStrongAnswer: freezed == sampleStrongAnswer
          ? _value.sampleStrongAnswer
          : sampleStrongAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListeningQuestionImplCopyWith<$Res>
    implements $ListeningQuestionCopyWith<$Res> {
  factory _$$ListeningQuestionImplCopyWith(_$ListeningQuestionImpl value,
          $Res Function(_$ListeningQuestionImpl) then) =
      __$$ListeningQuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String type,
      String prompt,
      @JsonKey(name: 'targetSkill') String? targetSkill,
      @JsonKey(name: 'segmentIndex') int? segmentIndex,
      List<ListeningQuestionOption>? options,
      @JsonKey(name: 'correctOptionId') String? correctOptionId,
      @JsonKey(name: 'expectedPoints') List<String>? expectedPoints,
      @JsonKey(name: 'sampleStrongAnswer') String? sampleStrongAnswer});
}

/// @nodoc
class __$$ListeningQuestionImplCopyWithImpl<$Res>
    extends _$ListeningQuestionCopyWithImpl<$Res, _$ListeningQuestionImpl>
    implements _$$ListeningQuestionImplCopyWith<$Res> {
  __$$ListeningQuestionImplCopyWithImpl(_$ListeningQuestionImpl _value,
      $Res Function(_$ListeningQuestionImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListeningQuestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? prompt = null,
    Object? targetSkill = freezed,
    Object? segmentIndex = freezed,
    Object? options = freezed,
    Object? correctOptionId = freezed,
    Object? expectedPoints = freezed,
    Object? sampleStrongAnswer = freezed,
  }) {
    return _then(_$ListeningQuestionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
      targetSkill: freezed == targetSkill
          ? _value.targetSkill
          : targetSkill // ignore: cast_nullable_to_non_nullable
              as String?,
      segmentIndex: freezed == segmentIndex
          ? _value.segmentIndex
          : segmentIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      options: freezed == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<ListeningQuestionOption>?,
      correctOptionId: freezed == correctOptionId
          ? _value.correctOptionId
          : correctOptionId // ignore: cast_nullable_to_non_nullable
              as String?,
      expectedPoints: freezed == expectedPoints
          ? _value._expectedPoints
          : expectedPoints // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      sampleStrongAnswer: freezed == sampleStrongAnswer
          ? _value.sampleStrongAnswer
          : sampleStrongAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListeningQuestionImpl implements _ListeningQuestion {
  const _$ListeningQuestionImpl(
      {required this.id,
      required this.type,
      required this.prompt,
      @JsonKey(name: 'targetSkill') this.targetSkill,
      @JsonKey(name: 'segmentIndex') this.segmentIndex,
      final List<ListeningQuestionOption>? options,
      @JsonKey(name: 'correctOptionId') this.correctOptionId,
      @JsonKey(name: 'expectedPoints') final List<String>? expectedPoints,
      @JsonKey(name: 'sampleStrongAnswer') this.sampleStrongAnswer})
      : _options = options,
        _expectedPoints = expectedPoints;

  factory _$ListeningQuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListeningQuestionImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final String prompt;
  @override
  @JsonKey(name: 'targetSkill')
  final String? targetSkill;
  @override
  @JsonKey(name: 'segmentIndex')
  final int? segmentIndex;
  final List<ListeningQuestionOption>? _options;
  @override
  List<ListeningQuestionOption>? get options {
    final value = _options;
    if (value == null) return null;
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'correctOptionId')
  final String? correctOptionId;
  final List<String>? _expectedPoints;
  @override
  @JsonKey(name: 'expectedPoints')
  List<String>? get expectedPoints {
    final value = _expectedPoints;
    if (value == null) return null;
    if (_expectedPoints is EqualUnmodifiableListView) return _expectedPoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'sampleStrongAnswer')
  final String? sampleStrongAnswer;

  @override
  String toString() {
    return 'ListeningQuestion(id: $id, type: $type, prompt: $prompt, targetSkill: $targetSkill, segmentIndex: $segmentIndex, options: $options, correctOptionId: $correctOptionId, expectedPoints: $expectedPoints, sampleStrongAnswer: $sampleStrongAnswer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListeningQuestionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.prompt, prompt) || other.prompt == prompt) &&
            (identical(other.targetSkill, targetSkill) ||
                other.targetSkill == targetSkill) &&
            (identical(other.segmentIndex, segmentIndex) ||
                other.segmentIndex == segmentIndex) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.correctOptionId, correctOptionId) ||
                other.correctOptionId == correctOptionId) &&
            const DeepCollectionEquality()
                .equals(other._expectedPoints, _expectedPoints) &&
            (identical(other.sampleStrongAnswer, sampleStrongAnswer) ||
                other.sampleStrongAnswer == sampleStrongAnswer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      prompt,
      targetSkill,
      segmentIndex,
      const DeepCollectionEquality().hash(_options),
      correctOptionId,
      const DeepCollectionEquality().hash(_expectedPoints),
      sampleStrongAnswer);

  /// Create a copy of ListeningQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListeningQuestionImplCopyWith<_$ListeningQuestionImpl> get copyWith =>
      __$$ListeningQuestionImplCopyWithImpl<_$ListeningQuestionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListeningQuestionImplToJson(
      this,
    );
  }
}

abstract class _ListeningQuestion implements ListeningQuestion {
  const factory _ListeningQuestion(
      {required final String id,
      required final String type,
      required final String prompt,
      @JsonKey(name: 'targetSkill') final String? targetSkill,
      @JsonKey(name: 'segmentIndex') final int? segmentIndex,
      final List<ListeningQuestionOption>? options,
      @JsonKey(name: 'correctOptionId') final String? correctOptionId,
      @JsonKey(name: 'expectedPoints') final List<String>? expectedPoints,
      @JsonKey(name: 'sampleStrongAnswer')
      final String? sampleStrongAnswer}) = _$ListeningQuestionImpl;

  factory _ListeningQuestion.fromJson(Map<String, dynamic> json) =
      _$ListeningQuestionImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  String get prompt;
  @override
  @JsonKey(name: 'targetSkill')
  String? get targetSkill;
  @override
  @JsonKey(name: 'segmentIndex')
  int? get segmentIndex;
  @override
  List<ListeningQuestionOption>? get options;
  @override
  @JsonKey(name: 'correctOptionId')
  String? get correctOptionId;
  @override
  @JsonKey(name: 'expectedPoints')
  List<String>? get expectedPoints;
  @override
  @JsonKey(name: 'sampleStrongAnswer')
  String? get sampleStrongAnswer;

  /// Create a copy of ListeningQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListeningQuestionImplCopyWith<_$ListeningQuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ListeningSegment _$ListeningSegmentFromJson(Map<String, dynamic> json) {
  return _ListeningSegment.fromJson(json);
}

/// @nodoc
mixin _$ListeningSegment {
  int get index => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  @JsonKey(name: 'maxReplays')
  int? get maxReplays => throw _privateConstructorUsedError;

  /// Serializes this ListeningSegment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ListeningSegment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListeningSegmentCopyWith<ListeningSegment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListeningSegmentCopyWith<$Res> {
  factory $ListeningSegmentCopyWith(
          ListeningSegment value, $Res Function(ListeningSegment) then) =
      _$ListeningSegmentCopyWithImpl<$Res, ListeningSegment>;
  @useResult
  $Res call(
      {int index, String text, @JsonKey(name: 'maxReplays') int? maxReplays});
}

/// @nodoc
class _$ListeningSegmentCopyWithImpl<$Res, $Val extends ListeningSegment>
    implements $ListeningSegmentCopyWith<$Res> {
  _$ListeningSegmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListeningSegment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? text = null,
    Object? maxReplays = freezed,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      maxReplays: freezed == maxReplays
          ? _value.maxReplays
          : maxReplays // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListeningSegmentImplCopyWith<$Res>
    implements $ListeningSegmentCopyWith<$Res> {
  factory _$$ListeningSegmentImplCopyWith(_$ListeningSegmentImpl value,
          $Res Function(_$ListeningSegmentImpl) then) =
      __$$ListeningSegmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int index, String text, @JsonKey(name: 'maxReplays') int? maxReplays});
}

/// @nodoc
class __$$ListeningSegmentImplCopyWithImpl<$Res>
    extends _$ListeningSegmentCopyWithImpl<$Res, _$ListeningSegmentImpl>
    implements _$$ListeningSegmentImplCopyWith<$Res> {
  __$$ListeningSegmentImplCopyWithImpl(_$ListeningSegmentImpl _value,
      $Res Function(_$ListeningSegmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListeningSegment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? text = null,
    Object? maxReplays = freezed,
  }) {
    return _then(_$ListeningSegmentImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      maxReplays: freezed == maxReplays
          ? _value.maxReplays
          : maxReplays // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListeningSegmentImpl implements _ListeningSegment {
  const _$ListeningSegmentImpl(
      {required this.index,
      required this.text,
      @JsonKey(name: 'maxReplays') this.maxReplays});

  factory _$ListeningSegmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListeningSegmentImplFromJson(json);

  @override
  final int index;
  @override
  final String text;
  @override
  @JsonKey(name: 'maxReplays')
  final int? maxReplays;

  @override
  String toString() {
    return 'ListeningSegment(index: $index, text: $text, maxReplays: $maxReplays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListeningSegmentImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.maxReplays, maxReplays) ||
                other.maxReplays == maxReplays));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, index, text, maxReplays);

  /// Create a copy of ListeningSegment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListeningSegmentImplCopyWith<_$ListeningSegmentImpl> get copyWith =>
      __$$ListeningSegmentImplCopyWithImpl<_$ListeningSegmentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListeningSegmentImplToJson(
      this,
    );
  }
}

abstract class _ListeningSegment implements ListeningSegment {
  const factory _ListeningSegment(
          {required final int index,
          required final String text,
          @JsonKey(name: 'maxReplays') final int? maxReplays}) =
      _$ListeningSegmentImpl;

  factory _ListeningSegment.fromJson(Map<String, dynamic> json) =
      _$ListeningSegmentImpl.fromJson;

  @override
  int get index;
  @override
  String get text;
  @override
  @JsonKey(name: 'maxReplays')
  int? get maxReplays;

  /// Create a copy of ListeningSegment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListeningSegmentImplCopyWith<_$ListeningSegmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ListeningPassage _$ListeningPassageFromJson(Map<String, dynamic> json) {
  return _ListeningPassage.fromJson(json);
}

/// @nodoc
mixin _$ListeningPassage {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get topic => throw _privateConstructorUsedError;
  int get difficulty => throw _privateConstructorUsedError;
  @JsonKey(name: 'deliveryMode')
  String? get deliveryMode => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  String? get voice => throw _privateConstructorUsedError;
  @JsonKey(name: 'estimatedMinutes')
  num? get estimatedMinutes => throw _privateConstructorUsedError;
  @JsonKey(name: 'fullText')
  String? get fullText => throw _privateConstructorUsedError;
  @JsonKey(name: 'maxReplays')
  int? get maxReplays => throw _privateConstructorUsedError;
  List<ListeningSegment>? get segments => throw _privateConstructorUsedError;
  List<ListeningQuestion> get questions => throw _privateConstructorUsedError;

  /// Serializes this ListeningPassage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ListeningPassage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListeningPassageCopyWith<ListeningPassage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListeningPassageCopyWith<$Res> {
  factory $ListeningPassageCopyWith(
          ListeningPassage value, $Res Function(ListeningPassage) then) =
      _$ListeningPassageCopyWithImpl<$Res, ListeningPassage>;
  @useResult
  $Res call(
      {String id,
      String title,
      String? topic,
      int difficulty,
      @JsonKey(name: 'deliveryMode') String? deliveryMode,
      String? language,
      String? voice,
      @JsonKey(name: 'estimatedMinutes') num? estimatedMinutes,
      @JsonKey(name: 'fullText') String? fullText,
      @JsonKey(name: 'maxReplays') int? maxReplays,
      List<ListeningSegment>? segments,
      List<ListeningQuestion> questions});
}

/// @nodoc
class _$ListeningPassageCopyWithImpl<$Res, $Val extends ListeningPassage>
    implements $ListeningPassageCopyWith<$Res> {
  _$ListeningPassageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListeningPassage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? topic = freezed,
    Object? difficulty = null,
    Object? deliveryMode = freezed,
    Object? language = freezed,
    Object? voice = freezed,
    Object? estimatedMinutes = freezed,
    Object? fullText = freezed,
    Object? maxReplays = freezed,
    Object? segments = freezed,
    Object? questions = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      topic: freezed == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String?,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryMode: freezed == deliveryMode
          ? _value.deliveryMode
          : deliveryMode // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      voice: freezed == voice
          ? _value.voice
          : voice // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedMinutes: freezed == estimatedMinutes
          ? _value.estimatedMinutes
          : estimatedMinutes // ignore: cast_nullable_to_non_nullable
              as num?,
      fullText: freezed == fullText
          ? _value.fullText
          : fullText // ignore: cast_nullable_to_non_nullable
              as String?,
      maxReplays: freezed == maxReplays
          ? _value.maxReplays
          : maxReplays // ignore: cast_nullable_to_non_nullable
              as int?,
      segments: freezed == segments
          ? _value.segments
          : segments // ignore: cast_nullable_to_non_nullable
              as List<ListeningSegment>?,
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<ListeningQuestion>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListeningPassageImplCopyWith<$Res>
    implements $ListeningPassageCopyWith<$Res> {
  factory _$$ListeningPassageImplCopyWith(_$ListeningPassageImpl value,
          $Res Function(_$ListeningPassageImpl) then) =
      __$$ListeningPassageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String? topic,
      int difficulty,
      @JsonKey(name: 'deliveryMode') String? deliveryMode,
      String? language,
      String? voice,
      @JsonKey(name: 'estimatedMinutes') num? estimatedMinutes,
      @JsonKey(name: 'fullText') String? fullText,
      @JsonKey(name: 'maxReplays') int? maxReplays,
      List<ListeningSegment>? segments,
      List<ListeningQuestion> questions});
}

/// @nodoc
class __$$ListeningPassageImplCopyWithImpl<$Res>
    extends _$ListeningPassageCopyWithImpl<$Res, _$ListeningPassageImpl>
    implements _$$ListeningPassageImplCopyWith<$Res> {
  __$$ListeningPassageImplCopyWithImpl(_$ListeningPassageImpl _value,
      $Res Function(_$ListeningPassageImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListeningPassage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? topic = freezed,
    Object? difficulty = null,
    Object? deliveryMode = freezed,
    Object? language = freezed,
    Object? voice = freezed,
    Object? estimatedMinutes = freezed,
    Object? fullText = freezed,
    Object? maxReplays = freezed,
    Object? segments = freezed,
    Object? questions = null,
  }) {
    return _then(_$ListeningPassageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      topic: freezed == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String?,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryMode: freezed == deliveryMode
          ? _value.deliveryMode
          : deliveryMode // ignore: cast_nullable_to_non_nullable
              as String?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      voice: freezed == voice
          ? _value.voice
          : voice // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedMinutes: freezed == estimatedMinutes
          ? _value.estimatedMinutes
          : estimatedMinutes // ignore: cast_nullable_to_non_nullable
              as num?,
      fullText: freezed == fullText
          ? _value.fullText
          : fullText // ignore: cast_nullable_to_non_nullable
              as String?,
      maxReplays: freezed == maxReplays
          ? _value.maxReplays
          : maxReplays // ignore: cast_nullable_to_non_nullable
              as int?,
      segments: freezed == segments
          ? _value._segments
          : segments // ignore: cast_nullable_to_non_nullable
              as List<ListeningSegment>?,
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<ListeningQuestion>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListeningPassageImpl implements _ListeningPassage {
  const _$ListeningPassageImpl(
      {required this.id,
      required this.title,
      this.topic,
      required this.difficulty,
      @JsonKey(name: 'deliveryMode') this.deliveryMode,
      this.language,
      this.voice,
      @JsonKey(name: 'estimatedMinutes') this.estimatedMinutes,
      @JsonKey(name: 'fullText') this.fullText,
      @JsonKey(name: 'maxReplays') this.maxReplays,
      final List<ListeningSegment>? segments,
      final List<ListeningQuestion> questions = const []})
      : _segments = segments,
        _questions = questions;

  factory _$ListeningPassageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListeningPassageImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String? topic;
  @override
  final int difficulty;
  @override
  @JsonKey(name: 'deliveryMode')
  final String? deliveryMode;
  @override
  final String? language;
  @override
  final String? voice;
  @override
  @JsonKey(name: 'estimatedMinutes')
  final num? estimatedMinutes;
  @override
  @JsonKey(name: 'fullText')
  final String? fullText;
  @override
  @JsonKey(name: 'maxReplays')
  final int? maxReplays;
  final List<ListeningSegment>? _segments;
  @override
  List<ListeningSegment>? get segments {
    final value = _segments;
    if (value == null) return null;
    if (_segments is EqualUnmodifiableListView) return _segments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ListeningQuestion> _questions;
  @override
  @JsonKey()
  List<ListeningQuestion> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  String toString() {
    return 'ListeningPassage(id: $id, title: $title, topic: $topic, difficulty: $difficulty, deliveryMode: $deliveryMode, language: $language, voice: $voice, estimatedMinutes: $estimatedMinutes, fullText: $fullText, maxReplays: $maxReplays, segments: $segments, questions: $questions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListeningPassageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.deliveryMode, deliveryMode) ||
                other.deliveryMode == deliveryMode) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.voice, voice) || other.voice == voice) &&
            (identical(other.estimatedMinutes, estimatedMinutes) ||
                other.estimatedMinutes == estimatedMinutes) &&
            (identical(other.fullText, fullText) ||
                other.fullText == fullText) &&
            (identical(other.maxReplays, maxReplays) ||
                other.maxReplays == maxReplays) &&
            const DeepCollectionEquality().equals(other._segments, _segments) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      topic,
      difficulty,
      deliveryMode,
      language,
      voice,
      estimatedMinutes,
      fullText,
      maxReplays,
      const DeepCollectionEquality().hash(_segments),
      const DeepCollectionEquality().hash(_questions));

  /// Create a copy of ListeningPassage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListeningPassageImplCopyWith<_$ListeningPassageImpl> get copyWith =>
      __$$ListeningPassageImplCopyWithImpl<_$ListeningPassageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListeningPassageImplToJson(
      this,
    );
  }
}

abstract class _ListeningPassage implements ListeningPassage {
  const factory _ListeningPassage(
      {required final String id,
      required final String title,
      final String? topic,
      required final int difficulty,
      @JsonKey(name: 'deliveryMode') final String? deliveryMode,
      final String? language,
      final String? voice,
      @JsonKey(name: 'estimatedMinutes') final num? estimatedMinutes,
      @JsonKey(name: 'fullText') final String? fullText,
      @JsonKey(name: 'maxReplays') final int? maxReplays,
      final List<ListeningSegment>? segments,
      final List<ListeningQuestion> questions}) = _$ListeningPassageImpl;

  factory _ListeningPassage.fromJson(Map<String, dynamic> json) =
      _$ListeningPassageImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get topic;
  @override
  int get difficulty;
  @override
  @JsonKey(name: 'deliveryMode')
  String? get deliveryMode;
  @override
  String? get language;
  @override
  String? get voice;
  @override
  @JsonKey(name: 'estimatedMinutes')
  num? get estimatedMinutes;
  @override
  @JsonKey(name: 'fullText')
  String? get fullText;
  @override
  @JsonKey(name: 'maxReplays')
  int? get maxReplays;
  @override
  List<ListeningSegment>? get segments;
  @override
  List<ListeningQuestion> get questions;

  /// Create a copy of ListeningPassage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListeningPassageImplCopyWith<_$ListeningPassageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ListeningPassageProgress _$ListeningPassageProgressFromJson(
    Map<String, dynamic> json) {
  return _ListeningPassageProgress.fromJson(json);
}

/// @nodoc
mixin _$ListeningPassageProgress {
  @JsonKey(name: 'passage_id')
  String? get passageId => throw _privateConstructorUsedError;
  int get attempts => throw _privateConstructorUsedError;
  @JsonKey(name: 'best_score')
  int? get bestScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_attempt_at')
  DateTime? get lastAttemptAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_status')
  String? get lastStatus => throw _privateConstructorUsedError;

  /// Serializes this ListeningPassageProgress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ListeningPassageProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListeningPassageProgressCopyWith<ListeningPassageProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListeningPassageProgressCopyWith<$Res> {
  factory $ListeningPassageProgressCopyWith(ListeningPassageProgress value,
          $Res Function(ListeningPassageProgress) then) =
      _$ListeningPassageProgressCopyWithImpl<$Res, ListeningPassageProgress>;
  @useResult
  $Res call(
      {@JsonKey(name: 'passage_id') String? passageId,
      int attempts,
      @JsonKey(name: 'best_score') int? bestScore,
      @JsonKey(name: 'last_attempt_at') DateTime? lastAttemptAt,
      @JsonKey(name: 'last_status') String? lastStatus});
}

/// @nodoc
class _$ListeningPassageProgressCopyWithImpl<$Res,
        $Val extends ListeningPassageProgress>
    implements $ListeningPassageProgressCopyWith<$Res> {
  _$ListeningPassageProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListeningPassageProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? passageId = freezed,
    Object? attempts = null,
    Object? bestScore = freezed,
    Object? lastAttemptAt = freezed,
    Object? lastStatus = freezed,
  }) {
    return _then(_value.copyWith(
      passageId: freezed == passageId
          ? _value.passageId
          : passageId // ignore: cast_nullable_to_non_nullable
              as String?,
      attempts: null == attempts
          ? _value.attempts
          : attempts // ignore: cast_nullable_to_non_nullable
              as int,
      bestScore: freezed == bestScore
          ? _value.bestScore
          : bestScore // ignore: cast_nullable_to_non_nullable
              as int?,
      lastAttemptAt: freezed == lastAttemptAt
          ? _value.lastAttemptAt
          : lastAttemptAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastStatus: freezed == lastStatus
          ? _value.lastStatus
          : lastStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListeningPassageProgressImplCopyWith<$Res>
    implements $ListeningPassageProgressCopyWith<$Res> {
  factory _$$ListeningPassageProgressImplCopyWith(
          _$ListeningPassageProgressImpl value,
          $Res Function(_$ListeningPassageProgressImpl) then) =
      __$$ListeningPassageProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'passage_id') String? passageId,
      int attempts,
      @JsonKey(name: 'best_score') int? bestScore,
      @JsonKey(name: 'last_attempt_at') DateTime? lastAttemptAt,
      @JsonKey(name: 'last_status') String? lastStatus});
}

/// @nodoc
class __$$ListeningPassageProgressImplCopyWithImpl<$Res>
    extends _$ListeningPassageProgressCopyWithImpl<$Res,
        _$ListeningPassageProgressImpl>
    implements _$$ListeningPassageProgressImplCopyWith<$Res> {
  __$$ListeningPassageProgressImplCopyWithImpl(
      _$ListeningPassageProgressImpl _value,
      $Res Function(_$ListeningPassageProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListeningPassageProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? passageId = freezed,
    Object? attempts = null,
    Object? bestScore = freezed,
    Object? lastAttemptAt = freezed,
    Object? lastStatus = freezed,
  }) {
    return _then(_$ListeningPassageProgressImpl(
      passageId: freezed == passageId
          ? _value.passageId
          : passageId // ignore: cast_nullable_to_non_nullable
              as String?,
      attempts: null == attempts
          ? _value.attempts
          : attempts // ignore: cast_nullable_to_non_nullable
              as int,
      bestScore: freezed == bestScore
          ? _value.bestScore
          : bestScore // ignore: cast_nullable_to_non_nullable
              as int?,
      lastAttemptAt: freezed == lastAttemptAt
          ? _value.lastAttemptAt
          : lastAttemptAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastStatus: freezed == lastStatus
          ? _value.lastStatus
          : lastStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListeningPassageProgressImpl implements _ListeningPassageProgress {
  const _$ListeningPassageProgressImpl(
      {@JsonKey(name: 'passage_id') this.passageId,
      this.attempts = 0,
      @JsonKey(name: 'best_score') this.bestScore,
      @JsonKey(name: 'last_attempt_at') this.lastAttemptAt,
      @JsonKey(name: 'last_status') this.lastStatus});

  factory _$ListeningPassageProgressImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListeningPassageProgressImplFromJson(json);

  @override
  @JsonKey(name: 'passage_id')
  final String? passageId;
  @override
  @JsonKey()
  final int attempts;
  @override
  @JsonKey(name: 'best_score')
  final int? bestScore;
  @override
  @JsonKey(name: 'last_attempt_at')
  final DateTime? lastAttemptAt;
  @override
  @JsonKey(name: 'last_status')
  final String? lastStatus;

  @override
  String toString() {
    return 'ListeningPassageProgress(passageId: $passageId, attempts: $attempts, bestScore: $bestScore, lastAttemptAt: $lastAttemptAt, lastStatus: $lastStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListeningPassageProgressImpl &&
            (identical(other.passageId, passageId) ||
                other.passageId == passageId) &&
            (identical(other.attempts, attempts) ||
                other.attempts == attempts) &&
            (identical(other.bestScore, bestScore) ||
                other.bestScore == bestScore) &&
            (identical(other.lastAttemptAt, lastAttemptAt) ||
                other.lastAttemptAt == lastAttemptAt) &&
            (identical(other.lastStatus, lastStatus) ||
                other.lastStatus == lastStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, passageId, attempts, bestScore, lastAttemptAt, lastStatus);

  /// Create a copy of ListeningPassageProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListeningPassageProgressImplCopyWith<_$ListeningPassageProgressImpl>
      get copyWith => __$$ListeningPassageProgressImplCopyWithImpl<
          _$ListeningPassageProgressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListeningPassageProgressImplToJson(
      this,
    );
  }
}

abstract class _ListeningPassageProgress implements ListeningPassageProgress {
  const factory _ListeningPassageProgress(
          {@JsonKey(name: 'passage_id') final String? passageId,
          final int attempts,
          @JsonKey(name: 'best_score') final int? bestScore,
          @JsonKey(name: 'last_attempt_at') final DateTime? lastAttemptAt,
          @JsonKey(name: 'last_status') final String? lastStatus}) =
      _$ListeningPassageProgressImpl;

  factory _ListeningPassageProgress.fromJson(Map<String, dynamic> json) =
      _$ListeningPassageProgressImpl.fromJson;

  @override
  @JsonKey(name: 'passage_id')
  String? get passageId;
  @override
  int get attempts;
  @override
  @JsonKey(name: 'best_score')
  int? get bestScore;
  @override
  @JsonKey(name: 'last_attempt_at')
  DateTime? get lastAttemptAt;
  @override
  @JsonKey(name: 'last_status')
  String? get lastStatus;

  /// Create a copy of ListeningPassageProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListeningPassageProgressImplCopyWith<_$ListeningPassageProgressImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ListeningPassagesResponse _$ListeningPassagesResponseFromJson(
    Map<String, dynamic> json) {
  return _ListeningPassagesResponse.fromJson(json);
}

/// @nodoc
mixin _$ListeningPassagesResponse {
  List<ListeningPassage> get passages => throw _privateConstructorUsedError;
  @JsonKey(name: 'progress_by_passage')
  Map<String, ListeningPassageProgress> get progressByPassage =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'weakest_skills')
  List<String> get weakestSkills => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_progress')
  Map<String, dynamic>? get userProgress => throw _privateConstructorUsedError;

  /// Serializes this ListeningPassagesResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ListeningPassagesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListeningPassagesResponseCopyWith<ListeningPassagesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListeningPassagesResponseCopyWith<$Res> {
  factory $ListeningPassagesResponseCopyWith(ListeningPassagesResponse value,
          $Res Function(ListeningPassagesResponse) then) =
      _$ListeningPassagesResponseCopyWithImpl<$Res, ListeningPassagesResponse>;
  @useResult
  $Res call(
      {List<ListeningPassage> passages,
      @JsonKey(name: 'progress_by_passage')
      Map<String, ListeningPassageProgress> progressByPassage,
      @JsonKey(name: 'weakest_skills') List<String> weakestSkills,
      @JsonKey(name: 'user_progress') Map<String, dynamic>? userProgress});
}

/// @nodoc
class _$ListeningPassagesResponseCopyWithImpl<$Res,
        $Val extends ListeningPassagesResponse>
    implements $ListeningPassagesResponseCopyWith<$Res> {
  _$ListeningPassagesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListeningPassagesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? passages = null,
    Object? progressByPassage = null,
    Object? weakestSkills = null,
    Object? userProgress = freezed,
  }) {
    return _then(_value.copyWith(
      passages: null == passages
          ? _value.passages
          : passages // ignore: cast_nullable_to_non_nullable
              as List<ListeningPassage>,
      progressByPassage: null == progressByPassage
          ? _value.progressByPassage
          : progressByPassage // ignore: cast_nullable_to_non_nullable
              as Map<String, ListeningPassageProgress>,
      weakestSkills: null == weakestSkills
          ? _value.weakestSkills
          : weakestSkills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      userProgress: freezed == userProgress
          ? _value.userProgress
          : userProgress // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListeningPassagesResponseImplCopyWith<$Res>
    implements $ListeningPassagesResponseCopyWith<$Res> {
  factory _$$ListeningPassagesResponseImplCopyWith(
          _$ListeningPassagesResponseImpl value,
          $Res Function(_$ListeningPassagesResponseImpl) then) =
      __$$ListeningPassagesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ListeningPassage> passages,
      @JsonKey(name: 'progress_by_passage')
      Map<String, ListeningPassageProgress> progressByPassage,
      @JsonKey(name: 'weakest_skills') List<String> weakestSkills,
      @JsonKey(name: 'user_progress') Map<String, dynamic>? userProgress});
}

/// @nodoc
class __$$ListeningPassagesResponseImplCopyWithImpl<$Res>
    extends _$ListeningPassagesResponseCopyWithImpl<$Res,
        _$ListeningPassagesResponseImpl>
    implements _$$ListeningPassagesResponseImplCopyWith<$Res> {
  __$$ListeningPassagesResponseImplCopyWithImpl(
      _$ListeningPassagesResponseImpl _value,
      $Res Function(_$ListeningPassagesResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListeningPassagesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? passages = null,
    Object? progressByPassage = null,
    Object? weakestSkills = null,
    Object? userProgress = freezed,
  }) {
    return _then(_$ListeningPassagesResponseImpl(
      passages: null == passages
          ? _value._passages
          : passages // ignore: cast_nullable_to_non_nullable
              as List<ListeningPassage>,
      progressByPassage: null == progressByPassage
          ? _value._progressByPassage
          : progressByPassage // ignore: cast_nullable_to_non_nullable
              as Map<String, ListeningPassageProgress>,
      weakestSkills: null == weakestSkills
          ? _value._weakestSkills
          : weakestSkills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      userProgress: freezed == userProgress
          ? _value._userProgress
          : userProgress // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListeningPassagesResponseImpl implements _ListeningPassagesResponse {
  const _$ListeningPassagesResponseImpl(
      {final List<ListeningPassage> passages = const [],
      @JsonKey(name: 'progress_by_passage')
      final Map<String, ListeningPassageProgress> progressByPassage = const {},
      @JsonKey(name: 'weakest_skills')
      final List<String> weakestSkills = const [],
      @JsonKey(name: 'user_progress') final Map<String, dynamic>? userProgress})
      : _passages = passages,
        _progressByPassage = progressByPassage,
        _weakestSkills = weakestSkills,
        _userProgress = userProgress;

  factory _$ListeningPassagesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListeningPassagesResponseImplFromJson(json);

  final List<ListeningPassage> _passages;
  @override
  @JsonKey()
  List<ListeningPassage> get passages {
    if (_passages is EqualUnmodifiableListView) return _passages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_passages);
  }

  final Map<String, ListeningPassageProgress> _progressByPassage;
  @override
  @JsonKey(name: 'progress_by_passage')
  Map<String, ListeningPassageProgress> get progressByPassage {
    if (_progressByPassage is EqualUnmodifiableMapView)
      return _progressByPassage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_progressByPassage);
  }

  final List<String> _weakestSkills;
  @override
  @JsonKey(name: 'weakest_skills')
  List<String> get weakestSkills {
    if (_weakestSkills is EqualUnmodifiableListView) return _weakestSkills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weakestSkills);
  }

  final Map<String, dynamic>? _userProgress;
  @override
  @JsonKey(name: 'user_progress')
  Map<String, dynamic>? get userProgress {
    final value = _userProgress;
    if (value == null) return null;
    if (_userProgress is EqualUnmodifiableMapView) return _userProgress;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ListeningPassagesResponse(passages: $passages, progressByPassage: $progressByPassage, weakestSkills: $weakestSkills, userProgress: $userProgress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListeningPassagesResponseImpl &&
            const DeepCollectionEquality().equals(other._passages, _passages) &&
            const DeepCollectionEquality()
                .equals(other._progressByPassage, _progressByPassage) &&
            const DeepCollectionEquality()
                .equals(other._weakestSkills, _weakestSkills) &&
            const DeepCollectionEquality()
                .equals(other._userProgress, _userProgress));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_passages),
      const DeepCollectionEquality().hash(_progressByPassage),
      const DeepCollectionEquality().hash(_weakestSkills),
      const DeepCollectionEquality().hash(_userProgress));

  /// Create a copy of ListeningPassagesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListeningPassagesResponseImplCopyWith<_$ListeningPassagesResponseImpl>
      get copyWith => __$$ListeningPassagesResponseImplCopyWithImpl<
          _$ListeningPassagesResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListeningPassagesResponseImplToJson(
      this,
    );
  }
}

abstract class _ListeningPassagesResponse implements ListeningPassagesResponse {
  const factory _ListeningPassagesResponse(
          {final List<ListeningPassage> passages,
          @JsonKey(name: 'progress_by_passage')
          final Map<String, ListeningPassageProgress> progressByPassage,
          @JsonKey(name: 'weakest_skills') final List<String> weakestSkills,
          @JsonKey(name: 'user_progress')
          final Map<String, dynamic>? userProgress}) =
      _$ListeningPassagesResponseImpl;

  factory _ListeningPassagesResponse.fromJson(Map<String, dynamic> json) =
      _$ListeningPassagesResponseImpl.fromJson;

  @override
  List<ListeningPassage> get passages;
  @override
  @JsonKey(name: 'progress_by_passage')
  Map<String, ListeningPassageProgress> get progressByPassage;
  @override
  @JsonKey(name: 'weakest_skills')
  List<String> get weakestSkills;
  @override
  @JsonKey(name: 'user_progress')
  Map<String, dynamic>? get userProgress;

  /// Create a copy of ListeningPassagesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListeningPassagesResponseImplCopyWith<_$ListeningPassagesResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ListeningAttempt _$ListeningAttemptFromJson(Map<String, dynamic> json) {
  return _ListeningAttempt.fromJson(json);
}

/// @nodoc
mixin _$ListeningAttempt {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'passage_id')
  String? get passageId => throw _privateConstructorUsedError;
  int? get difficulty => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_mode')
  String? get deliveryMode => throw _privateConstructorUsedError;
  @JsonKey(name: 'playback_speed')
  num? get playbackSpeed => throw _privateConstructorUsedError;
  @JsonKey(name: 'replay_count')
  int? get replayCount => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'overall_score')
  int? get overallScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'skill_breakdown')
  Map<String, dynamic>? get skillBreakdown =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_at')
  DateTime? get completedAt => throw _privateConstructorUsedError;

  /// Serializes this ListeningAttempt to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ListeningAttempt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListeningAttemptCopyWith<ListeningAttempt> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListeningAttemptCopyWith<$Res> {
  factory $ListeningAttemptCopyWith(
          ListeningAttempt value, $Res Function(ListeningAttempt) then) =
      _$ListeningAttemptCopyWithImpl<$Res, ListeningAttempt>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'passage_id') String? passageId,
      int? difficulty,
      @JsonKey(name: 'delivery_mode') String? deliveryMode,
      @JsonKey(name: 'playback_speed') num? playbackSpeed,
      @JsonKey(name: 'replay_count') int? replayCount,
      String? status,
      @JsonKey(name: 'overall_score') int? overallScore,
      @JsonKey(name: 'skill_breakdown') Map<String, dynamic>? skillBreakdown,
      @JsonKey(name: 'completed_at') DateTime? completedAt});
}

/// @nodoc
class _$ListeningAttemptCopyWithImpl<$Res, $Val extends ListeningAttempt>
    implements $ListeningAttemptCopyWith<$Res> {
  _$ListeningAttemptCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListeningAttempt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? passageId = freezed,
    Object? difficulty = freezed,
    Object? deliveryMode = freezed,
    Object? playbackSpeed = freezed,
    Object? replayCount = freezed,
    Object? status = freezed,
    Object? overallScore = freezed,
    Object? skillBreakdown = freezed,
    Object? completedAt = freezed,
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
      passageId: freezed == passageId
          ? _value.passageId
          : passageId // ignore: cast_nullable_to_non_nullable
              as String?,
      difficulty: freezed == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as int?,
      deliveryMode: freezed == deliveryMode
          ? _value.deliveryMode
          : deliveryMode // ignore: cast_nullable_to_non_nullable
              as String?,
      playbackSpeed: freezed == playbackSpeed
          ? _value.playbackSpeed
          : playbackSpeed // ignore: cast_nullable_to_non_nullable
              as num?,
      replayCount: freezed == replayCount
          ? _value.replayCount
          : replayCount // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      overallScore: freezed == overallScore
          ? _value.overallScore
          : overallScore // ignore: cast_nullable_to_non_nullable
              as int?,
      skillBreakdown: freezed == skillBreakdown
          ? _value.skillBreakdown
          : skillBreakdown // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListeningAttemptImplCopyWith<$Res>
    implements $ListeningAttemptCopyWith<$Res> {
  factory _$$ListeningAttemptImplCopyWith(_$ListeningAttemptImpl value,
          $Res Function(_$ListeningAttemptImpl) then) =
      __$$ListeningAttemptImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'passage_id') String? passageId,
      int? difficulty,
      @JsonKey(name: 'delivery_mode') String? deliveryMode,
      @JsonKey(name: 'playback_speed') num? playbackSpeed,
      @JsonKey(name: 'replay_count') int? replayCount,
      String? status,
      @JsonKey(name: 'overall_score') int? overallScore,
      @JsonKey(name: 'skill_breakdown') Map<String, dynamic>? skillBreakdown,
      @JsonKey(name: 'completed_at') DateTime? completedAt});
}

/// @nodoc
class __$$ListeningAttemptImplCopyWithImpl<$Res>
    extends _$ListeningAttemptCopyWithImpl<$Res, _$ListeningAttemptImpl>
    implements _$$ListeningAttemptImplCopyWith<$Res> {
  __$$ListeningAttemptImplCopyWithImpl(_$ListeningAttemptImpl _value,
      $Res Function(_$ListeningAttemptImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListeningAttempt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? passageId = freezed,
    Object? difficulty = freezed,
    Object? deliveryMode = freezed,
    Object? playbackSpeed = freezed,
    Object? replayCount = freezed,
    Object? status = freezed,
    Object? overallScore = freezed,
    Object? skillBreakdown = freezed,
    Object? completedAt = freezed,
  }) {
    return _then(_$ListeningAttemptImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      passageId: freezed == passageId
          ? _value.passageId
          : passageId // ignore: cast_nullable_to_non_nullable
              as String?,
      difficulty: freezed == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as int?,
      deliveryMode: freezed == deliveryMode
          ? _value.deliveryMode
          : deliveryMode // ignore: cast_nullable_to_non_nullable
              as String?,
      playbackSpeed: freezed == playbackSpeed
          ? _value.playbackSpeed
          : playbackSpeed // ignore: cast_nullable_to_non_nullable
              as num?,
      replayCount: freezed == replayCount
          ? _value.replayCount
          : replayCount // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      overallScore: freezed == overallScore
          ? _value.overallScore
          : overallScore // ignore: cast_nullable_to_non_nullable
              as int?,
      skillBreakdown: freezed == skillBreakdown
          ? _value._skillBreakdown
          : skillBreakdown // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListeningAttemptImpl implements _ListeningAttempt {
  const _$ListeningAttemptImpl(
      {required this.id,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'passage_id') this.passageId,
      this.difficulty,
      @JsonKey(name: 'delivery_mode') this.deliveryMode,
      @JsonKey(name: 'playback_speed') this.playbackSpeed,
      @JsonKey(name: 'replay_count') this.replayCount,
      this.status,
      @JsonKey(name: 'overall_score') this.overallScore,
      @JsonKey(name: 'skill_breakdown')
      final Map<String, dynamic>? skillBreakdown,
      @JsonKey(name: 'completed_at') this.completedAt})
      : _skillBreakdown = skillBreakdown;

  factory _$ListeningAttemptImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListeningAttemptImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  @JsonKey(name: 'passage_id')
  final String? passageId;
  @override
  final int? difficulty;
  @override
  @JsonKey(name: 'delivery_mode')
  final String? deliveryMode;
  @override
  @JsonKey(name: 'playback_speed')
  final num? playbackSpeed;
  @override
  @JsonKey(name: 'replay_count')
  final int? replayCount;
  @override
  final String? status;
  @override
  @JsonKey(name: 'overall_score')
  final int? overallScore;
  final Map<String, dynamic>? _skillBreakdown;
  @override
  @JsonKey(name: 'skill_breakdown')
  Map<String, dynamic>? get skillBreakdown {
    final value = _skillBreakdown;
    if (value == null) return null;
    if (_skillBreakdown is EqualUnmodifiableMapView) return _skillBreakdown;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'completed_at')
  final DateTime? completedAt;

  @override
  String toString() {
    return 'ListeningAttempt(id: $id, userId: $userId, passageId: $passageId, difficulty: $difficulty, deliveryMode: $deliveryMode, playbackSpeed: $playbackSpeed, replayCount: $replayCount, status: $status, overallScore: $overallScore, skillBreakdown: $skillBreakdown, completedAt: $completedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListeningAttemptImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.passageId, passageId) ||
                other.passageId == passageId) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.deliveryMode, deliveryMode) ||
                other.deliveryMode == deliveryMode) &&
            (identical(other.playbackSpeed, playbackSpeed) ||
                other.playbackSpeed == playbackSpeed) &&
            (identical(other.replayCount, replayCount) ||
                other.replayCount == replayCount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.overallScore, overallScore) ||
                other.overallScore == overallScore) &&
            const DeepCollectionEquality()
                .equals(other._skillBreakdown, _skillBreakdown) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      passageId,
      difficulty,
      deliveryMode,
      playbackSpeed,
      replayCount,
      status,
      overallScore,
      const DeepCollectionEquality().hash(_skillBreakdown),
      completedAt);

  /// Create a copy of ListeningAttempt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListeningAttemptImplCopyWith<_$ListeningAttemptImpl> get copyWith =>
      __$$ListeningAttemptImplCopyWithImpl<_$ListeningAttemptImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListeningAttemptImplToJson(
      this,
    );
  }
}

abstract class _ListeningAttempt implements ListeningAttempt {
  const factory _ListeningAttempt(
          {required final String id,
          @JsonKey(name: 'user_id') final String? userId,
          @JsonKey(name: 'passage_id') final String? passageId,
          final int? difficulty,
          @JsonKey(name: 'delivery_mode') final String? deliveryMode,
          @JsonKey(name: 'playback_speed') final num? playbackSpeed,
          @JsonKey(name: 'replay_count') final int? replayCount,
          final String? status,
          @JsonKey(name: 'overall_score') final int? overallScore,
          @JsonKey(name: 'skill_breakdown')
          final Map<String, dynamic>? skillBreakdown,
          @JsonKey(name: 'completed_at') final DateTime? completedAt}) =
      _$ListeningAttemptImpl;

  factory _ListeningAttempt.fromJson(Map<String, dynamic> json) =
      _$ListeningAttemptImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  @JsonKey(name: 'passage_id')
  String? get passageId;
  @override
  int? get difficulty;
  @override
  @JsonKey(name: 'delivery_mode')
  String? get deliveryMode;
  @override
  @JsonKey(name: 'playback_speed')
  num? get playbackSpeed;
  @override
  @JsonKey(name: 'replay_count')
  int? get replayCount;
  @override
  String? get status;
  @override
  @JsonKey(name: 'overall_score')
  int? get overallScore;
  @override
  @JsonKey(name: 'skill_breakdown')
  Map<String, dynamic>? get skillBreakdown;
  @override
  @JsonKey(name: 'completed_at')
  DateTime? get completedAt;

  /// Create a copy of ListeningAttempt
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListeningAttemptImplCopyWith<_$ListeningAttemptImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ListeningAnswer _$ListeningAnswerFromJson(Map<String, dynamic> json) {
  return _ListeningAnswer.fromJson(json);
}

/// @nodoc
mixin _$ListeningAnswer {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'attempt_id')
  String? get attemptId => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_id')
  String? get questionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_type')
  String? get questionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'target_skill')
  String? get targetSkill => throw _privateConstructorUsedError;
  @JsonKey(name: 'selected_option_id')
  String? get selectedOptionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_correct')
  bool? get isCorrect => throw _privateConstructorUsedError;
  String? get transcript => throw _privateConstructorUsedError;
  int? get score => throw _privateConstructorUsedError;
  Map<String, dynamic>? get analysis => throw _privateConstructorUsedError;
  @JsonKey(name: 'recording_r2_key')
  String? get recordingR2Key => throw _privateConstructorUsedError;

  /// Serializes this ListeningAnswer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ListeningAnswer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListeningAnswerCopyWith<ListeningAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListeningAnswerCopyWith<$Res> {
  factory $ListeningAnswerCopyWith(
          ListeningAnswer value, $Res Function(ListeningAnswer) then) =
      _$ListeningAnswerCopyWithImpl<$Res, ListeningAnswer>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'attempt_id') String? attemptId,
      @JsonKey(name: 'question_id') String? questionId,
      @JsonKey(name: 'question_type') String? questionType,
      @JsonKey(name: 'target_skill') String? targetSkill,
      @JsonKey(name: 'selected_option_id') String? selectedOptionId,
      @JsonKey(name: 'is_correct') bool? isCorrect,
      String? transcript,
      int? score,
      Map<String, dynamic>? analysis,
      @JsonKey(name: 'recording_r2_key') String? recordingR2Key});
}

/// @nodoc
class _$ListeningAnswerCopyWithImpl<$Res, $Val extends ListeningAnswer>
    implements $ListeningAnswerCopyWith<$Res> {
  _$ListeningAnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListeningAnswer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? attemptId = freezed,
    Object? questionId = freezed,
    Object? questionType = freezed,
    Object? targetSkill = freezed,
    Object? selectedOptionId = freezed,
    Object? isCorrect = freezed,
    Object? transcript = freezed,
    Object? score = freezed,
    Object? analysis = freezed,
    Object? recordingR2Key = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      attemptId: freezed == attemptId
          ? _value.attemptId
          : attemptId // ignore: cast_nullable_to_non_nullable
              as String?,
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String?,
      questionType: freezed == questionType
          ? _value.questionType
          : questionType // ignore: cast_nullable_to_non_nullable
              as String?,
      targetSkill: freezed == targetSkill
          ? _value.targetSkill
          : targetSkill // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedOptionId: freezed == selectedOptionId
          ? _value.selectedOptionId
          : selectedOptionId // ignore: cast_nullable_to_non_nullable
              as String?,
      isCorrect: freezed == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool?,
      transcript: freezed == transcript
          ? _value.transcript
          : transcript // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      analysis: freezed == analysis
          ? _value.analysis
          : analysis // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      recordingR2Key: freezed == recordingR2Key
          ? _value.recordingR2Key
          : recordingR2Key // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListeningAnswerImplCopyWith<$Res>
    implements $ListeningAnswerCopyWith<$Res> {
  factory _$$ListeningAnswerImplCopyWith(_$ListeningAnswerImpl value,
          $Res Function(_$ListeningAnswerImpl) then) =
      __$$ListeningAnswerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'attempt_id') String? attemptId,
      @JsonKey(name: 'question_id') String? questionId,
      @JsonKey(name: 'question_type') String? questionType,
      @JsonKey(name: 'target_skill') String? targetSkill,
      @JsonKey(name: 'selected_option_id') String? selectedOptionId,
      @JsonKey(name: 'is_correct') bool? isCorrect,
      String? transcript,
      int? score,
      Map<String, dynamic>? analysis,
      @JsonKey(name: 'recording_r2_key') String? recordingR2Key});
}

/// @nodoc
class __$$ListeningAnswerImplCopyWithImpl<$Res>
    extends _$ListeningAnswerCopyWithImpl<$Res, _$ListeningAnswerImpl>
    implements _$$ListeningAnswerImplCopyWith<$Res> {
  __$$ListeningAnswerImplCopyWithImpl(
      _$ListeningAnswerImpl _value, $Res Function(_$ListeningAnswerImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListeningAnswer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? attemptId = freezed,
    Object? questionId = freezed,
    Object? questionType = freezed,
    Object? targetSkill = freezed,
    Object? selectedOptionId = freezed,
    Object? isCorrect = freezed,
    Object? transcript = freezed,
    Object? score = freezed,
    Object? analysis = freezed,
    Object? recordingR2Key = freezed,
  }) {
    return _then(_$ListeningAnswerImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      attemptId: freezed == attemptId
          ? _value.attemptId
          : attemptId // ignore: cast_nullable_to_non_nullable
              as String?,
      questionId: freezed == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String?,
      questionType: freezed == questionType
          ? _value.questionType
          : questionType // ignore: cast_nullable_to_non_nullable
              as String?,
      targetSkill: freezed == targetSkill
          ? _value.targetSkill
          : targetSkill // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedOptionId: freezed == selectedOptionId
          ? _value.selectedOptionId
          : selectedOptionId // ignore: cast_nullable_to_non_nullable
              as String?,
      isCorrect: freezed == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool?,
      transcript: freezed == transcript
          ? _value.transcript
          : transcript // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      analysis: freezed == analysis
          ? _value._analysis
          : analysis // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      recordingR2Key: freezed == recordingR2Key
          ? _value.recordingR2Key
          : recordingR2Key // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListeningAnswerImpl implements _ListeningAnswer {
  const _$ListeningAnswerImpl(
      {this.id,
      @JsonKey(name: 'attempt_id') this.attemptId,
      @JsonKey(name: 'question_id') this.questionId,
      @JsonKey(name: 'question_type') this.questionType,
      @JsonKey(name: 'target_skill') this.targetSkill,
      @JsonKey(name: 'selected_option_id') this.selectedOptionId,
      @JsonKey(name: 'is_correct') this.isCorrect,
      this.transcript,
      this.score,
      final Map<String, dynamic>? analysis,
      @JsonKey(name: 'recording_r2_key') this.recordingR2Key})
      : _analysis = analysis;

  factory _$ListeningAnswerImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListeningAnswerImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'attempt_id')
  final String? attemptId;
  @override
  @JsonKey(name: 'question_id')
  final String? questionId;
  @override
  @JsonKey(name: 'question_type')
  final String? questionType;
  @override
  @JsonKey(name: 'target_skill')
  final String? targetSkill;
  @override
  @JsonKey(name: 'selected_option_id')
  final String? selectedOptionId;
  @override
  @JsonKey(name: 'is_correct')
  final bool? isCorrect;
  @override
  final String? transcript;
  @override
  final int? score;
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
  @JsonKey(name: 'recording_r2_key')
  final String? recordingR2Key;

  @override
  String toString() {
    return 'ListeningAnswer(id: $id, attemptId: $attemptId, questionId: $questionId, questionType: $questionType, targetSkill: $targetSkill, selectedOptionId: $selectedOptionId, isCorrect: $isCorrect, transcript: $transcript, score: $score, analysis: $analysis, recordingR2Key: $recordingR2Key)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListeningAnswerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.attemptId, attemptId) ||
                other.attemptId == attemptId) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.questionType, questionType) ||
                other.questionType == questionType) &&
            (identical(other.targetSkill, targetSkill) ||
                other.targetSkill == targetSkill) &&
            (identical(other.selectedOptionId, selectedOptionId) ||
                other.selectedOptionId == selectedOptionId) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect) &&
            (identical(other.transcript, transcript) ||
                other.transcript == transcript) &&
            (identical(other.score, score) || other.score == score) &&
            const DeepCollectionEquality().equals(other._analysis, _analysis) &&
            (identical(other.recordingR2Key, recordingR2Key) ||
                other.recordingR2Key == recordingR2Key));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      attemptId,
      questionId,
      questionType,
      targetSkill,
      selectedOptionId,
      isCorrect,
      transcript,
      score,
      const DeepCollectionEquality().hash(_analysis),
      recordingR2Key);

  /// Create a copy of ListeningAnswer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListeningAnswerImplCopyWith<_$ListeningAnswerImpl> get copyWith =>
      __$$ListeningAnswerImplCopyWithImpl<_$ListeningAnswerImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListeningAnswerImplToJson(
      this,
    );
  }
}

abstract class _ListeningAnswer implements ListeningAnswer {
  const factory _ListeningAnswer(
          {final String? id,
          @JsonKey(name: 'attempt_id') final String? attemptId,
          @JsonKey(name: 'question_id') final String? questionId,
          @JsonKey(name: 'question_type') final String? questionType,
          @JsonKey(name: 'target_skill') final String? targetSkill,
          @JsonKey(name: 'selected_option_id') final String? selectedOptionId,
          @JsonKey(name: 'is_correct') final bool? isCorrect,
          final String? transcript,
          final int? score,
          final Map<String, dynamic>? analysis,
          @JsonKey(name: 'recording_r2_key') final String? recordingR2Key}) =
      _$ListeningAnswerImpl;

  factory _ListeningAnswer.fromJson(Map<String, dynamic> json) =
      _$ListeningAnswerImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'attempt_id')
  String? get attemptId;
  @override
  @JsonKey(name: 'question_id')
  String? get questionId;
  @override
  @JsonKey(name: 'question_type')
  String? get questionType;
  @override
  @JsonKey(name: 'target_skill')
  String? get targetSkill;
  @override
  @JsonKey(name: 'selected_option_id')
  String? get selectedOptionId;
  @override
  @JsonKey(name: 'is_correct')
  bool? get isCorrect;
  @override
  String? get transcript;
  @override
  int? get score;
  @override
  Map<String, dynamic>? get analysis;
  @override
  @JsonKey(name: 'recording_r2_key')
  String? get recordingR2Key;

  /// Create a copy of ListeningAnswer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListeningAnswerImplCopyWith<_$ListeningAnswerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ListeningVoiceUpload _$ListeningVoiceUploadFromJson(Map<String, dynamic> json) {
  return _ListeningVoiceUpload.fromJson(json);
}

/// @nodoc
mixin _$ListeningVoiceUpload {
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'object_key')
  String get objectKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'content_type')
  String get contentType => throw _privateConstructorUsedError;

  /// Serializes this ListeningVoiceUpload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ListeningVoiceUpload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListeningVoiceUploadCopyWith<ListeningVoiceUpload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListeningVoiceUploadCopyWith<$Res> {
  factory $ListeningVoiceUploadCopyWith(ListeningVoiceUpload value,
          $Res Function(ListeningVoiceUpload) then) =
      _$ListeningVoiceUploadCopyWithImpl<$Res, ListeningVoiceUpload>;
  @useResult
  $Res call(
      {String url,
      @JsonKey(name: 'object_key') String objectKey,
      @JsonKey(name: 'content_type') String contentType});
}

/// @nodoc
class _$ListeningVoiceUploadCopyWithImpl<$Res,
        $Val extends ListeningVoiceUpload>
    implements $ListeningVoiceUploadCopyWith<$Res> {
  _$ListeningVoiceUploadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListeningVoiceUpload
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
abstract class _$$ListeningVoiceUploadImplCopyWith<$Res>
    implements $ListeningVoiceUploadCopyWith<$Res> {
  factory _$$ListeningVoiceUploadImplCopyWith(_$ListeningVoiceUploadImpl value,
          $Res Function(_$ListeningVoiceUploadImpl) then) =
      __$$ListeningVoiceUploadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String url,
      @JsonKey(name: 'object_key') String objectKey,
      @JsonKey(name: 'content_type') String contentType});
}

/// @nodoc
class __$$ListeningVoiceUploadImplCopyWithImpl<$Res>
    extends _$ListeningVoiceUploadCopyWithImpl<$Res, _$ListeningVoiceUploadImpl>
    implements _$$ListeningVoiceUploadImplCopyWith<$Res> {
  __$$ListeningVoiceUploadImplCopyWithImpl(_$ListeningVoiceUploadImpl _value,
      $Res Function(_$ListeningVoiceUploadImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListeningVoiceUpload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? objectKey = null,
    Object? contentType = null,
  }) {
    return _then(_$ListeningVoiceUploadImpl(
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
class _$ListeningVoiceUploadImpl implements _ListeningVoiceUpload {
  const _$ListeningVoiceUploadImpl(
      {required this.url,
      @JsonKey(name: 'object_key') required this.objectKey,
      @JsonKey(name: 'content_type') required this.contentType});

  factory _$ListeningVoiceUploadImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListeningVoiceUploadImplFromJson(json);

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
    return 'ListeningVoiceUpload(url: $url, objectKey: $objectKey, contentType: $contentType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListeningVoiceUploadImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.objectKey, objectKey) ||
                other.objectKey == objectKey) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, objectKey, contentType);

  /// Create a copy of ListeningVoiceUpload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListeningVoiceUploadImplCopyWith<_$ListeningVoiceUploadImpl>
      get copyWith =>
          __$$ListeningVoiceUploadImplCopyWithImpl<_$ListeningVoiceUploadImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListeningVoiceUploadImplToJson(
      this,
    );
  }
}

abstract class _ListeningVoiceUpload implements ListeningVoiceUpload {
  const factory _ListeningVoiceUpload(
          {required final String url,
          @JsonKey(name: 'object_key') required final String objectKey,
          @JsonKey(name: 'content_type') required final String contentType}) =
      _$ListeningVoiceUploadImpl;

  factory _ListeningVoiceUpload.fromJson(Map<String, dynamic> json) =
      _$ListeningVoiceUploadImpl.fromJson;

  @override
  String get url;
  @override
  @JsonKey(name: 'object_key')
  String get objectKey;
  @override
  @JsonKey(name: 'content_type')
  String get contentType;

  /// Create a copy of ListeningVoiceUpload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListeningVoiceUploadImplCopyWith<_$ListeningVoiceUploadImpl>
      get copyWith => throw _privateConstructorUsedError;
}
