// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vocabulary_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VocabularyWord _$VocabularyWordFromJson(Map<String, dynamic> json) {
  return _VocabularyWord.fromJson(json);
}

/// @nodoc
mixin _$VocabularyWord {
  String get word => throw _privateConstructorUsedError;
  @JsonKey(name: 'part_of_speech')
  String? get partOfSpeech => throw _privateConstructorUsedError;
  String? get definition => throw _privateConstructorUsedError;
  String? get ipa => throw _privateConstructorUsedError;
  @JsonKey(name: 'example_sentence')
  String? get exampleSentence => throw _privateConstructorUsedError;
  @JsonKey(name: 'why_chosen')
  String? get whyChosen => throw _privateConstructorUsedError;
  String? get cefr => throw _privateConstructorUsedError;
  String? get register => throw _privateConstructorUsedError;
  String? get difficulty => throw _privateConstructorUsedError;

  /// Serializes this VocabularyWord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VocabularyWord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VocabularyWordCopyWith<VocabularyWord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VocabularyWordCopyWith<$Res> {
  factory $VocabularyWordCopyWith(
          VocabularyWord value, $Res Function(VocabularyWord) then) =
      _$VocabularyWordCopyWithImpl<$Res, VocabularyWord>;
  @useResult
  $Res call(
      {String word,
      @JsonKey(name: 'part_of_speech') String? partOfSpeech,
      String? definition,
      String? ipa,
      @JsonKey(name: 'example_sentence') String? exampleSentence,
      @JsonKey(name: 'why_chosen') String? whyChosen,
      String? cefr,
      String? register,
      String? difficulty});
}

/// @nodoc
class _$VocabularyWordCopyWithImpl<$Res, $Val extends VocabularyWord>
    implements $VocabularyWordCopyWith<$Res> {
  _$VocabularyWordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VocabularyWord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? partOfSpeech = freezed,
    Object? definition = freezed,
    Object? ipa = freezed,
    Object? exampleSentence = freezed,
    Object? whyChosen = freezed,
    Object? cefr = freezed,
    Object? register = freezed,
    Object? difficulty = freezed,
  }) {
    return _then(_value.copyWith(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      partOfSpeech: freezed == partOfSpeech
          ? _value.partOfSpeech
          : partOfSpeech // ignore: cast_nullable_to_non_nullable
              as String?,
      definition: freezed == definition
          ? _value.definition
          : definition // ignore: cast_nullable_to_non_nullable
              as String?,
      ipa: freezed == ipa
          ? _value.ipa
          : ipa // ignore: cast_nullable_to_non_nullable
              as String?,
      exampleSentence: freezed == exampleSentence
          ? _value.exampleSentence
          : exampleSentence // ignore: cast_nullable_to_non_nullable
              as String?,
      whyChosen: freezed == whyChosen
          ? _value.whyChosen
          : whyChosen // ignore: cast_nullable_to_non_nullable
              as String?,
      cefr: freezed == cefr
          ? _value.cefr
          : cefr // ignore: cast_nullable_to_non_nullable
              as String?,
      register: freezed == register
          ? _value.register
          : register // ignore: cast_nullable_to_non_nullable
              as String?,
      difficulty: freezed == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VocabularyWordImplCopyWith<$Res>
    implements $VocabularyWordCopyWith<$Res> {
  factory _$$VocabularyWordImplCopyWith(_$VocabularyWordImpl value,
          $Res Function(_$VocabularyWordImpl) then) =
      __$$VocabularyWordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String word,
      @JsonKey(name: 'part_of_speech') String? partOfSpeech,
      String? definition,
      String? ipa,
      @JsonKey(name: 'example_sentence') String? exampleSentence,
      @JsonKey(name: 'why_chosen') String? whyChosen,
      String? cefr,
      String? register,
      String? difficulty});
}

/// @nodoc
class __$$VocabularyWordImplCopyWithImpl<$Res>
    extends _$VocabularyWordCopyWithImpl<$Res, _$VocabularyWordImpl>
    implements _$$VocabularyWordImplCopyWith<$Res> {
  __$$VocabularyWordImplCopyWithImpl(
      _$VocabularyWordImpl _value, $Res Function(_$VocabularyWordImpl) _then)
      : super(_value, _then);

  /// Create a copy of VocabularyWord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? partOfSpeech = freezed,
    Object? definition = freezed,
    Object? ipa = freezed,
    Object? exampleSentence = freezed,
    Object? whyChosen = freezed,
    Object? cefr = freezed,
    Object? register = freezed,
    Object? difficulty = freezed,
  }) {
    return _then(_$VocabularyWordImpl(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      partOfSpeech: freezed == partOfSpeech
          ? _value.partOfSpeech
          : partOfSpeech // ignore: cast_nullable_to_non_nullable
              as String?,
      definition: freezed == definition
          ? _value.definition
          : definition // ignore: cast_nullable_to_non_nullable
              as String?,
      ipa: freezed == ipa
          ? _value.ipa
          : ipa // ignore: cast_nullable_to_non_nullable
              as String?,
      exampleSentence: freezed == exampleSentence
          ? _value.exampleSentence
          : exampleSentence // ignore: cast_nullable_to_non_nullable
              as String?,
      whyChosen: freezed == whyChosen
          ? _value.whyChosen
          : whyChosen // ignore: cast_nullable_to_non_nullable
              as String?,
      cefr: freezed == cefr
          ? _value.cefr
          : cefr // ignore: cast_nullable_to_non_nullable
              as String?,
      register: freezed == register
          ? _value.register
          : register // ignore: cast_nullable_to_non_nullable
              as String?,
      difficulty: freezed == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VocabularyWordImpl implements _VocabularyWord {
  const _$VocabularyWordImpl(
      {required this.word,
      @JsonKey(name: 'part_of_speech') this.partOfSpeech,
      this.definition,
      this.ipa,
      @JsonKey(name: 'example_sentence') this.exampleSentence,
      @JsonKey(name: 'why_chosen') this.whyChosen,
      this.cefr,
      this.register,
      this.difficulty});

  factory _$VocabularyWordImpl.fromJson(Map<String, dynamic> json) =>
      _$$VocabularyWordImplFromJson(json);

  @override
  final String word;
  @override
  @JsonKey(name: 'part_of_speech')
  final String? partOfSpeech;
  @override
  final String? definition;
  @override
  final String? ipa;
  @override
  @JsonKey(name: 'example_sentence')
  final String? exampleSentence;
  @override
  @JsonKey(name: 'why_chosen')
  final String? whyChosen;
  @override
  final String? cefr;
  @override
  final String? register;
  @override
  final String? difficulty;

  @override
  String toString() {
    return 'VocabularyWord(word: $word, partOfSpeech: $partOfSpeech, definition: $definition, ipa: $ipa, exampleSentence: $exampleSentence, whyChosen: $whyChosen, cefr: $cefr, register: $register, difficulty: $difficulty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VocabularyWordImpl &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.partOfSpeech, partOfSpeech) ||
                other.partOfSpeech == partOfSpeech) &&
            (identical(other.definition, definition) ||
                other.definition == definition) &&
            (identical(other.ipa, ipa) || other.ipa == ipa) &&
            (identical(other.exampleSentence, exampleSentence) ||
                other.exampleSentence == exampleSentence) &&
            (identical(other.whyChosen, whyChosen) ||
                other.whyChosen == whyChosen) &&
            (identical(other.cefr, cefr) || other.cefr == cefr) &&
            (identical(other.register, register) ||
                other.register == register) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, word, partOfSpeech, definition,
      ipa, exampleSentence, whyChosen, cefr, register, difficulty);

  /// Create a copy of VocabularyWord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VocabularyWordImplCopyWith<_$VocabularyWordImpl> get copyWith =>
      __$$VocabularyWordImplCopyWithImpl<_$VocabularyWordImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VocabularyWordImplToJson(
      this,
    );
  }
}

abstract class _VocabularyWord implements VocabularyWord {
  const factory _VocabularyWord(
      {required final String word,
      @JsonKey(name: 'part_of_speech') final String? partOfSpeech,
      final String? definition,
      final String? ipa,
      @JsonKey(name: 'example_sentence') final String? exampleSentence,
      @JsonKey(name: 'why_chosen') final String? whyChosen,
      final String? cefr,
      final String? register,
      final String? difficulty}) = _$VocabularyWordImpl;

  factory _VocabularyWord.fromJson(Map<String, dynamic> json) =
      _$VocabularyWordImpl.fromJson;

  @override
  String get word;
  @override
  @JsonKey(name: 'part_of_speech')
  String? get partOfSpeech;
  @override
  String? get definition;
  @override
  String? get ipa;
  @override
  @JsonKey(name: 'example_sentence')
  String? get exampleSentence;
  @override
  @JsonKey(name: 'why_chosen')
  String? get whyChosen;
  @override
  String? get cefr;
  @override
  String? get register;
  @override
  String? get difficulty;

  /// Create a copy of VocabularyWord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VocabularyWordImplCopyWith<_$VocabularyWordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VocabularyWordProgress _$VocabularyWordProgressFromJson(
    Map<String, dynamic> json) {
  return _VocabularyWordProgress.fromJson(json);
}

/// @nodoc
mixin _$VocabularyWordProgress {
  @JsonKey(name: 'daily_set_id')
  String? get dailySetId => throw _privateConstructorUsedError;
  String get word => throw _privateConstructorUsedError;
  String get stage => throw _privateConstructorUsedError;
  int? get position => throw _privateConstructorUsedError;
  @JsonKey(name: 'mastered_at')
  DateTime? get masteredAt => throw _privateConstructorUsedError;

  /// Serializes this VocabularyWordProgress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VocabularyWordProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VocabularyWordProgressCopyWith<VocabularyWordProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VocabularyWordProgressCopyWith<$Res> {
  factory $VocabularyWordProgressCopyWith(VocabularyWordProgress value,
          $Res Function(VocabularyWordProgress) then) =
      _$VocabularyWordProgressCopyWithImpl<$Res, VocabularyWordProgress>;
  @useResult
  $Res call(
      {@JsonKey(name: 'daily_set_id') String? dailySetId,
      String word,
      String stage,
      int? position,
      @JsonKey(name: 'mastered_at') DateTime? masteredAt});
}

/// @nodoc
class _$VocabularyWordProgressCopyWithImpl<$Res,
        $Val extends VocabularyWordProgress>
    implements $VocabularyWordProgressCopyWith<$Res> {
  _$VocabularyWordProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VocabularyWordProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dailySetId = freezed,
    Object? word = null,
    Object? stage = null,
    Object? position = freezed,
    Object? masteredAt = freezed,
  }) {
    return _then(_value.copyWith(
      dailySetId: freezed == dailySetId
          ? _value.dailySetId
          : dailySetId // ignore: cast_nullable_to_non_nullable
              as String?,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      stage: null == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as String,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int?,
      masteredAt: freezed == masteredAt
          ? _value.masteredAt
          : masteredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VocabularyWordProgressImplCopyWith<$Res>
    implements $VocabularyWordProgressCopyWith<$Res> {
  factory _$$VocabularyWordProgressImplCopyWith(
          _$VocabularyWordProgressImpl value,
          $Res Function(_$VocabularyWordProgressImpl) then) =
      __$$VocabularyWordProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'daily_set_id') String? dailySetId,
      String word,
      String stage,
      int? position,
      @JsonKey(name: 'mastered_at') DateTime? masteredAt});
}

/// @nodoc
class __$$VocabularyWordProgressImplCopyWithImpl<$Res>
    extends _$VocabularyWordProgressCopyWithImpl<$Res,
        _$VocabularyWordProgressImpl>
    implements _$$VocabularyWordProgressImplCopyWith<$Res> {
  __$$VocabularyWordProgressImplCopyWithImpl(
      _$VocabularyWordProgressImpl _value,
      $Res Function(_$VocabularyWordProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of VocabularyWordProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dailySetId = freezed,
    Object? word = null,
    Object? stage = null,
    Object? position = freezed,
    Object? masteredAt = freezed,
  }) {
    return _then(_$VocabularyWordProgressImpl(
      dailySetId: freezed == dailySetId
          ? _value.dailySetId
          : dailySetId // ignore: cast_nullable_to_non_nullable
              as String?,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      stage: null == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as String,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int?,
      masteredAt: freezed == masteredAt
          ? _value.masteredAt
          : masteredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VocabularyWordProgressImpl implements _VocabularyWordProgress {
  const _$VocabularyWordProgressImpl(
      {@JsonKey(name: 'daily_set_id') this.dailySetId,
      required this.word,
      this.stage = 'learn',
      this.position,
      @JsonKey(name: 'mastered_at') this.masteredAt});

  factory _$VocabularyWordProgressImpl.fromJson(Map<String, dynamic> json) =>
      _$$VocabularyWordProgressImplFromJson(json);

  @override
  @JsonKey(name: 'daily_set_id')
  final String? dailySetId;
  @override
  final String word;
  @override
  @JsonKey()
  final String stage;
  @override
  final int? position;
  @override
  @JsonKey(name: 'mastered_at')
  final DateTime? masteredAt;

  @override
  String toString() {
    return 'VocabularyWordProgress(dailySetId: $dailySetId, word: $word, stage: $stage, position: $position, masteredAt: $masteredAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VocabularyWordProgressImpl &&
            (identical(other.dailySetId, dailySetId) ||
                other.dailySetId == dailySetId) &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.masteredAt, masteredAt) ||
                other.masteredAt == masteredAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, dailySetId, word, stage, position, masteredAt);

  /// Create a copy of VocabularyWordProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VocabularyWordProgressImplCopyWith<_$VocabularyWordProgressImpl>
      get copyWith => __$$VocabularyWordProgressImplCopyWithImpl<
          _$VocabularyWordProgressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VocabularyWordProgressImplToJson(
      this,
    );
  }
}

abstract class _VocabularyWordProgress implements VocabularyWordProgress {
  const factory _VocabularyWordProgress(
          {@JsonKey(name: 'daily_set_id') final String? dailySetId,
          required final String word,
          final String stage,
          final int? position,
          @JsonKey(name: 'mastered_at') final DateTime? masteredAt}) =
      _$VocabularyWordProgressImpl;

  factory _VocabularyWordProgress.fromJson(Map<String, dynamic> json) =
      _$VocabularyWordProgressImpl.fromJson;

  @override
  @JsonKey(name: 'daily_set_id')
  String? get dailySetId;
  @override
  String get word;
  @override
  String get stage;
  @override
  int? get position;
  @override
  @JsonKey(name: 'mastered_at')
  DateTime? get masteredAt;

  /// Create a copy of VocabularyWordProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VocabularyWordProgressImplCopyWith<_$VocabularyWordProgressImpl>
      get copyWith => throw _privateConstructorUsedError;
}

VocabularyDailySet _$VocabularyDailySetFromJson(Map<String, dynamic> json) {
  return _VocabularyDailySet.fromJson(json);
}

/// @nodoc
mixin _$VocabularyDailySet {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'set_date')
  String? get setDate => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  List<VocabularyWord> get words => throw _privateConstructorUsedError;
  @JsonKey(name: 'generated_at')
  DateTime? get generatedAt => throw _privateConstructorUsedError;

  /// Serializes this VocabularyDailySet to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VocabularyDailySet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VocabularyDailySetCopyWith<VocabularyDailySet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VocabularyDailySetCopyWith<$Res> {
  factory $VocabularyDailySetCopyWith(
          VocabularyDailySet value, $Res Function(VocabularyDailySet) then) =
      _$VocabularyDailySetCopyWithImpl<$Res, VocabularyDailySet>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'set_date') String? setDate,
      String? status,
      List<VocabularyWord> words,
      @JsonKey(name: 'generated_at') DateTime? generatedAt});
}

/// @nodoc
class _$VocabularyDailySetCopyWithImpl<$Res, $Val extends VocabularyDailySet>
    implements $VocabularyDailySetCopyWith<$Res> {
  _$VocabularyDailySetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VocabularyDailySet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? setDate = freezed,
    Object? status = freezed,
    Object? words = null,
    Object? generatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      setDate: freezed == setDate
          ? _value.setDate
          : setDate // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      words: null == words
          ? _value.words
          : words // ignore: cast_nullable_to_non_nullable
              as List<VocabularyWord>,
      generatedAt: freezed == generatedAt
          ? _value.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VocabularyDailySetImplCopyWith<$Res>
    implements $VocabularyDailySetCopyWith<$Res> {
  factory _$$VocabularyDailySetImplCopyWith(_$VocabularyDailySetImpl value,
          $Res Function(_$VocabularyDailySetImpl) then) =
      __$$VocabularyDailySetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'set_date') String? setDate,
      String? status,
      List<VocabularyWord> words,
      @JsonKey(name: 'generated_at') DateTime? generatedAt});
}

/// @nodoc
class __$$VocabularyDailySetImplCopyWithImpl<$Res>
    extends _$VocabularyDailySetCopyWithImpl<$Res, _$VocabularyDailySetImpl>
    implements _$$VocabularyDailySetImplCopyWith<$Res> {
  __$$VocabularyDailySetImplCopyWithImpl(_$VocabularyDailySetImpl _value,
      $Res Function(_$VocabularyDailySetImpl) _then)
      : super(_value, _then);

  /// Create a copy of VocabularyDailySet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? setDate = freezed,
    Object? status = freezed,
    Object? words = null,
    Object? generatedAt = freezed,
  }) {
    return _then(_$VocabularyDailySetImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      setDate: freezed == setDate
          ? _value.setDate
          : setDate // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      words: null == words
          ? _value._words
          : words // ignore: cast_nullable_to_non_nullable
              as List<VocabularyWord>,
      generatedAt: freezed == generatedAt
          ? _value.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VocabularyDailySetImpl implements _VocabularyDailySet {
  const _$VocabularyDailySetImpl(
      {required this.id,
      @JsonKey(name: 'set_date') this.setDate,
      this.status,
      final List<VocabularyWord> words = const [],
      @JsonKey(name: 'generated_at') this.generatedAt})
      : _words = words;

  factory _$VocabularyDailySetImpl.fromJson(Map<String, dynamic> json) =>
      _$$VocabularyDailySetImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'set_date')
  final String? setDate;
  @override
  final String? status;
  final List<VocabularyWord> _words;
  @override
  @JsonKey()
  List<VocabularyWord> get words {
    if (_words is EqualUnmodifiableListView) return _words;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_words);
  }

  @override
  @JsonKey(name: 'generated_at')
  final DateTime? generatedAt;

  @override
  String toString() {
    return 'VocabularyDailySet(id: $id, setDate: $setDate, status: $status, words: $words, generatedAt: $generatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VocabularyDailySetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.setDate, setDate) || other.setDate == setDate) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._words, _words) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, setDate, status,
      const DeepCollectionEquality().hash(_words), generatedAt);

  /// Create a copy of VocabularyDailySet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VocabularyDailySetImplCopyWith<_$VocabularyDailySetImpl> get copyWith =>
      __$$VocabularyDailySetImplCopyWithImpl<_$VocabularyDailySetImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VocabularyDailySetImplToJson(
      this,
    );
  }
}

abstract class _VocabularyDailySet implements VocabularyDailySet {
  const factory _VocabularyDailySet(
          {required final String id,
          @JsonKey(name: 'set_date') final String? setDate,
          final String? status,
          final List<VocabularyWord> words,
          @JsonKey(name: 'generated_at') final DateTime? generatedAt}) =
      _$VocabularyDailySetImpl;

  factory _VocabularyDailySet.fromJson(Map<String, dynamic> json) =
      _$VocabularyDailySetImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'set_date')
  String? get setDate;
  @override
  String? get status;
  @override
  List<VocabularyWord> get words;
  @override
  @JsonKey(name: 'generated_at')
  DateTime? get generatedAt;

  /// Create a copy of VocabularyDailySet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VocabularyDailySetImplCopyWith<_$VocabularyDailySetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VocabularyTodayResponse _$VocabularyTodayResponseFromJson(
    Map<String, dynamic> json) {
  return _VocabularyTodayResponse.fromJson(json);
}

/// @nodoc
mixin _$VocabularyTodayResponse {
  @JsonKey(name: 'set')
  VocabularyDailySet get dailySet => throw _privateConstructorUsedError;
  List<VocabularyWord> get words => throw _privateConstructorUsedError;
  List<VocabularyWordProgress> get progress =>
      throw _privateConstructorUsedError;

  /// Serializes this VocabularyTodayResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VocabularyTodayResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VocabularyTodayResponseCopyWith<VocabularyTodayResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VocabularyTodayResponseCopyWith<$Res> {
  factory $VocabularyTodayResponseCopyWith(VocabularyTodayResponse value,
          $Res Function(VocabularyTodayResponse) then) =
      _$VocabularyTodayResponseCopyWithImpl<$Res, VocabularyTodayResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'set') VocabularyDailySet dailySet,
      List<VocabularyWord> words,
      List<VocabularyWordProgress> progress});

  $VocabularyDailySetCopyWith<$Res> get dailySet;
}

/// @nodoc
class _$VocabularyTodayResponseCopyWithImpl<$Res,
        $Val extends VocabularyTodayResponse>
    implements $VocabularyTodayResponseCopyWith<$Res> {
  _$VocabularyTodayResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VocabularyTodayResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dailySet = null,
    Object? words = null,
    Object? progress = null,
  }) {
    return _then(_value.copyWith(
      dailySet: null == dailySet
          ? _value.dailySet
          : dailySet // ignore: cast_nullable_to_non_nullable
              as VocabularyDailySet,
      words: null == words
          ? _value.words
          : words // ignore: cast_nullable_to_non_nullable
              as List<VocabularyWord>,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as List<VocabularyWordProgress>,
    ) as $Val);
  }

  /// Create a copy of VocabularyTodayResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VocabularyDailySetCopyWith<$Res> get dailySet {
    return $VocabularyDailySetCopyWith<$Res>(_value.dailySet, (value) {
      return _then(_value.copyWith(dailySet: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VocabularyTodayResponseImplCopyWith<$Res>
    implements $VocabularyTodayResponseCopyWith<$Res> {
  factory _$$VocabularyTodayResponseImplCopyWith(
          _$VocabularyTodayResponseImpl value,
          $Res Function(_$VocabularyTodayResponseImpl) then) =
      __$$VocabularyTodayResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'set') VocabularyDailySet dailySet,
      List<VocabularyWord> words,
      List<VocabularyWordProgress> progress});

  @override
  $VocabularyDailySetCopyWith<$Res> get dailySet;
}

/// @nodoc
class __$$VocabularyTodayResponseImplCopyWithImpl<$Res>
    extends _$VocabularyTodayResponseCopyWithImpl<$Res,
        _$VocabularyTodayResponseImpl>
    implements _$$VocabularyTodayResponseImplCopyWith<$Res> {
  __$$VocabularyTodayResponseImplCopyWithImpl(
      _$VocabularyTodayResponseImpl _value,
      $Res Function(_$VocabularyTodayResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of VocabularyTodayResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dailySet = null,
    Object? words = null,
    Object? progress = null,
  }) {
    return _then(_$VocabularyTodayResponseImpl(
      dailySet: null == dailySet
          ? _value.dailySet
          : dailySet // ignore: cast_nullable_to_non_nullable
              as VocabularyDailySet,
      words: null == words
          ? _value._words
          : words // ignore: cast_nullable_to_non_nullable
              as List<VocabularyWord>,
      progress: null == progress
          ? _value._progress
          : progress // ignore: cast_nullable_to_non_nullable
              as List<VocabularyWordProgress>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VocabularyTodayResponseImpl implements _VocabularyTodayResponse {
  const _$VocabularyTodayResponseImpl(
      {@JsonKey(name: 'set') required this.dailySet,
      final List<VocabularyWord> words = const [],
      final List<VocabularyWordProgress> progress = const []})
      : _words = words,
        _progress = progress;

  factory _$VocabularyTodayResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$VocabularyTodayResponseImplFromJson(json);

  @override
  @JsonKey(name: 'set')
  final VocabularyDailySet dailySet;
  final List<VocabularyWord> _words;
  @override
  @JsonKey()
  List<VocabularyWord> get words {
    if (_words is EqualUnmodifiableListView) return _words;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_words);
  }

  final List<VocabularyWordProgress> _progress;
  @override
  @JsonKey()
  List<VocabularyWordProgress> get progress {
    if (_progress is EqualUnmodifiableListView) return _progress;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_progress);
  }

  @override
  String toString() {
    return 'VocabularyTodayResponse(dailySet: $dailySet, words: $words, progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VocabularyTodayResponseImpl &&
            (identical(other.dailySet, dailySet) ||
                other.dailySet == dailySet) &&
            const DeepCollectionEquality().equals(other._words, _words) &&
            const DeepCollectionEquality().equals(other._progress, _progress));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      dailySet,
      const DeepCollectionEquality().hash(_words),
      const DeepCollectionEquality().hash(_progress));

  /// Create a copy of VocabularyTodayResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VocabularyTodayResponseImplCopyWith<_$VocabularyTodayResponseImpl>
      get copyWith => __$$VocabularyTodayResponseImplCopyWithImpl<
          _$VocabularyTodayResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VocabularyTodayResponseImplToJson(
      this,
    );
  }
}

abstract class _VocabularyTodayResponse implements VocabularyTodayResponse {
  const factory _VocabularyTodayResponse(
          {@JsonKey(name: 'set') required final VocabularyDailySet dailySet,
          final List<VocabularyWord> words,
          final List<VocabularyWordProgress> progress}) =
      _$VocabularyTodayResponseImpl;

  factory _VocabularyTodayResponse.fromJson(Map<String, dynamic> json) =
      _$VocabularyTodayResponseImpl.fromJson;

  @override
  @JsonKey(name: 'set')
  VocabularyDailySet get dailySet;
  @override
  List<VocabularyWord> get words;
  @override
  List<VocabularyWordProgress> get progress;

  /// Create a copy of VocabularyTodayResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VocabularyTodayResponseImplCopyWith<_$VocabularyTodayResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

VocabularyAttempt _$VocabularyAttemptFromJson(Map<String, dynamic> json) {
  return _VocabularyAttempt.fromJson(json);
}

/// @nodoc
mixin _$VocabularyAttempt {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'daily_set_id')
  String? get dailySetId => throw _privateConstructorUsedError;
  String? get word => throw _privateConstructorUsedError;
  String get kind => throw _privateConstructorUsedError;
  String? get source => throw _privateConstructorUsedError;
  @JsonKey(name: 'attempt_status')
  String? get attemptStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'analysis_status')
  String? get analysisStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'analysis_error')
  String? get analysisError => throw _privateConstructorUsedError;
  @JsonKey(name: 'recording_upload_status')
  String? get recordingUploadStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'audio_object_key')
  String? get audioObjectKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'audio_mime_type')
  String? get audioMimeType => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration_seconds')
  int? get durationSeconds => throw _privateConstructorUsedError;
  String? get transcript => throw _privateConstructorUsedError;
  Map<String, dynamic>? get scores => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metrics => throw _privateConstructorUsedError;
  Map<String, dynamic>? get analysis => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this VocabularyAttempt to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VocabularyAttempt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VocabularyAttemptCopyWith<VocabularyAttempt> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VocabularyAttemptCopyWith<$Res> {
  factory $VocabularyAttemptCopyWith(
          VocabularyAttempt value, $Res Function(VocabularyAttempt) then) =
      _$VocabularyAttemptCopyWithImpl<$Res, VocabularyAttempt>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'daily_set_id') String? dailySetId,
      String? word,
      String kind,
      String? source,
      @JsonKey(name: 'attempt_status') String? attemptStatus,
      @JsonKey(name: 'analysis_status') String? analysisStatus,
      @JsonKey(name: 'analysis_error') String? analysisError,
      @JsonKey(name: 'recording_upload_status') String? recordingUploadStatus,
      @JsonKey(name: 'audio_object_key') String? audioObjectKey,
      @JsonKey(name: 'audio_mime_type') String? audioMimeType,
      @JsonKey(name: 'duration_seconds') int? durationSeconds,
      String? transcript,
      Map<String, dynamic>? scores,
      Map<String, dynamic>? metrics,
      Map<String, dynamic>? analysis,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class _$VocabularyAttemptCopyWithImpl<$Res, $Val extends VocabularyAttempt>
    implements $VocabularyAttemptCopyWith<$Res> {
  _$VocabularyAttemptCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VocabularyAttempt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? dailySetId = freezed,
    Object? word = freezed,
    Object? kind = null,
    Object? source = freezed,
    Object? attemptStatus = freezed,
    Object? analysisStatus = freezed,
    Object? analysisError = freezed,
    Object? recordingUploadStatus = freezed,
    Object? audioObjectKey = freezed,
    Object? audioMimeType = freezed,
    Object? durationSeconds = freezed,
    Object? transcript = freezed,
    Object? scores = freezed,
    Object? metrics = freezed,
    Object? analysis = freezed,
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
      dailySetId: freezed == dailySetId
          ? _value.dailySetId
          : dailySetId // ignore: cast_nullable_to_non_nullable
              as String?,
      word: freezed == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String?,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
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
      recordingUploadStatus: freezed == recordingUploadStatus
          ? _value.recordingUploadStatus
          : recordingUploadStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      audioObjectKey: freezed == audioObjectKey
          ? _value.audioObjectKey
          : audioObjectKey // ignore: cast_nullable_to_non_nullable
              as String?,
      audioMimeType: freezed == audioMimeType
          ? _value.audioMimeType
          : audioMimeType // ignore: cast_nullable_to_non_nullable
              as String?,
      durationSeconds: freezed == durationSeconds
          ? _value.durationSeconds
          : durationSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      transcript: freezed == transcript
          ? _value.transcript
          : transcript // ignore: cast_nullable_to_non_nullable
              as String?,
      scores: freezed == scores
          ? _value.scores
          : scores // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      metrics: freezed == metrics
          ? _value.metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      analysis: freezed == analysis
          ? _value.analysis
          : analysis // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VocabularyAttemptImplCopyWith<$Res>
    implements $VocabularyAttemptCopyWith<$Res> {
  factory _$$VocabularyAttemptImplCopyWith(_$VocabularyAttemptImpl value,
          $Res Function(_$VocabularyAttemptImpl) then) =
      __$$VocabularyAttemptImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'daily_set_id') String? dailySetId,
      String? word,
      String kind,
      String? source,
      @JsonKey(name: 'attempt_status') String? attemptStatus,
      @JsonKey(name: 'analysis_status') String? analysisStatus,
      @JsonKey(name: 'analysis_error') String? analysisError,
      @JsonKey(name: 'recording_upload_status') String? recordingUploadStatus,
      @JsonKey(name: 'audio_object_key') String? audioObjectKey,
      @JsonKey(name: 'audio_mime_type') String? audioMimeType,
      @JsonKey(name: 'duration_seconds') int? durationSeconds,
      String? transcript,
      Map<String, dynamic>? scores,
      Map<String, dynamic>? metrics,
      Map<String, dynamic>? analysis,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class __$$VocabularyAttemptImplCopyWithImpl<$Res>
    extends _$VocabularyAttemptCopyWithImpl<$Res, _$VocabularyAttemptImpl>
    implements _$$VocabularyAttemptImplCopyWith<$Res> {
  __$$VocabularyAttemptImplCopyWithImpl(_$VocabularyAttemptImpl _value,
      $Res Function(_$VocabularyAttemptImpl) _then)
      : super(_value, _then);

  /// Create a copy of VocabularyAttempt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? dailySetId = freezed,
    Object? word = freezed,
    Object? kind = null,
    Object? source = freezed,
    Object? attemptStatus = freezed,
    Object? analysisStatus = freezed,
    Object? analysisError = freezed,
    Object? recordingUploadStatus = freezed,
    Object? audioObjectKey = freezed,
    Object? audioMimeType = freezed,
    Object? durationSeconds = freezed,
    Object? transcript = freezed,
    Object? scores = freezed,
    Object? metrics = freezed,
    Object? analysis = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$VocabularyAttemptImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      dailySetId: freezed == dailySetId
          ? _value.dailySetId
          : dailySetId // ignore: cast_nullable_to_non_nullable
              as String?,
      word: freezed == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String?,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
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
      recordingUploadStatus: freezed == recordingUploadStatus
          ? _value.recordingUploadStatus
          : recordingUploadStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      audioObjectKey: freezed == audioObjectKey
          ? _value.audioObjectKey
          : audioObjectKey // ignore: cast_nullable_to_non_nullable
              as String?,
      audioMimeType: freezed == audioMimeType
          ? _value.audioMimeType
          : audioMimeType // ignore: cast_nullable_to_non_nullable
              as String?,
      durationSeconds: freezed == durationSeconds
          ? _value.durationSeconds
          : durationSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      transcript: freezed == transcript
          ? _value.transcript
          : transcript // ignore: cast_nullable_to_non_nullable
              as String?,
      scores: freezed == scores
          ? _value._scores
          : scores // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      metrics: freezed == metrics
          ? _value._metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      analysis: freezed == analysis
          ? _value._analysis
          : analysis // ignore: cast_nullable_to_non_nullable
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
class _$VocabularyAttemptImpl implements _VocabularyAttempt {
  const _$VocabularyAttemptImpl(
      {required this.id,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'daily_set_id') this.dailySetId,
      this.word,
      required this.kind,
      this.source,
      @JsonKey(name: 'attempt_status') this.attemptStatus,
      @JsonKey(name: 'analysis_status') this.analysisStatus,
      @JsonKey(name: 'analysis_error') this.analysisError,
      @JsonKey(name: 'recording_upload_status') this.recordingUploadStatus,
      @JsonKey(name: 'audio_object_key') this.audioObjectKey,
      @JsonKey(name: 'audio_mime_type') this.audioMimeType,
      @JsonKey(name: 'duration_seconds') this.durationSeconds,
      this.transcript,
      final Map<String, dynamic>? scores,
      final Map<String, dynamic>? metrics,
      final Map<String, dynamic>? analysis,
      @JsonKey(name: 'created_at') this.createdAt})
      : _scores = scores,
        _metrics = metrics,
        _analysis = analysis;

  factory _$VocabularyAttemptImpl.fromJson(Map<String, dynamic> json) =>
      _$$VocabularyAttemptImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  @JsonKey(name: 'daily_set_id')
  final String? dailySetId;
  @override
  final String? word;
  @override
  final String kind;
  @override
  final String? source;
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
  @JsonKey(name: 'audio_object_key')
  final String? audioObjectKey;
  @override
  @JsonKey(name: 'audio_mime_type')
  final String? audioMimeType;
  @override
  @JsonKey(name: 'duration_seconds')
  final int? durationSeconds;
  @override
  final String? transcript;
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
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'VocabularyAttempt(id: $id, userId: $userId, dailySetId: $dailySetId, word: $word, kind: $kind, source: $source, attemptStatus: $attemptStatus, analysisStatus: $analysisStatus, analysisError: $analysisError, recordingUploadStatus: $recordingUploadStatus, audioObjectKey: $audioObjectKey, audioMimeType: $audioMimeType, durationSeconds: $durationSeconds, transcript: $transcript, scores: $scores, metrics: $metrics, analysis: $analysis, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VocabularyAttemptImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.dailySetId, dailySetId) ||
                other.dailySetId == dailySetId) &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.attemptStatus, attemptStatus) ||
                other.attemptStatus == attemptStatus) &&
            (identical(other.analysisStatus, analysisStatus) ||
                other.analysisStatus == analysisStatus) &&
            (identical(other.analysisError, analysisError) ||
                other.analysisError == analysisError) &&
            (identical(other.recordingUploadStatus, recordingUploadStatus) ||
                other.recordingUploadStatus == recordingUploadStatus) &&
            (identical(other.audioObjectKey, audioObjectKey) ||
                other.audioObjectKey == audioObjectKey) &&
            (identical(other.audioMimeType, audioMimeType) ||
                other.audioMimeType == audioMimeType) &&
            (identical(other.durationSeconds, durationSeconds) ||
                other.durationSeconds == durationSeconds) &&
            (identical(other.transcript, transcript) ||
                other.transcript == transcript) &&
            const DeepCollectionEquality().equals(other._scores, _scores) &&
            const DeepCollectionEquality().equals(other._metrics, _metrics) &&
            const DeepCollectionEquality().equals(other._analysis, _analysis) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      dailySetId,
      word,
      kind,
      source,
      attemptStatus,
      analysisStatus,
      analysisError,
      recordingUploadStatus,
      audioObjectKey,
      audioMimeType,
      durationSeconds,
      transcript,
      const DeepCollectionEquality().hash(_scores),
      const DeepCollectionEquality().hash(_metrics),
      const DeepCollectionEquality().hash(_analysis),
      createdAt);

  /// Create a copy of VocabularyAttempt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VocabularyAttemptImplCopyWith<_$VocabularyAttemptImpl> get copyWith =>
      __$$VocabularyAttemptImplCopyWithImpl<_$VocabularyAttemptImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VocabularyAttemptImplToJson(
      this,
    );
  }
}

abstract class _VocabularyAttempt implements VocabularyAttempt {
  const factory _VocabularyAttempt(
          {required final String id,
          @JsonKey(name: 'user_id') final String? userId,
          @JsonKey(name: 'daily_set_id') final String? dailySetId,
          final String? word,
          required final String kind,
          final String? source,
          @JsonKey(name: 'attempt_status') final String? attemptStatus,
          @JsonKey(name: 'analysis_status') final String? analysisStatus,
          @JsonKey(name: 'analysis_error') final String? analysisError,
          @JsonKey(name: 'recording_upload_status')
          final String? recordingUploadStatus,
          @JsonKey(name: 'audio_object_key') final String? audioObjectKey,
          @JsonKey(name: 'audio_mime_type') final String? audioMimeType,
          @JsonKey(name: 'duration_seconds') final int? durationSeconds,
          final String? transcript,
          final Map<String, dynamic>? scores,
          final Map<String, dynamic>? metrics,
          final Map<String, dynamic>? analysis,
          @JsonKey(name: 'created_at') final DateTime? createdAt}) =
      _$VocabularyAttemptImpl;

  factory _VocabularyAttempt.fromJson(Map<String, dynamic> json) =
      _$VocabularyAttemptImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  @JsonKey(name: 'daily_set_id')
  String? get dailySetId;
  @override
  String? get word;
  @override
  String get kind;
  @override
  String? get source;
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
  @JsonKey(name: 'audio_object_key')
  String? get audioObjectKey;
  @override
  @JsonKey(name: 'audio_mime_type')
  String? get audioMimeType;
  @override
  @JsonKey(name: 'duration_seconds')
  int? get durationSeconds;
  @override
  String? get transcript;
  @override
  Map<String, dynamic>? get scores;
  @override
  Map<String, dynamic>? get metrics;
  @override
  Map<String, dynamic>? get analysis;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of VocabularyAttempt
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VocabularyAttemptImplCopyWith<_$VocabularyAttemptImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VocabularyUpload _$VocabularyUploadFromJson(Map<String, dynamic> json) {
  return _VocabularyUpload.fromJson(json);
}

/// @nodoc
mixin _$VocabularyUpload {
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'object_key')
  String get objectKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'content_type')
  String get contentType => throw _privateConstructorUsedError;

  /// Serializes this VocabularyUpload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VocabularyUpload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VocabularyUploadCopyWith<VocabularyUpload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VocabularyUploadCopyWith<$Res> {
  factory $VocabularyUploadCopyWith(
          VocabularyUpload value, $Res Function(VocabularyUpload) then) =
      _$VocabularyUploadCopyWithImpl<$Res, VocabularyUpload>;
  @useResult
  $Res call(
      {String url,
      @JsonKey(name: 'object_key') String objectKey,
      @JsonKey(name: 'content_type') String contentType});
}

/// @nodoc
class _$VocabularyUploadCopyWithImpl<$Res, $Val extends VocabularyUpload>
    implements $VocabularyUploadCopyWith<$Res> {
  _$VocabularyUploadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VocabularyUpload
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
abstract class _$$VocabularyUploadImplCopyWith<$Res>
    implements $VocabularyUploadCopyWith<$Res> {
  factory _$$VocabularyUploadImplCopyWith(_$VocabularyUploadImpl value,
          $Res Function(_$VocabularyUploadImpl) then) =
      __$$VocabularyUploadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String url,
      @JsonKey(name: 'object_key') String objectKey,
      @JsonKey(name: 'content_type') String contentType});
}

/// @nodoc
class __$$VocabularyUploadImplCopyWithImpl<$Res>
    extends _$VocabularyUploadCopyWithImpl<$Res, _$VocabularyUploadImpl>
    implements _$$VocabularyUploadImplCopyWith<$Res> {
  __$$VocabularyUploadImplCopyWithImpl(_$VocabularyUploadImpl _value,
      $Res Function(_$VocabularyUploadImpl) _then)
      : super(_value, _then);

  /// Create a copy of VocabularyUpload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? objectKey = null,
    Object? contentType = null,
  }) {
    return _then(_$VocabularyUploadImpl(
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
class _$VocabularyUploadImpl implements _VocabularyUpload {
  const _$VocabularyUploadImpl(
      {required this.url,
      @JsonKey(name: 'object_key') required this.objectKey,
      @JsonKey(name: 'content_type') required this.contentType});

  factory _$VocabularyUploadImpl.fromJson(Map<String, dynamic> json) =>
      _$$VocabularyUploadImplFromJson(json);

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
    return 'VocabularyUpload(url: $url, objectKey: $objectKey, contentType: $contentType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VocabularyUploadImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.objectKey, objectKey) ||
                other.objectKey == objectKey) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, objectKey, contentType);

  /// Create a copy of VocabularyUpload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VocabularyUploadImplCopyWith<_$VocabularyUploadImpl> get copyWith =>
      __$$VocabularyUploadImplCopyWithImpl<_$VocabularyUploadImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VocabularyUploadImplToJson(
      this,
    );
  }
}

abstract class _VocabularyUpload implements VocabularyUpload {
  const factory _VocabularyUpload(
          {required final String url,
          @JsonKey(name: 'object_key') required final String objectKey,
          @JsonKey(name: 'content_type') required final String contentType}) =
      _$VocabularyUploadImpl;

  factory _VocabularyUpload.fromJson(Map<String, dynamic> json) =
      _$VocabularyUploadImpl.fromJson;

  @override
  String get url;
  @override
  @JsonKey(name: 'object_key')
  String get objectKey;
  @override
  @JsonKey(name: 'content_type')
  String get contentType;

  /// Create a copy of VocabularyUpload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VocabularyUploadImplCopyWith<_$VocabularyUploadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VocabularyStartResponse _$VocabularyStartResponseFromJson(
    Map<String, dynamic> json) {
  return _VocabularyStartResponse.fromJson(json);
}

/// @nodoc
mixin _$VocabularyStartResponse {
  VocabularyAttempt get attempt => throw _privateConstructorUsedError;
  VocabularyUpload get upload => throw _privateConstructorUsedError;

  /// Serializes this VocabularyStartResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VocabularyStartResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VocabularyStartResponseCopyWith<VocabularyStartResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VocabularyStartResponseCopyWith<$Res> {
  factory $VocabularyStartResponseCopyWith(VocabularyStartResponse value,
          $Res Function(VocabularyStartResponse) then) =
      _$VocabularyStartResponseCopyWithImpl<$Res, VocabularyStartResponse>;
  @useResult
  $Res call({VocabularyAttempt attempt, VocabularyUpload upload});

  $VocabularyAttemptCopyWith<$Res> get attempt;
  $VocabularyUploadCopyWith<$Res> get upload;
}

/// @nodoc
class _$VocabularyStartResponseCopyWithImpl<$Res,
        $Val extends VocabularyStartResponse>
    implements $VocabularyStartResponseCopyWith<$Res> {
  _$VocabularyStartResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VocabularyStartResponse
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
              as VocabularyAttempt,
      upload: null == upload
          ? _value.upload
          : upload // ignore: cast_nullable_to_non_nullable
              as VocabularyUpload,
    ) as $Val);
  }

  /// Create a copy of VocabularyStartResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VocabularyAttemptCopyWith<$Res> get attempt {
    return $VocabularyAttemptCopyWith<$Res>(_value.attempt, (value) {
      return _then(_value.copyWith(attempt: value) as $Val);
    });
  }

  /// Create a copy of VocabularyStartResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VocabularyUploadCopyWith<$Res> get upload {
    return $VocabularyUploadCopyWith<$Res>(_value.upload, (value) {
      return _then(_value.copyWith(upload: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VocabularyStartResponseImplCopyWith<$Res>
    implements $VocabularyStartResponseCopyWith<$Res> {
  factory _$$VocabularyStartResponseImplCopyWith(
          _$VocabularyStartResponseImpl value,
          $Res Function(_$VocabularyStartResponseImpl) then) =
      __$$VocabularyStartResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({VocabularyAttempt attempt, VocabularyUpload upload});

  @override
  $VocabularyAttemptCopyWith<$Res> get attempt;
  @override
  $VocabularyUploadCopyWith<$Res> get upload;
}

/// @nodoc
class __$$VocabularyStartResponseImplCopyWithImpl<$Res>
    extends _$VocabularyStartResponseCopyWithImpl<$Res,
        _$VocabularyStartResponseImpl>
    implements _$$VocabularyStartResponseImplCopyWith<$Res> {
  __$$VocabularyStartResponseImplCopyWithImpl(
      _$VocabularyStartResponseImpl _value,
      $Res Function(_$VocabularyStartResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of VocabularyStartResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attempt = null,
    Object? upload = null,
  }) {
    return _then(_$VocabularyStartResponseImpl(
      attempt: null == attempt
          ? _value.attempt
          : attempt // ignore: cast_nullable_to_non_nullable
              as VocabularyAttempt,
      upload: null == upload
          ? _value.upload
          : upload // ignore: cast_nullable_to_non_nullable
              as VocabularyUpload,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VocabularyStartResponseImpl implements _VocabularyStartResponse {
  const _$VocabularyStartResponseImpl(
      {required this.attempt, required this.upload});

  factory _$VocabularyStartResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$VocabularyStartResponseImplFromJson(json);

  @override
  final VocabularyAttempt attempt;
  @override
  final VocabularyUpload upload;

  @override
  String toString() {
    return 'VocabularyStartResponse(attempt: $attempt, upload: $upload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VocabularyStartResponseImpl &&
            (identical(other.attempt, attempt) || other.attempt == attempt) &&
            (identical(other.upload, upload) || other.upload == upload));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, attempt, upload);

  /// Create a copy of VocabularyStartResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VocabularyStartResponseImplCopyWith<_$VocabularyStartResponseImpl>
      get copyWith => __$$VocabularyStartResponseImplCopyWithImpl<
          _$VocabularyStartResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VocabularyStartResponseImplToJson(
      this,
    );
  }
}

abstract class _VocabularyStartResponse implements VocabularyStartResponse {
  const factory _VocabularyStartResponse(
      {required final VocabularyAttempt attempt,
      required final VocabularyUpload upload}) = _$VocabularyStartResponseImpl;

  factory _VocabularyStartResponse.fromJson(Map<String, dynamic> json) =
      _$VocabularyStartResponseImpl.fromJson;

  @override
  VocabularyAttempt get attempt;
  @override
  VocabularyUpload get upload;

  /// Create a copy of VocabularyStartResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VocabularyStartResponseImplCopyWith<_$VocabularyStartResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

VocabularyProgressSummary _$VocabularyProgressSummaryFromJson(
    Map<String, dynamic> json) {
  return _VocabularyProgressSummary.fromJson(json);
}

/// @nodoc
mixin _$VocabularyProgressSummary {
  int get xp => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_streak')
  int get currentStreak => throw _privateConstructorUsedError;
  @JsonKey(name: 'best_streak')
  int get bestStreak => throw _privateConstructorUsedError;
  @JsonKey(name: 'mastered_count')
  int get masteredCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_active_date')
  String? get lastActiveDate => throw _privateConstructorUsedError;

  /// Serializes this VocabularyProgressSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VocabularyProgressSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VocabularyProgressSummaryCopyWith<VocabularyProgressSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VocabularyProgressSummaryCopyWith<$Res> {
  factory $VocabularyProgressSummaryCopyWith(VocabularyProgressSummary value,
          $Res Function(VocabularyProgressSummary) then) =
      _$VocabularyProgressSummaryCopyWithImpl<$Res, VocabularyProgressSummary>;
  @useResult
  $Res call(
      {int xp,
      int level,
      @JsonKey(name: 'current_streak') int currentStreak,
      @JsonKey(name: 'best_streak') int bestStreak,
      @JsonKey(name: 'mastered_count') int masteredCount,
      @JsonKey(name: 'last_active_date') String? lastActiveDate});
}

/// @nodoc
class _$VocabularyProgressSummaryCopyWithImpl<$Res,
        $Val extends VocabularyProgressSummary>
    implements $VocabularyProgressSummaryCopyWith<$Res> {
  _$VocabularyProgressSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VocabularyProgressSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? xp = null,
    Object? level = null,
    Object? currentStreak = null,
    Object? bestStreak = null,
    Object? masteredCount = null,
    Object? lastActiveDate = freezed,
  }) {
    return _then(_value.copyWith(
      xp: null == xp
          ? _value.xp
          : xp // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      currentStreak: null == currentStreak
          ? _value.currentStreak
          : currentStreak // ignore: cast_nullable_to_non_nullable
              as int,
      bestStreak: null == bestStreak
          ? _value.bestStreak
          : bestStreak // ignore: cast_nullable_to_non_nullable
              as int,
      masteredCount: null == masteredCount
          ? _value.masteredCount
          : masteredCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastActiveDate: freezed == lastActiveDate
          ? _value.lastActiveDate
          : lastActiveDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VocabularyProgressSummaryImplCopyWith<$Res>
    implements $VocabularyProgressSummaryCopyWith<$Res> {
  factory _$$VocabularyProgressSummaryImplCopyWith(
          _$VocabularyProgressSummaryImpl value,
          $Res Function(_$VocabularyProgressSummaryImpl) then) =
      __$$VocabularyProgressSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int xp,
      int level,
      @JsonKey(name: 'current_streak') int currentStreak,
      @JsonKey(name: 'best_streak') int bestStreak,
      @JsonKey(name: 'mastered_count') int masteredCount,
      @JsonKey(name: 'last_active_date') String? lastActiveDate});
}

/// @nodoc
class __$$VocabularyProgressSummaryImplCopyWithImpl<$Res>
    extends _$VocabularyProgressSummaryCopyWithImpl<$Res,
        _$VocabularyProgressSummaryImpl>
    implements _$$VocabularyProgressSummaryImplCopyWith<$Res> {
  __$$VocabularyProgressSummaryImplCopyWithImpl(
      _$VocabularyProgressSummaryImpl _value,
      $Res Function(_$VocabularyProgressSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of VocabularyProgressSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? xp = null,
    Object? level = null,
    Object? currentStreak = null,
    Object? bestStreak = null,
    Object? masteredCount = null,
    Object? lastActiveDate = freezed,
  }) {
    return _then(_$VocabularyProgressSummaryImpl(
      xp: null == xp
          ? _value.xp
          : xp // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      currentStreak: null == currentStreak
          ? _value.currentStreak
          : currentStreak // ignore: cast_nullable_to_non_nullable
              as int,
      bestStreak: null == bestStreak
          ? _value.bestStreak
          : bestStreak // ignore: cast_nullable_to_non_nullable
              as int,
      masteredCount: null == masteredCount
          ? _value.masteredCount
          : masteredCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastActiveDate: freezed == lastActiveDate
          ? _value.lastActiveDate
          : lastActiveDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VocabularyProgressSummaryImpl implements _VocabularyProgressSummary {
  const _$VocabularyProgressSummaryImpl(
      {this.xp = 0,
      this.level = 1,
      @JsonKey(name: 'current_streak') this.currentStreak = 0,
      @JsonKey(name: 'best_streak') this.bestStreak = 0,
      @JsonKey(name: 'mastered_count') this.masteredCount = 0,
      @JsonKey(name: 'last_active_date') this.lastActiveDate});

  factory _$VocabularyProgressSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$VocabularyProgressSummaryImplFromJson(json);

  @override
  @JsonKey()
  final int xp;
  @override
  @JsonKey()
  final int level;
  @override
  @JsonKey(name: 'current_streak')
  final int currentStreak;
  @override
  @JsonKey(name: 'best_streak')
  final int bestStreak;
  @override
  @JsonKey(name: 'mastered_count')
  final int masteredCount;
  @override
  @JsonKey(name: 'last_active_date')
  final String? lastActiveDate;

  @override
  String toString() {
    return 'VocabularyProgressSummary(xp: $xp, level: $level, currentStreak: $currentStreak, bestStreak: $bestStreak, masteredCount: $masteredCount, lastActiveDate: $lastActiveDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VocabularyProgressSummaryImpl &&
            (identical(other.xp, xp) || other.xp == xp) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.currentStreak, currentStreak) ||
                other.currentStreak == currentStreak) &&
            (identical(other.bestStreak, bestStreak) ||
                other.bestStreak == bestStreak) &&
            (identical(other.masteredCount, masteredCount) ||
                other.masteredCount == masteredCount) &&
            (identical(other.lastActiveDate, lastActiveDate) ||
                other.lastActiveDate == lastActiveDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, xp, level, currentStreak,
      bestStreak, masteredCount, lastActiveDate);

  /// Create a copy of VocabularyProgressSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VocabularyProgressSummaryImplCopyWith<_$VocabularyProgressSummaryImpl>
      get copyWith => __$$VocabularyProgressSummaryImplCopyWithImpl<
          _$VocabularyProgressSummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VocabularyProgressSummaryImplToJson(
      this,
    );
  }
}

abstract class _VocabularyProgressSummary implements VocabularyProgressSummary {
  const factory _VocabularyProgressSummary(
          {final int xp,
          final int level,
          @JsonKey(name: 'current_streak') final int currentStreak,
          @JsonKey(name: 'best_streak') final int bestStreak,
          @JsonKey(name: 'mastered_count') final int masteredCount,
          @JsonKey(name: 'last_active_date') final String? lastActiveDate}) =
      _$VocabularyProgressSummaryImpl;

  factory _VocabularyProgressSummary.fromJson(Map<String, dynamic> json) =
      _$VocabularyProgressSummaryImpl.fromJson;

  @override
  int get xp;
  @override
  int get level;
  @override
  @JsonKey(name: 'current_streak')
  int get currentStreak;
  @override
  @JsonKey(name: 'best_streak')
  int get bestStreak;
  @override
  @JsonKey(name: 'mastered_count')
  int get masteredCount;
  @override
  @JsonKey(name: 'last_active_date')
  String? get lastActiveDate;

  /// Create a copy of VocabularyProgressSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VocabularyProgressSummaryImplCopyWith<_$VocabularyProgressSummaryImpl>
      get copyWith => throw _privateConstructorUsedError;
}

VocabularyLibraryEntry _$VocabularyLibraryEntryFromJson(
    Map<String, dynamic> json) {
  return _VocabularyLibraryEntry.fromJson(json);
}

/// @nodoc
mixin _$VocabularyLibraryEntry {
  String get word => throw _privateConstructorUsedError;
  @JsonKey(name: 'word_data')
  Map<String, dynamic>? get wordData => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  int? get box => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_review_date')
  String? get nextReviewDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'times_reviewed')
  int get timesReviewed => throw _privateConstructorUsedError;
  @JsonKey(name: 'times_correct')
  int get timesCorrect => throw _privateConstructorUsedError;
  @JsonKey(name: 'times_forgotten')
  int get timesForgotten => throw _privateConstructorUsedError;

  /// Serializes this VocabularyLibraryEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VocabularyLibraryEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VocabularyLibraryEntryCopyWith<VocabularyLibraryEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VocabularyLibraryEntryCopyWith<$Res> {
  factory $VocabularyLibraryEntryCopyWith(VocabularyLibraryEntry value,
          $Res Function(VocabularyLibraryEntry) then) =
      _$VocabularyLibraryEntryCopyWithImpl<$Res, VocabularyLibraryEntry>;
  @useResult
  $Res call(
      {String word,
      @JsonKey(name: 'word_data') Map<String, dynamic>? wordData,
      String? status,
      int? box,
      @JsonKey(name: 'next_review_date') String? nextReviewDate,
      @JsonKey(name: 'times_reviewed') int timesReviewed,
      @JsonKey(name: 'times_correct') int timesCorrect,
      @JsonKey(name: 'times_forgotten') int timesForgotten});
}

/// @nodoc
class _$VocabularyLibraryEntryCopyWithImpl<$Res,
        $Val extends VocabularyLibraryEntry>
    implements $VocabularyLibraryEntryCopyWith<$Res> {
  _$VocabularyLibraryEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VocabularyLibraryEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? wordData = freezed,
    Object? status = freezed,
    Object? box = freezed,
    Object? nextReviewDate = freezed,
    Object? timesReviewed = null,
    Object? timesCorrect = null,
    Object? timesForgotten = null,
  }) {
    return _then(_value.copyWith(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      wordData: freezed == wordData
          ? _value.wordData
          : wordData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      box: freezed == box
          ? _value.box
          : box // ignore: cast_nullable_to_non_nullable
              as int?,
      nextReviewDate: freezed == nextReviewDate
          ? _value.nextReviewDate
          : nextReviewDate // ignore: cast_nullable_to_non_nullable
              as String?,
      timesReviewed: null == timesReviewed
          ? _value.timesReviewed
          : timesReviewed // ignore: cast_nullable_to_non_nullable
              as int,
      timesCorrect: null == timesCorrect
          ? _value.timesCorrect
          : timesCorrect // ignore: cast_nullable_to_non_nullable
              as int,
      timesForgotten: null == timesForgotten
          ? _value.timesForgotten
          : timesForgotten // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VocabularyLibraryEntryImplCopyWith<$Res>
    implements $VocabularyLibraryEntryCopyWith<$Res> {
  factory _$$VocabularyLibraryEntryImplCopyWith(
          _$VocabularyLibraryEntryImpl value,
          $Res Function(_$VocabularyLibraryEntryImpl) then) =
      __$$VocabularyLibraryEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String word,
      @JsonKey(name: 'word_data') Map<String, dynamic>? wordData,
      String? status,
      int? box,
      @JsonKey(name: 'next_review_date') String? nextReviewDate,
      @JsonKey(name: 'times_reviewed') int timesReviewed,
      @JsonKey(name: 'times_correct') int timesCorrect,
      @JsonKey(name: 'times_forgotten') int timesForgotten});
}

/// @nodoc
class __$$VocabularyLibraryEntryImplCopyWithImpl<$Res>
    extends _$VocabularyLibraryEntryCopyWithImpl<$Res,
        _$VocabularyLibraryEntryImpl>
    implements _$$VocabularyLibraryEntryImplCopyWith<$Res> {
  __$$VocabularyLibraryEntryImplCopyWithImpl(
      _$VocabularyLibraryEntryImpl _value,
      $Res Function(_$VocabularyLibraryEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of VocabularyLibraryEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? wordData = freezed,
    Object? status = freezed,
    Object? box = freezed,
    Object? nextReviewDate = freezed,
    Object? timesReviewed = null,
    Object? timesCorrect = null,
    Object? timesForgotten = null,
  }) {
    return _then(_$VocabularyLibraryEntryImpl(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      wordData: freezed == wordData
          ? _value._wordData
          : wordData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      box: freezed == box
          ? _value.box
          : box // ignore: cast_nullable_to_non_nullable
              as int?,
      nextReviewDate: freezed == nextReviewDate
          ? _value.nextReviewDate
          : nextReviewDate // ignore: cast_nullable_to_non_nullable
              as String?,
      timesReviewed: null == timesReviewed
          ? _value.timesReviewed
          : timesReviewed // ignore: cast_nullable_to_non_nullable
              as int,
      timesCorrect: null == timesCorrect
          ? _value.timesCorrect
          : timesCorrect // ignore: cast_nullable_to_non_nullable
              as int,
      timesForgotten: null == timesForgotten
          ? _value.timesForgotten
          : timesForgotten // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VocabularyLibraryEntryImpl implements _VocabularyLibraryEntry {
  const _$VocabularyLibraryEntryImpl(
      {required this.word,
      @JsonKey(name: 'word_data') final Map<String, dynamic>? wordData,
      this.status,
      this.box,
      @JsonKey(name: 'next_review_date') this.nextReviewDate,
      @JsonKey(name: 'times_reviewed') this.timesReviewed = 0,
      @JsonKey(name: 'times_correct') this.timesCorrect = 0,
      @JsonKey(name: 'times_forgotten') this.timesForgotten = 0})
      : _wordData = wordData;

  factory _$VocabularyLibraryEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$VocabularyLibraryEntryImplFromJson(json);

  @override
  final String word;
  final Map<String, dynamic>? _wordData;
  @override
  @JsonKey(name: 'word_data')
  Map<String, dynamic>? get wordData {
    final value = _wordData;
    if (value == null) return null;
    if (_wordData is EqualUnmodifiableMapView) return _wordData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? status;
  @override
  final int? box;
  @override
  @JsonKey(name: 'next_review_date')
  final String? nextReviewDate;
  @override
  @JsonKey(name: 'times_reviewed')
  final int timesReviewed;
  @override
  @JsonKey(name: 'times_correct')
  final int timesCorrect;
  @override
  @JsonKey(name: 'times_forgotten')
  final int timesForgotten;

  @override
  String toString() {
    return 'VocabularyLibraryEntry(word: $word, wordData: $wordData, status: $status, box: $box, nextReviewDate: $nextReviewDate, timesReviewed: $timesReviewed, timesCorrect: $timesCorrect, timesForgotten: $timesForgotten)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VocabularyLibraryEntryImpl &&
            (identical(other.word, word) || other.word == word) &&
            const DeepCollectionEquality().equals(other._wordData, _wordData) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.box, box) || other.box == box) &&
            (identical(other.nextReviewDate, nextReviewDate) ||
                other.nextReviewDate == nextReviewDate) &&
            (identical(other.timesReviewed, timesReviewed) ||
                other.timesReviewed == timesReviewed) &&
            (identical(other.timesCorrect, timesCorrect) ||
                other.timesCorrect == timesCorrect) &&
            (identical(other.timesForgotten, timesForgotten) ||
                other.timesForgotten == timesForgotten));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      word,
      const DeepCollectionEquality().hash(_wordData),
      status,
      box,
      nextReviewDate,
      timesReviewed,
      timesCorrect,
      timesForgotten);

  /// Create a copy of VocabularyLibraryEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VocabularyLibraryEntryImplCopyWith<_$VocabularyLibraryEntryImpl>
      get copyWith => __$$VocabularyLibraryEntryImplCopyWithImpl<
          _$VocabularyLibraryEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VocabularyLibraryEntryImplToJson(
      this,
    );
  }
}

abstract class _VocabularyLibraryEntry implements VocabularyLibraryEntry {
  const factory _VocabularyLibraryEntry(
          {required final String word,
          @JsonKey(name: 'word_data') final Map<String, dynamic>? wordData,
          final String? status,
          final int? box,
          @JsonKey(name: 'next_review_date') final String? nextReviewDate,
          @JsonKey(name: 'times_reviewed') final int timesReviewed,
          @JsonKey(name: 'times_correct') final int timesCorrect,
          @JsonKey(name: 'times_forgotten') final int timesForgotten}) =
      _$VocabularyLibraryEntryImpl;

  factory _VocabularyLibraryEntry.fromJson(Map<String, dynamic> json) =
      _$VocabularyLibraryEntryImpl.fromJson;

  @override
  String get word;
  @override
  @JsonKey(name: 'word_data')
  Map<String, dynamic>? get wordData;
  @override
  String? get status;
  @override
  int? get box;
  @override
  @JsonKey(name: 'next_review_date')
  String? get nextReviewDate;
  @override
  @JsonKey(name: 'times_reviewed')
  int get timesReviewed;
  @override
  @JsonKey(name: 'times_correct')
  int get timesCorrect;
  @override
  @JsonKey(name: 'times_forgotten')
  int get timesForgotten;

  /// Create a copy of VocabularyLibraryEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VocabularyLibraryEntryImplCopyWith<_$VocabularyLibraryEntryImpl>
      get copyWith => throw _privateConstructorUsedError;
}
