// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ielts_block.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

McOption _$McOptionFromJson(Map<String, dynamic> json) {
  return _McOption.fromJson(json);
}

/// @nodoc
mixin _$McOption {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  /// Serializes this McOption to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of McOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $McOptionCopyWith<McOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $McOptionCopyWith<$Res> {
  factory $McOptionCopyWith(McOption value, $Res Function(McOption) then) =
      _$McOptionCopyWithImpl<$Res, McOption>;
  @useResult
  $Res call({String id, String text});
}

/// @nodoc
class _$McOptionCopyWithImpl<$Res, $Val extends McOption>
    implements $McOptionCopyWith<$Res> {
  _$McOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of McOption
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
abstract class _$$McOptionImplCopyWith<$Res>
    implements $McOptionCopyWith<$Res> {
  factory _$$McOptionImplCopyWith(
          _$McOptionImpl value, $Res Function(_$McOptionImpl) then) =
      __$$McOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String text});
}

/// @nodoc
class __$$McOptionImplCopyWithImpl<$Res>
    extends _$McOptionCopyWithImpl<$Res, _$McOptionImpl>
    implements _$$McOptionImplCopyWith<$Res> {
  __$$McOptionImplCopyWithImpl(
      _$McOptionImpl _value, $Res Function(_$McOptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of McOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
  }) {
    return _then(_$McOptionImpl(
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
class _$McOptionImpl implements _McOption {
  const _$McOptionImpl({required this.id, required this.text});

  factory _$McOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$McOptionImplFromJson(json);

  @override
  final String id;
  @override
  final String text;

  @override
  String toString() {
    return 'McOption(id: $id, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$McOptionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, text);

  /// Create a copy of McOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$McOptionImplCopyWith<_$McOptionImpl> get copyWith =>
      __$$McOptionImplCopyWithImpl<_$McOptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$McOptionImplToJson(
      this,
    );
  }
}

abstract class _McOption implements McOption {
  const factory _McOption(
      {required final String id, required final String text}) = _$McOptionImpl;

  factory _McOption.fromJson(Map<String, dynamic> json) =
      _$McOptionImpl.fromJson;

  @override
  String get id;
  @override
  String get text;

  /// Create a copy of McOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$McOptionImplCopyWith<_$McOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VocabUpgrade _$VocabUpgradeFromJson(Map<String, dynamic> json) {
  return _VocabUpgrade.fromJson(json);
}

/// @nodoc
mixin _$VocabUpgrade {
  String get phrase => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  /// Serializes this VocabUpgrade to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VocabUpgrade
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VocabUpgradeCopyWith<VocabUpgrade> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VocabUpgradeCopyWith<$Res> {
  factory $VocabUpgradeCopyWith(
          VocabUpgrade value, $Res Function(VocabUpgrade) then) =
      _$VocabUpgradeCopyWithImpl<$Res, VocabUpgrade>;
  @useResult
  $Res call({String phrase, String? note});
}

/// @nodoc
class _$VocabUpgradeCopyWithImpl<$Res, $Val extends VocabUpgrade>
    implements $VocabUpgradeCopyWith<$Res> {
  _$VocabUpgradeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VocabUpgrade
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phrase = null,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      phrase: null == phrase
          ? _value.phrase
          : phrase // ignore: cast_nullable_to_non_nullable
              as String,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VocabUpgradeImplCopyWith<$Res>
    implements $VocabUpgradeCopyWith<$Res> {
  factory _$$VocabUpgradeImplCopyWith(
          _$VocabUpgradeImpl value, $Res Function(_$VocabUpgradeImpl) then) =
      __$$VocabUpgradeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phrase, String? note});
}

/// @nodoc
class __$$VocabUpgradeImplCopyWithImpl<$Res>
    extends _$VocabUpgradeCopyWithImpl<$Res, _$VocabUpgradeImpl>
    implements _$$VocabUpgradeImplCopyWith<$Res> {
  __$$VocabUpgradeImplCopyWithImpl(
      _$VocabUpgradeImpl _value, $Res Function(_$VocabUpgradeImpl) _then)
      : super(_value, _then);

  /// Create a copy of VocabUpgrade
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phrase = null,
    Object? note = freezed,
  }) {
    return _then(_$VocabUpgradeImpl(
      phrase: null == phrase
          ? _value.phrase
          : phrase // ignore: cast_nullable_to_non_nullable
              as String,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VocabUpgradeImpl implements _VocabUpgrade {
  const _$VocabUpgradeImpl({required this.phrase, this.note});

  factory _$VocabUpgradeImpl.fromJson(Map<String, dynamic> json) =>
      _$$VocabUpgradeImplFromJson(json);

  @override
  final String phrase;
  @override
  final String? note;

  @override
  String toString() {
    return 'VocabUpgrade(phrase: $phrase, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VocabUpgradeImpl &&
            (identical(other.phrase, phrase) || other.phrase == phrase) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, phrase, note);

  /// Create a copy of VocabUpgrade
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VocabUpgradeImplCopyWith<_$VocabUpgradeImpl> get copyWith =>
      __$$VocabUpgradeImplCopyWithImpl<_$VocabUpgradeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VocabUpgradeImplToJson(
      this,
    );
  }
}

abstract class _VocabUpgrade implements VocabUpgrade {
  const factory _VocabUpgrade(
      {required final String phrase, final String? note}) = _$VocabUpgradeImpl;

  factory _VocabUpgrade.fromJson(Map<String, dynamic> json) =
      _$VocabUpgradeImpl.fromJson;

  @override
  String get phrase;
  @override
  String? get note;

  /// Create a copy of VocabUpgrade
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VocabUpgradeImplCopyWith<_$VocabUpgradeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IeltsBlock _$IeltsBlockFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'explanation':
      return ExplanationBlock.fromJson(json);
    case 'example_answer':
      return ExampleAnswerBlock.fromJson(json);
    case 'weak_strong':
      return WeakStrongBlock.fromJson(json);
    case 'formula':
      return FormulaBlock.fromJson(json);
    case 'multiple_choice':
      return MultipleChoiceBlock.fromJson(json);
    case 'record_answer':
      return RecordAnswerBlock.fromJson(json);
    case 'cue_card':
      return CueCardBlock.fromJson(json);
    case 'vocabulary_upgrade':
      return VocabularyUpgradeBlock.fromJson(json);
    case 'pronunciation':
      return PronunciationBlock.fromJson(json);
    case 'ai_tutor_mock':
      return AiTutorMockBlock.fromJson(json);
    case 'summary':
      return SummaryBlock.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json, 'type', 'IeltsBlock', 'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$IeltsBlock {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title, String body) explanation,
    required TResult Function(String prompt, String weakAnswer,
            String strongAnswer, String whyStrong)
        exampleAnswer,
    required TResult Function(String weak, String strong, String notes)
        weakStrong,
    required TResult Function(String formulaName, List<String> steps) formula,
    required TResult Function(String question, List<McOption> options,
            String correctOptionId, String explanation)
        multipleChoice,
    required TResult Function(String prompt, int durationSeconds,
            IeltsPart targetPart, String instructions, String? gradingRubric)
        recordAnswer,
    required TResult Function(String topic, List<String> bulletPoints,
            int prepSeconds, int speakingSeconds)
        cueCard,
    required TResult Function(
            String basicPhrase,
            List<VocabUpgrade> upgradedPhrases,
            String practicePrompt,
            int durationSeconds)
        vocabularyUpgrade,
    required TResult Function(
            String phrase,
            PronunciationFocus focus,
            String modelText,
            int recordingSeconds,
            String? followUpPrompt,
            int? followUpSeconds)
        pronunciation,
    required TResult Function(String instructions, int estimatedMinutes)
        aiTutorMock,
    required TResult Function(List<String> keyTakeaways, String? nextLessonId)
        summary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title, String body)? explanation,
    TResult? Function(String prompt, String weakAnswer, String strongAnswer,
            String whyStrong)?
        exampleAnswer,
    TResult? Function(String weak, String strong, String notes)? weakStrong,
    TResult? Function(String formulaName, List<String> steps)? formula,
    TResult? Function(String question, List<McOption> options,
            String correctOptionId, String explanation)?
        multipleChoice,
    TResult? Function(String prompt, int durationSeconds, IeltsPart targetPart,
            String instructions, String? gradingRubric)?
        recordAnswer,
    TResult? Function(String topic, List<String> bulletPoints, int prepSeconds,
            int speakingSeconds)?
        cueCard,
    TResult? Function(String basicPhrase, List<VocabUpgrade> upgradedPhrases,
            String practicePrompt, int durationSeconds)?
        vocabularyUpgrade,
    TResult? Function(String phrase, PronunciationFocus focus, String modelText,
            int recordingSeconds, String? followUpPrompt, int? followUpSeconds)?
        pronunciation,
    TResult? Function(String instructions, int estimatedMinutes)? aiTutorMock,
    TResult? Function(List<String> keyTakeaways, String? nextLessonId)? summary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, String body)? explanation,
    TResult Function(String prompt, String weakAnswer, String strongAnswer,
            String whyStrong)?
        exampleAnswer,
    TResult Function(String weak, String strong, String notes)? weakStrong,
    TResult Function(String formulaName, List<String> steps)? formula,
    TResult Function(String question, List<McOption> options,
            String correctOptionId, String explanation)?
        multipleChoice,
    TResult Function(String prompt, int durationSeconds, IeltsPart targetPart,
            String instructions, String? gradingRubric)?
        recordAnswer,
    TResult Function(String topic, List<String> bulletPoints, int prepSeconds,
            int speakingSeconds)?
        cueCard,
    TResult Function(String basicPhrase, List<VocabUpgrade> upgradedPhrases,
            String practicePrompt, int durationSeconds)?
        vocabularyUpgrade,
    TResult Function(String phrase, PronunciationFocus focus, String modelText,
            int recordingSeconds, String? followUpPrompt, int? followUpSeconds)?
        pronunciation,
    TResult Function(String instructions, int estimatedMinutes)? aiTutorMock,
    TResult Function(List<String> keyTakeaways, String? nextLessonId)? summary,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExplanationBlock value) explanation,
    required TResult Function(ExampleAnswerBlock value) exampleAnswer,
    required TResult Function(WeakStrongBlock value) weakStrong,
    required TResult Function(FormulaBlock value) formula,
    required TResult Function(MultipleChoiceBlock value) multipleChoice,
    required TResult Function(RecordAnswerBlock value) recordAnswer,
    required TResult Function(CueCardBlock value) cueCard,
    required TResult Function(VocabularyUpgradeBlock value) vocabularyUpgrade,
    required TResult Function(PronunciationBlock value) pronunciation,
    required TResult Function(AiTutorMockBlock value) aiTutorMock,
    required TResult Function(SummaryBlock value) summary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExplanationBlock value)? explanation,
    TResult? Function(ExampleAnswerBlock value)? exampleAnswer,
    TResult? Function(WeakStrongBlock value)? weakStrong,
    TResult? Function(FormulaBlock value)? formula,
    TResult? Function(MultipleChoiceBlock value)? multipleChoice,
    TResult? Function(RecordAnswerBlock value)? recordAnswer,
    TResult? Function(CueCardBlock value)? cueCard,
    TResult? Function(VocabularyUpgradeBlock value)? vocabularyUpgrade,
    TResult? Function(PronunciationBlock value)? pronunciation,
    TResult? Function(AiTutorMockBlock value)? aiTutorMock,
    TResult? Function(SummaryBlock value)? summary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExplanationBlock value)? explanation,
    TResult Function(ExampleAnswerBlock value)? exampleAnswer,
    TResult Function(WeakStrongBlock value)? weakStrong,
    TResult Function(FormulaBlock value)? formula,
    TResult Function(MultipleChoiceBlock value)? multipleChoice,
    TResult Function(RecordAnswerBlock value)? recordAnswer,
    TResult Function(CueCardBlock value)? cueCard,
    TResult Function(VocabularyUpgradeBlock value)? vocabularyUpgrade,
    TResult Function(PronunciationBlock value)? pronunciation,
    TResult Function(AiTutorMockBlock value)? aiTutorMock,
    TResult Function(SummaryBlock value)? summary,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this IeltsBlock to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IeltsBlockCopyWith<$Res> {
  factory $IeltsBlockCopyWith(
          IeltsBlock value, $Res Function(IeltsBlock) then) =
      _$IeltsBlockCopyWithImpl<$Res, IeltsBlock>;
}

/// @nodoc
class _$IeltsBlockCopyWithImpl<$Res, $Val extends IeltsBlock>
    implements $IeltsBlockCopyWith<$Res> {
  _$IeltsBlockCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IeltsBlock
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ExplanationBlockImplCopyWith<$Res> {
  factory _$$ExplanationBlockImplCopyWith(_$ExplanationBlockImpl value,
          $Res Function(_$ExplanationBlockImpl) then) =
      __$$ExplanationBlockImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String title, String body});
}

/// @nodoc
class __$$ExplanationBlockImplCopyWithImpl<$Res>
    extends _$IeltsBlockCopyWithImpl<$Res, _$ExplanationBlockImpl>
    implements _$$ExplanationBlockImplCopyWith<$Res> {
  __$$ExplanationBlockImplCopyWithImpl(_$ExplanationBlockImpl _value,
      $Res Function(_$ExplanationBlockImpl) _then)
      : super(_value, _then);

  /// Create a copy of IeltsBlock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? body = null,
  }) {
    return _then(_$ExplanationBlockImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExplanationBlockImpl implements ExplanationBlock {
  const _$ExplanationBlockImpl(
      {required this.title, required this.body, final String? $type})
      : $type = $type ?? 'explanation';

  factory _$ExplanationBlockImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExplanationBlockImplFromJson(json);

  @override
  final String title;
  @override
  final String body;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'IeltsBlock.explanation(title: $title, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExplanationBlockImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, body);

  /// Create a copy of IeltsBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExplanationBlockImplCopyWith<_$ExplanationBlockImpl> get copyWith =>
      __$$ExplanationBlockImplCopyWithImpl<_$ExplanationBlockImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title, String body) explanation,
    required TResult Function(String prompt, String weakAnswer,
            String strongAnswer, String whyStrong)
        exampleAnswer,
    required TResult Function(String weak, String strong, String notes)
        weakStrong,
    required TResult Function(String formulaName, List<String> steps) formula,
    required TResult Function(String question, List<McOption> options,
            String correctOptionId, String explanation)
        multipleChoice,
    required TResult Function(String prompt, int durationSeconds,
            IeltsPart targetPart, String instructions, String? gradingRubric)
        recordAnswer,
    required TResult Function(String topic, List<String> bulletPoints,
            int prepSeconds, int speakingSeconds)
        cueCard,
    required TResult Function(
            String basicPhrase,
            List<VocabUpgrade> upgradedPhrases,
            String practicePrompt,
            int durationSeconds)
        vocabularyUpgrade,
    required TResult Function(
            String phrase,
            PronunciationFocus focus,
            String modelText,
            int recordingSeconds,
            String? followUpPrompt,
            int? followUpSeconds)
        pronunciation,
    required TResult Function(String instructions, int estimatedMinutes)
        aiTutorMock,
    required TResult Function(List<String> keyTakeaways, String? nextLessonId)
        summary,
  }) {
    return explanation(title, body);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title, String body)? explanation,
    TResult? Function(String prompt, String weakAnswer, String strongAnswer,
            String whyStrong)?
        exampleAnswer,
    TResult? Function(String weak, String strong, String notes)? weakStrong,
    TResult? Function(String formulaName, List<String> steps)? formula,
    TResult? Function(String question, List<McOption> options,
            String correctOptionId, String explanation)?
        multipleChoice,
    TResult? Function(String prompt, int durationSeconds, IeltsPart targetPart,
            String instructions, String? gradingRubric)?
        recordAnswer,
    TResult? Function(String topic, List<String> bulletPoints, int prepSeconds,
            int speakingSeconds)?
        cueCard,
    TResult? Function(String basicPhrase, List<VocabUpgrade> upgradedPhrases,
            String practicePrompt, int durationSeconds)?
        vocabularyUpgrade,
    TResult? Function(String phrase, PronunciationFocus focus, String modelText,
            int recordingSeconds, String? followUpPrompt, int? followUpSeconds)?
        pronunciation,
    TResult? Function(String instructions, int estimatedMinutes)? aiTutorMock,
    TResult? Function(List<String> keyTakeaways, String? nextLessonId)? summary,
  }) {
    return explanation?.call(title, body);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, String body)? explanation,
    TResult Function(String prompt, String weakAnswer, String strongAnswer,
            String whyStrong)?
        exampleAnswer,
    TResult Function(String weak, String strong, String notes)? weakStrong,
    TResult Function(String formulaName, List<String> steps)? formula,
    TResult Function(String question, List<McOption> options,
            String correctOptionId, String explanation)?
        multipleChoice,
    TResult Function(String prompt, int durationSeconds, IeltsPart targetPart,
            String instructions, String? gradingRubric)?
        recordAnswer,
    TResult Function(String topic, List<String> bulletPoints, int prepSeconds,
            int speakingSeconds)?
        cueCard,
    TResult Function(String basicPhrase, List<VocabUpgrade> upgradedPhrases,
            String practicePrompt, int durationSeconds)?
        vocabularyUpgrade,
    TResult Function(String phrase, PronunciationFocus focus, String modelText,
            int recordingSeconds, String? followUpPrompt, int? followUpSeconds)?
        pronunciation,
    TResult Function(String instructions, int estimatedMinutes)? aiTutorMock,
    TResult Function(List<String> keyTakeaways, String? nextLessonId)? summary,
    required TResult orElse(),
  }) {
    if (explanation != null) {
      return explanation(title, body);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExplanationBlock value) explanation,
    required TResult Function(ExampleAnswerBlock value) exampleAnswer,
    required TResult Function(WeakStrongBlock value) weakStrong,
    required TResult Function(FormulaBlock value) formula,
    required TResult Function(MultipleChoiceBlock value) multipleChoice,
    required TResult Function(RecordAnswerBlock value) recordAnswer,
    required TResult Function(CueCardBlock value) cueCard,
    required TResult Function(VocabularyUpgradeBlock value) vocabularyUpgrade,
    required TResult Function(PronunciationBlock value) pronunciation,
    required TResult Function(AiTutorMockBlock value) aiTutorMock,
    required TResult Function(SummaryBlock value) summary,
  }) {
    return explanation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExplanationBlock value)? explanation,
    TResult? Function(ExampleAnswerBlock value)? exampleAnswer,
    TResult? Function(WeakStrongBlock value)? weakStrong,
    TResult? Function(FormulaBlock value)? formula,
    TResult? Function(MultipleChoiceBlock value)? multipleChoice,
    TResult? Function(RecordAnswerBlock value)? recordAnswer,
    TResult? Function(CueCardBlock value)? cueCard,
    TResult? Function(VocabularyUpgradeBlock value)? vocabularyUpgrade,
    TResult? Function(PronunciationBlock value)? pronunciation,
    TResult? Function(AiTutorMockBlock value)? aiTutorMock,
    TResult? Function(SummaryBlock value)? summary,
  }) {
    return explanation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExplanationBlock value)? explanation,
    TResult Function(ExampleAnswerBlock value)? exampleAnswer,
    TResult Function(WeakStrongBlock value)? weakStrong,
    TResult Function(FormulaBlock value)? formula,
    TResult Function(MultipleChoiceBlock value)? multipleChoice,
    TResult Function(RecordAnswerBlock value)? recordAnswer,
    TResult Function(CueCardBlock value)? cueCard,
    TResult Function(VocabularyUpgradeBlock value)? vocabularyUpgrade,
    TResult Function(PronunciationBlock value)? pronunciation,
    TResult Function(AiTutorMockBlock value)? aiTutorMock,
    TResult Function(SummaryBlock value)? summary,
    required TResult orElse(),
  }) {
    if (explanation != null) {
      return explanation(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ExplanationBlockImplToJson(
      this,
    );
  }
}

abstract class ExplanationBlock implements IeltsBlock {
  const factory ExplanationBlock(
      {required final String title,
      required final String body}) = _$ExplanationBlockImpl;

  factory ExplanationBlock.fromJson(Map<String, dynamic> json) =
      _$ExplanationBlockImpl.fromJson;

  String get title;
  String get body;

  /// Create a copy of IeltsBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExplanationBlockImplCopyWith<_$ExplanationBlockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ExampleAnswerBlockImplCopyWith<$Res> {
  factory _$$ExampleAnswerBlockImplCopyWith(_$ExampleAnswerBlockImpl value,
          $Res Function(_$ExampleAnswerBlockImpl) then) =
      __$$ExampleAnswerBlockImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String prompt,
      String weakAnswer,
      String strongAnswer,
      String whyStrong});
}

/// @nodoc
class __$$ExampleAnswerBlockImplCopyWithImpl<$Res>
    extends _$IeltsBlockCopyWithImpl<$Res, _$ExampleAnswerBlockImpl>
    implements _$$ExampleAnswerBlockImplCopyWith<$Res> {
  __$$ExampleAnswerBlockImplCopyWithImpl(_$ExampleAnswerBlockImpl _value,
      $Res Function(_$ExampleAnswerBlockImpl) _then)
      : super(_value, _then);

  /// Create a copy of IeltsBlock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prompt = null,
    Object? weakAnswer = null,
    Object? strongAnswer = null,
    Object? whyStrong = null,
  }) {
    return _then(_$ExampleAnswerBlockImpl(
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
      weakAnswer: null == weakAnswer
          ? _value.weakAnswer
          : weakAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      strongAnswer: null == strongAnswer
          ? _value.strongAnswer
          : strongAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      whyStrong: null == whyStrong
          ? _value.whyStrong
          : whyStrong // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExampleAnswerBlockImpl implements ExampleAnswerBlock {
  const _$ExampleAnswerBlockImpl(
      {required this.prompt,
      required this.weakAnswer,
      required this.strongAnswer,
      required this.whyStrong,
      final String? $type})
      : $type = $type ?? 'example_answer';

  factory _$ExampleAnswerBlockImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExampleAnswerBlockImplFromJson(json);

  @override
  final String prompt;
  @override
  final String weakAnswer;
  @override
  final String strongAnswer;
  @override
  final String whyStrong;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'IeltsBlock.exampleAnswer(prompt: $prompt, weakAnswer: $weakAnswer, strongAnswer: $strongAnswer, whyStrong: $whyStrong)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExampleAnswerBlockImpl &&
            (identical(other.prompt, prompt) || other.prompt == prompt) &&
            (identical(other.weakAnswer, weakAnswer) ||
                other.weakAnswer == weakAnswer) &&
            (identical(other.strongAnswer, strongAnswer) ||
                other.strongAnswer == strongAnswer) &&
            (identical(other.whyStrong, whyStrong) ||
                other.whyStrong == whyStrong));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, prompt, weakAnswer, strongAnswer, whyStrong);

  /// Create a copy of IeltsBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExampleAnswerBlockImplCopyWith<_$ExampleAnswerBlockImpl> get copyWith =>
      __$$ExampleAnswerBlockImplCopyWithImpl<_$ExampleAnswerBlockImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title, String body) explanation,
    required TResult Function(String prompt, String weakAnswer,
            String strongAnswer, String whyStrong)
        exampleAnswer,
    required TResult Function(String weak, String strong, String notes)
        weakStrong,
    required TResult Function(String formulaName, List<String> steps) formula,
    required TResult Function(String question, List<McOption> options,
            String correctOptionId, String explanation)
        multipleChoice,
    required TResult Function(String prompt, int durationSeconds,
            IeltsPart targetPart, String instructions, String? gradingRubric)
        recordAnswer,
    required TResult Function(String topic, List<String> bulletPoints,
            int prepSeconds, int speakingSeconds)
        cueCard,
    required TResult Function(
            String basicPhrase,
            List<VocabUpgrade> upgradedPhrases,
            String practicePrompt,
            int durationSeconds)
        vocabularyUpgrade,
    required TResult Function(
            String phrase,
            PronunciationFocus focus,
            String modelText,
            int recordingSeconds,
            String? followUpPrompt,
            int? followUpSeconds)
        pronunciation,
    required TResult Function(String instructions, int estimatedMinutes)
        aiTutorMock,
    required TResult Function(List<String> keyTakeaways, String? nextLessonId)
        summary,
  }) {
    return exampleAnswer(prompt, weakAnswer, strongAnswer, whyStrong);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title, String body)? explanation,
    TResult? Function(String prompt, String weakAnswer, String strongAnswer,
            String whyStrong)?
        exampleAnswer,
    TResult? Function(String weak, String strong, String notes)? weakStrong,
    TResult? Function(String formulaName, List<String> steps)? formula,
    TResult? Function(String question, List<McOption> options,
            String correctOptionId, String explanation)?
        multipleChoice,
    TResult? Function(String prompt, int durationSeconds, IeltsPart targetPart,
            String instructions, String? gradingRubric)?
        recordAnswer,
    TResult? Function(String topic, List<String> bulletPoints, int prepSeconds,
            int speakingSeconds)?
        cueCard,
    TResult? Function(String basicPhrase, List<VocabUpgrade> upgradedPhrases,
            String practicePrompt, int durationSeconds)?
        vocabularyUpgrade,
    TResult? Function(String phrase, PronunciationFocus focus, String modelText,
            int recordingSeconds, String? followUpPrompt, int? followUpSeconds)?
        pronunciation,
    TResult? Function(String instructions, int estimatedMinutes)? aiTutorMock,
    TResult? Function(List<String> keyTakeaways, String? nextLessonId)? summary,
  }) {
    return exampleAnswer?.call(prompt, weakAnswer, strongAnswer, whyStrong);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, String body)? explanation,
    TResult Function(String prompt, String weakAnswer, String strongAnswer,
            String whyStrong)?
        exampleAnswer,
    TResult Function(String weak, String strong, String notes)? weakStrong,
    TResult Function(String formulaName, List<String> steps)? formula,
    TResult Function(String question, List<McOption> options,
            String correctOptionId, String explanation)?
        multipleChoice,
    TResult Function(String prompt, int durationSeconds, IeltsPart targetPart,
            String instructions, String? gradingRubric)?
        recordAnswer,
    TResult Function(String topic, List<String> bulletPoints, int prepSeconds,
            int speakingSeconds)?
        cueCard,
    TResult Function(String basicPhrase, List<VocabUpgrade> upgradedPhrases,
            String practicePrompt, int durationSeconds)?
        vocabularyUpgrade,
    TResult Function(String phrase, PronunciationFocus focus, String modelText,
            int recordingSeconds, String? followUpPrompt, int? followUpSeconds)?
        pronunciation,
    TResult Function(String instructions, int estimatedMinutes)? aiTutorMock,
    TResult Function(List<String> keyTakeaways, String? nextLessonId)? summary,
    required TResult orElse(),
  }) {
    if (exampleAnswer != null) {
      return exampleAnswer(prompt, weakAnswer, strongAnswer, whyStrong);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExplanationBlock value) explanation,
    required TResult Function(ExampleAnswerBlock value) exampleAnswer,
    required TResult Function(WeakStrongBlock value) weakStrong,
    required TResult Function(FormulaBlock value) formula,
    required TResult Function(MultipleChoiceBlock value) multipleChoice,
    required TResult Function(RecordAnswerBlock value) recordAnswer,
    required TResult Function(CueCardBlock value) cueCard,
    required TResult Function(VocabularyUpgradeBlock value) vocabularyUpgrade,
    required TResult Function(PronunciationBlock value) pronunciation,
    required TResult Function(AiTutorMockBlock value) aiTutorMock,
    required TResult Function(SummaryBlock value) summary,
  }) {
    return exampleAnswer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExplanationBlock value)? explanation,
    TResult? Function(ExampleAnswerBlock value)? exampleAnswer,
    TResult? Function(WeakStrongBlock value)? weakStrong,
    TResult? Function(FormulaBlock value)? formula,
    TResult? Function(MultipleChoiceBlock value)? multipleChoice,
    TResult? Function(RecordAnswerBlock value)? recordAnswer,
    TResult? Function(CueCardBlock value)? cueCard,
    TResult? Function(VocabularyUpgradeBlock value)? vocabularyUpgrade,
    TResult? Function(PronunciationBlock value)? pronunciation,
    TResult? Function(AiTutorMockBlock value)? aiTutorMock,
    TResult? Function(SummaryBlock value)? summary,
  }) {
    return exampleAnswer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExplanationBlock value)? explanation,
    TResult Function(ExampleAnswerBlock value)? exampleAnswer,
    TResult Function(WeakStrongBlock value)? weakStrong,
    TResult Function(FormulaBlock value)? formula,
    TResult Function(MultipleChoiceBlock value)? multipleChoice,
    TResult Function(RecordAnswerBlock value)? recordAnswer,
    TResult Function(CueCardBlock value)? cueCard,
    TResult Function(VocabularyUpgradeBlock value)? vocabularyUpgrade,
    TResult Function(PronunciationBlock value)? pronunciation,
    TResult Function(AiTutorMockBlock value)? aiTutorMock,
    TResult Function(SummaryBlock value)? summary,
    required TResult orElse(),
  }) {
    if (exampleAnswer != null) {
      return exampleAnswer(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ExampleAnswerBlockImplToJson(
      this,
    );
  }
}

abstract class ExampleAnswerBlock implements IeltsBlock {
  const factory ExampleAnswerBlock(
      {required final String prompt,
      required final String weakAnswer,
      required final String strongAnswer,
      required final String whyStrong}) = _$ExampleAnswerBlockImpl;

  factory ExampleAnswerBlock.fromJson(Map<String, dynamic> json) =
      _$ExampleAnswerBlockImpl.fromJson;

  String get prompt;
  String get weakAnswer;
  String get strongAnswer;
  String get whyStrong;

  /// Create a copy of IeltsBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExampleAnswerBlockImplCopyWith<_$ExampleAnswerBlockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WeakStrongBlockImplCopyWith<$Res> {
  factory _$$WeakStrongBlockImplCopyWith(_$WeakStrongBlockImpl value,
          $Res Function(_$WeakStrongBlockImpl) then) =
      __$$WeakStrongBlockImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String weak, String strong, String notes});
}

/// @nodoc
class __$$WeakStrongBlockImplCopyWithImpl<$Res>
    extends _$IeltsBlockCopyWithImpl<$Res, _$WeakStrongBlockImpl>
    implements _$$WeakStrongBlockImplCopyWith<$Res> {
  __$$WeakStrongBlockImplCopyWithImpl(
      _$WeakStrongBlockImpl _value, $Res Function(_$WeakStrongBlockImpl) _then)
      : super(_value, _then);

  /// Create a copy of IeltsBlock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weak = null,
    Object? strong = null,
    Object? notes = null,
  }) {
    return _then(_$WeakStrongBlockImpl(
      weak: null == weak
          ? _value.weak
          : weak // ignore: cast_nullable_to_non_nullable
              as String,
      strong: null == strong
          ? _value.strong
          : strong // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeakStrongBlockImpl implements WeakStrongBlock {
  const _$WeakStrongBlockImpl(
      {required this.weak,
      required this.strong,
      required this.notes,
      final String? $type})
      : $type = $type ?? 'weak_strong';

  factory _$WeakStrongBlockImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeakStrongBlockImplFromJson(json);

  @override
  final String weak;
  @override
  final String strong;
  @override
  final String notes;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'IeltsBlock.weakStrong(weak: $weak, strong: $strong, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeakStrongBlockImpl &&
            (identical(other.weak, weak) || other.weak == weak) &&
            (identical(other.strong, strong) || other.strong == strong) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, weak, strong, notes);

  /// Create a copy of IeltsBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeakStrongBlockImplCopyWith<_$WeakStrongBlockImpl> get copyWith =>
      __$$WeakStrongBlockImplCopyWithImpl<_$WeakStrongBlockImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title, String body) explanation,
    required TResult Function(String prompt, String weakAnswer,
            String strongAnswer, String whyStrong)
        exampleAnswer,
    required TResult Function(String weak, String strong, String notes)
        weakStrong,
    required TResult Function(String formulaName, List<String> steps) formula,
    required TResult Function(String question, List<McOption> options,
            String correctOptionId, String explanation)
        multipleChoice,
    required TResult Function(String prompt, int durationSeconds,
            IeltsPart targetPart, String instructions, String? gradingRubric)
        recordAnswer,
    required TResult Function(String topic, List<String> bulletPoints,
            int prepSeconds, int speakingSeconds)
        cueCard,
    required TResult Function(
            String basicPhrase,
            List<VocabUpgrade> upgradedPhrases,
            String practicePrompt,
            int durationSeconds)
        vocabularyUpgrade,
    required TResult Function(
            String phrase,
            PronunciationFocus focus,
            String modelText,
            int recordingSeconds,
            String? followUpPrompt,
            int? followUpSeconds)
        pronunciation,
    required TResult Function(String instructions, int estimatedMinutes)
        aiTutorMock,
    required TResult Function(List<String> keyTakeaways, String? nextLessonId)
        summary,
  }) {
    return weakStrong(weak, strong, notes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title, String body)? explanation,
    TResult? Function(String prompt, String weakAnswer, String strongAnswer,
            String whyStrong)?
        exampleAnswer,
    TResult? Function(String weak, String strong, String notes)? weakStrong,
    TResult? Function(String formulaName, List<String> steps)? formula,
    TResult? Function(String question, List<McOption> options,
            String correctOptionId, String explanation)?
        multipleChoice,
    TResult? Function(String prompt, int durationSeconds, IeltsPart targetPart,
            String instructions, String? gradingRubric)?
        recordAnswer,
    TResult? Function(String topic, List<String> bulletPoints, int prepSeconds,
            int speakingSeconds)?
        cueCard,
    TResult? Function(String basicPhrase, List<VocabUpgrade> upgradedPhrases,
            String practicePrompt, int durationSeconds)?
        vocabularyUpgrade,
    TResult? Function(String phrase, PronunciationFocus focus, String modelText,
            int recordingSeconds, String? followUpPrompt, int? followUpSeconds)?
        pronunciation,
    TResult? Function(String instructions, int estimatedMinutes)? aiTutorMock,
    TResult? Function(List<String> keyTakeaways, String? nextLessonId)? summary,
  }) {
    return weakStrong?.call(weak, strong, notes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, String body)? explanation,
    TResult Function(String prompt, String weakAnswer, String strongAnswer,
            String whyStrong)?
        exampleAnswer,
    TResult Function(String weak, String strong, String notes)? weakStrong,
    TResult Function(String formulaName, List<String> steps)? formula,
    TResult Function(String question, List<McOption> options,
            String correctOptionId, String explanation)?
        multipleChoice,
    TResult Function(String prompt, int durationSeconds, IeltsPart targetPart,
            String instructions, String? gradingRubric)?
        recordAnswer,
    TResult Function(String topic, List<String> bulletPoints, int prepSeconds,
            int speakingSeconds)?
        cueCard,
    TResult Function(String basicPhrase, List<VocabUpgrade> upgradedPhrases,
            String practicePrompt, int durationSeconds)?
        vocabularyUpgrade,
    TResult Function(String phrase, PronunciationFocus focus, String modelText,
            int recordingSeconds, String? followUpPrompt, int? followUpSeconds)?
        pronunciation,
    TResult Function(String instructions, int estimatedMinutes)? aiTutorMock,
    TResult Function(List<String> keyTakeaways, String? nextLessonId)? summary,
    required TResult orElse(),
  }) {
    if (weakStrong != null) {
      return weakStrong(weak, strong, notes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExplanationBlock value) explanation,
    required TResult Function(ExampleAnswerBlock value) exampleAnswer,
    required TResult Function(WeakStrongBlock value) weakStrong,
    required TResult Function(FormulaBlock value) formula,
    required TResult Function(MultipleChoiceBlock value) multipleChoice,
    required TResult Function(RecordAnswerBlock value) recordAnswer,
    required TResult Function(CueCardBlock value) cueCard,
    required TResult Function(VocabularyUpgradeBlock value) vocabularyUpgrade,
    required TResult Function(PronunciationBlock value) pronunciation,
    required TResult Function(AiTutorMockBlock value) aiTutorMock,
    required TResult Function(SummaryBlock value) summary,
  }) {
    return weakStrong(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExplanationBlock value)? explanation,
    TResult? Function(ExampleAnswerBlock value)? exampleAnswer,
    TResult? Function(WeakStrongBlock value)? weakStrong,
    TResult? Function(FormulaBlock value)? formula,
    TResult? Function(MultipleChoiceBlock value)? multipleChoice,
    TResult? Function(RecordAnswerBlock value)? recordAnswer,
    TResult? Function(CueCardBlock value)? cueCard,
    TResult? Function(VocabularyUpgradeBlock value)? vocabularyUpgrade,
    TResult? Function(PronunciationBlock value)? pronunciation,
    TResult? Function(AiTutorMockBlock value)? aiTutorMock,
    TResult? Function(SummaryBlock value)? summary,
  }) {
    return weakStrong?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExplanationBlock value)? explanation,
    TResult Function(ExampleAnswerBlock value)? exampleAnswer,
    TResult Function(WeakStrongBlock value)? weakStrong,
    TResult Function(FormulaBlock value)? formula,
    TResult Function(MultipleChoiceBlock value)? multipleChoice,
    TResult Function(RecordAnswerBlock value)? recordAnswer,
    TResult Function(CueCardBlock value)? cueCard,
    TResult Function(VocabularyUpgradeBlock value)? vocabularyUpgrade,
    TResult Function(PronunciationBlock value)? pronunciation,
    TResult Function(AiTutorMockBlock value)? aiTutorMock,
    TResult Function(SummaryBlock value)? summary,
    required TResult orElse(),
  }) {
    if (weakStrong != null) {
      return weakStrong(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$WeakStrongBlockImplToJson(
      this,
    );
  }
}

abstract class WeakStrongBlock implements IeltsBlock {
  const factory WeakStrongBlock(
      {required final String weak,
      required final String strong,
      required final String notes}) = _$WeakStrongBlockImpl;

  factory WeakStrongBlock.fromJson(Map<String, dynamic> json) =
      _$WeakStrongBlockImpl.fromJson;

  String get weak;
  String get strong;
  String get notes;

  /// Create a copy of IeltsBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeakStrongBlockImplCopyWith<_$WeakStrongBlockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FormulaBlockImplCopyWith<$Res> {
  factory _$$FormulaBlockImplCopyWith(
          _$FormulaBlockImpl value, $Res Function(_$FormulaBlockImpl) then) =
      __$$FormulaBlockImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String formulaName, List<String> steps});
}

/// @nodoc
class __$$FormulaBlockImplCopyWithImpl<$Res>
    extends _$IeltsBlockCopyWithImpl<$Res, _$FormulaBlockImpl>
    implements _$$FormulaBlockImplCopyWith<$Res> {
  __$$FormulaBlockImplCopyWithImpl(
      _$FormulaBlockImpl _value, $Res Function(_$FormulaBlockImpl) _then)
      : super(_value, _then);

  /// Create a copy of IeltsBlock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formulaName = null,
    Object? steps = null,
  }) {
    return _then(_$FormulaBlockImpl(
      formulaName: null == formulaName
          ? _value.formulaName
          : formulaName // ignore: cast_nullable_to_non_nullable
              as String,
      steps: null == steps
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FormulaBlockImpl implements FormulaBlock {
  const _$FormulaBlockImpl(
      {required this.formulaName,
      required final List<String> steps,
      final String? $type})
      : _steps = steps,
        $type = $type ?? 'formula';

  factory _$FormulaBlockImpl.fromJson(Map<String, dynamic> json) =>
      _$$FormulaBlockImplFromJson(json);

  @override
  final String formulaName;
  final List<String> _steps;
  @override
  List<String> get steps {
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'IeltsBlock.formula(formulaName: $formulaName, steps: $steps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormulaBlockImpl &&
            (identical(other.formulaName, formulaName) ||
                other.formulaName == formulaName) &&
            const DeepCollectionEquality().equals(other._steps, _steps));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, formulaName, const DeepCollectionEquality().hash(_steps));

  /// Create a copy of IeltsBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormulaBlockImplCopyWith<_$FormulaBlockImpl> get copyWith =>
      __$$FormulaBlockImplCopyWithImpl<_$FormulaBlockImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title, String body) explanation,
    required TResult Function(String prompt, String weakAnswer,
            String strongAnswer, String whyStrong)
        exampleAnswer,
    required TResult Function(String weak, String strong, String notes)
        weakStrong,
    required TResult Function(String formulaName, List<String> steps) formula,
    required TResult Function(String question, List<McOption> options,
            String correctOptionId, String explanation)
        multipleChoice,
    required TResult Function(String prompt, int durationSeconds,
            IeltsPart targetPart, String instructions, String? gradingRubric)
        recordAnswer,
    required TResult Function(String topic, List<String> bulletPoints,
            int prepSeconds, int speakingSeconds)
        cueCard,
    required TResult Function(
            String basicPhrase,
            List<VocabUpgrade> upgradedPhrases,
            String practicePrompt,
            int durationSeconds)
        vocabularyUpgrade,
    required TResult Function(
            String phrase,
            PronunciationFocus focus,
            String modelText,
            int recordingSeconds,
            String? followUpPrompt,
            int? followUpSeconds)
        pronunciation,
    required TResult Function(String instructions, int estimatedMinutes)
        aiTutorMock,
    required TResult Function(List<String> keyTakeaways, String? nextLessonId)
        summary,
  }) {
    return formula(formulaName, steps);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title, String body)? explanation,
    TResult? Function(String prompt, String weakAnswer, String strongAnswer,
            String whyStrong)?
        exampleAnswer,
    TResult? Function(String weak, String strong, String notes)? weakStrong,
    TResult? Function(String formulaName, List<String> steps)? formula,
    TResult? Function(String question, List<McOption> options,
            String correctOptionId, String explanation)?
        multipleChoice,
    TResult? Function(String prompt, int durationSeconds, IeltsPart targetPart,
            String instructions, String? gradingRubric)?
        recordAnswer,
    TResult? Function(String topic, List<String> bulletPoints, int prepSeconds,
            int speakingSeconds)?
        cueCard,
    TResult? Function(String basicPhrase, List<VocabUpgrade> upgradedPhrases,
            String practicePrompt, int durationSeconds)?
        vocabularyUpgrade,
    TResult? Function(String phrase, PronunciationFocus focus, String modelText,
            int recordingSeconds, String? followUpPrompt, int? followUpSeconds)?
        pronunciation,
    TResult? Function(String instructions, int estimatedMinutes)? aiTutorMock,
    TResult? Function(List<String> keyTakeaways, String? nextLessonId)? summary,
  }) {
    return formula?.call(formulaName, steps);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, String body)? explanation,
    TResult Function(String prompt, String weakAnswer, String strongAnswer,
            String whyStrong)?
        exampleAnswer,
    TResult Function(String weak, String strong, String notes)? weakStrong,
    TResult Function(String formulaName, List<String> steps)? formula,
    TResult Function(String question, List<McOption> options,
            String correctOptionId, String explanation)?
        multipleChoice,
    TResult Function(String prompt, int durationSeconds, IeltsPart targetPart,
            String instructions, String? gradingRubric)?
        recordAnswer,
    TResult Function(String topic, List<String> bulletPoints, int prepSeconds,
            int speakingSeconds)?
        cueCard,
    TResult Function(String basicPhrase, List<VocabUpgrade> upgradedPhrases,
            String practicePrompt, int durationSeconds)?
        vocabularyUpgrade,
    TResult Function(String phrase, PronunciationFocus focus, String modelText,
            int recordingSeconds, String? followUpPrompt, int? followUpSeconds)?
        pronunciation,
    TResult Function(String instructions, int estimatedMinutes)? aiTutorMock,
    TResult Function(List<String> keyTakeaways, String? nextLessonId)? summary,
    required TResult orElse(),
  }) {
    if (formula != null) {
      return formula(formulaName, steps);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExplanationBlock value) explanation,
    required TResult Function(ExampleAnswerBlock value) exampleAnswer,
    required TResult Function(WeakStrongBlock value) weakStrong,
    required TResult Function(FormulaBlock value) formula,
    required TResult Function(MultipleChoiceBlock value) multipleChoice,
    required TResult Function(RecordAnswerBlock value) recordAnswer,
    required TResult Function(CueCardBlock value) cueCard,
    required TResult Function(VocabularyUpgradeBlock value) vocabularyUpgrade,
    required TResult Function(PronunciationBlock value) pronunciation,
    required TResult Function(AiTutorMockBlock value) aiTutorMock,
    required TResult Function(SummaryBlock value) summary,
  }) {
    return formula(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExplanationBlock value)? explanation,
    TResult? Function(ExampleAnswerBlock value)? exampleAnswer,
    TResult? Function(WeakStrongBlock value)? weakStrong,
    TResult? Function(FormulaBlock value)? formula,
    TResult? Function(MultipleChoiceBlock value)? multipleChoice,
    TResult? Function(RecordAnswerBlock value)? recordAnswer,
    TResult? Function(CueCardBlock value)? cueCard,
    TResult? Function(VocabularyUpgradeBlock value)? vocabularyUpgrade,
    TResult? Function(PronunciationBlock value)? pronunciation,
    TResult? Function(AiTutorMockBlock value)? aiTutorMock,
    TResult? Function(SummaryBlock value)? summary,
  }) {
    return formula?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExplanationBlock value)? explanation,
    TResult Function(ExampleAnswerBlock value)? exampleAnswer,
    TResult Function(WeakStrongBlock value)? weakStrong,
    TResult Function(FormulaBlock value)? formula,
    TResult Function(MultipleChoiceBlock value)? multipleChoice,
    TResult Function(RecordAnswerBlock value)? recordAnswer,
    TResult Function(CueCardBlock value)? cueCard,
    TResult Function(VocabularyUpgradeBlock value)? vocabularyUpgrade,
    TResult Function(PronunciationBlock value)? pronunciation,
    TResult Function(AiTutorMockBlock value)? aiTutorMock,
    TResult Function(SummaryBlock value)? summary,
    required TResult orElse(),
  }) {
    if (formula != null) {
      return formula(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FormulaBlockImplToJson(
      this,
    );
  }
}

abstract class FormulaBlock implements IeltsBlock {
  const factory FormulaBlock(
      {required final String formulaName,
      required final List<String> steps}) = _$FormulaBlockImpl;

  factory FormulaBlock.fromJson(Map<String, dynamic> json) =
      _$FormulaBlockImpl.fromJson;

  String get formulaName;
  List<String> get steps;

  /// Create a copy of IeltsBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormulaBlockImplCopyWith<_$FormulaBlockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MultipleChoiceBlockImplCopyWith<$Res> {
  factory _$$MultipleChoiceBlockImplCopyWith(_$MultipleChoiceBlockImpl value,
          $Res Function(_$MultipleChoiceBlockImpl) then) =
      __$$MultipleChoiceBlockImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String question,
      List<McOption> options,
      String correctOptionId,
      String explanation});
}

/// @nodoc
class __$$MultipleChoiceBlockImplCopyWithImpl<$Res>
    extends _$IeltsBlockCopyWithImpl<$Res, _$MultipleChoiceBlockImpl>
    implements _$$MultipleChoiceBlockImplCopyWith<$Res> {
  __$$MultipleChoiceBlockImplCopyWithImpl(_$MultipleChoiceBlockImpl _value,
      $Res Function(_$MultipleChoiceBlockImpl) _then)
      : super(_value, _then);

  /// Create a copy of IeltsBlock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? options = null,
    Object? correctOptionId = null,
    Object? explanation = null,
  }) {
    return _then(_$MultipleChoiceBlockImpl(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<McOption>,
      correctOptionId: null == correctOptionId
          ? _value.correctOptionId
          : correctOptionId // ignore: cast_nullable_to_non_nullable
              as String,
      explanation: null == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MultipleChoiceBlockImpl implements MultipleChoiceBlock {
  const _$MultipleChoiceBlockImpl(
      {required this.question,
      required final List<McOption> options,
      required this.correctOptionId,
      required this.explanation,
      final String? $type})
      : _options = options,
        $type = $type ?? 'multiple_choice';

  factory _$MultipleChoiceBlockImpl.fromJson(Map<String, dynamic> json) =>
      _$$MultipleChoiceBlockImplFromJson(json);

  @override
  final String question;
  final List<McOption> _options;
  @override
  List<McOption> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  final String correctOptionId;
  @override
  final String explanation;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'IeltsBlock.multipleChoice(question: $question, options: $options, correctOptionId: $correctOptionId, explanation: $explanation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MultipleChoiceBlockImpl &&
            (identical(other.question, question) ||
                other.question == question) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.correctOptionId, correctOptionId) ||
                other.correctOptionId == correctOptionId) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      question,
      const DeepCollectionEquality().hash(_options),
      correctOptionId,
      explanation);

  /// Create a copy of IeltsBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MultipleChoiceBlockImplCopyWith<_$MultipleChoiceBlockImpl> get copyWith =>
      __$$MultipleChoiceBlockImplCopyWithImpl<_$MultipleChoiceBlockImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title, String body) explanation,
    required TResult Function(String prompt, String weakAnswer,
            String strongAnswer, String whyStrong)
        exampleAnswer,
    required TResult Function(String weak, String strong, String notes)
        weakStrong,
    required TResult Function(String formulaName, List<String> steps) formula,
    required TResult Function(String question, List<McOption> options,
            String correctOptionId, String explanation)
        multipleChoice,
    required TResult Function(String prompt, int durationSeconds,
            IeltsPart targetPart, String instructions, String? gradingRubric)
        recordAnswer,
    required TResult Function(String topic, List<String> bulletPoints,
            int prepSeconds, int speakingSeconds)
        cueCard,
    required TResult Function(
            String basicPhrase,
            List<VocabUpgrade> upgradedPhrases,
            String practicePrompt,
            int durationSeconds)
        vocabularyUpgrade,
    required TResult Function(
            String phrase,
            PronunciationFocus focus,
            String modelText,
            int recordingSeconds,
            String? followUpPrompt,
            int? followUpSeconds)
        pronunciation,
    required TResult Function(String instructions, int estimatedMinutes)
        aiTutorMock,
    required TResult Function(List<String> keyTakeaways, String? nextLessonId)
        summary,
  }) {
    return multipleChoice(question, options, correctOptionId, this.explanation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title, String body)? explanation,
    TResult? Function(String prompt, String weakAnswer, String strongAnswer,
            String whyStrong)?
        exampleAnswer,
    TResult? Function(String weak, String strong, String notes)? weakStrong,
    TResult? Function(String formulaName, List<String> steps)? formula,
    TResult? Function(String question, List<McOption> options,
            String correctOptionId, String explanation)?
        multipleChoice,
    TResult? Function(String prompt, int durationSeconds, IeltsPart targetPart,
            String instructions, String? gradingRubric)?
        recordAnswer,
    TResult? Function(String topic, List<String> bulletPoints, int prepSeconds,
            int speakingSeconds)?
        cueCard,
    TResult? Function(String basicPhrase, List<VocabUpgrade> upgradedPhrases,
            String practicePrompt, int durationSeconds)?
        vocabularyUpgrade,
    TResult? Function(String phrase, PronunciationFocus focus, String modelText,
            int recordingSeconds, String? followUpPrompt, int? followUpSeconds)?
        pronunciation,
    TResult? Function(String instructions, int estimatedMinutes)? aiTutorMock,
    TResult? Function(List<String> keyTakeaways, String? nextLessonId)? summary,
  }) {
    return multipleChoice?.call(
        question, options, correctOptionId, this.explanation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, String body)? explanation,
    TResult Function(String prompt, String weakAnswer, String strongAnswer,
            String whyStrong)?
        exampleAnswer,
    TResult Function(String weak, String strong, String notes)? weakStrong,
    TResult Function(String formulaName, List<String> steps)? formula,
    TResult Function(String question, List<McOption> options,
            String correctOptionId, String explanation)?
        multipleChoice,
    TResult Function(String prompt, int durationSeconds, IeltsPart targetPart,
            String instructions, String? gradingRubric)?
        recordAnswer,
    TResult Function(String topic, List<String> bulletPoints, int prepSeconds,
            int speakingSeconds)?
        cueCard,
    TResult Function(String basicPhrase, List<VocabUpgrade> upgradedPhrases,
            String practicePrompt, int durationSeconds)?
        vocabularyUpgrade,
    TResult Function(String phrase, PronunciationFocus focus, String modelText,
            int recordingSeconds, String? followUpPrompt, int? followUpSeconds)?
        pronunciation,
    TResult Function(String instructions, int estimatedMinutes)? aiTutorMock,
    TResult Function(List<String> keyTakeaways, String? nextLessonId)? summary,
    required TResult orElse(),
  }) {
    if (multipleChoice != null) {
      return multipleChoice(
          question, options, correctOptionId, this.explanation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExplanationBlock value) explanation,
    required TResult Function(ExampleAnswerBlock value) exampleAnswer,
    required TResult Function(WeakStrongBlock value) weakStrong,
    required TResult Function(FormulaBlock value) formula,
    required TResult Function(MultipleChoiceBlock value) multipleChoice,
    required TResult Function(RecordAnswerBlock value) recordAnswer,
    required TResult Function(CueCardBlock value) cueCard,
    required TResult Function(VocabularyUpgradeBlock value) vocabularyUpgrade,
    required TResult Function(PronunciationBlock value) pronunciation,
    required TResult Function(AiTutorMockBlock value) aiTutorMock,
    required TResult Function(SummaryBlock value) summary,
  }) {
    return multipleChoice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExplanationBlock value)? explanation,
    TResult? Function(ExampleAnswerBlock value)? exampleAnswer,
    TResult? Function(WeakStrongBlock value)? weakStrong,
    TResult? Function(FormulaBlock value)? formula,
    TResult? Function(MultipleChoiceBlock value)? multipleChoice,
    TResult? Function(RecordAnswerBlock value)? recordAnswer,
    TResult? Function(CueCardBlock value)? cueCard,
    TResult? Function(VocabularyUpgradeBlock value)? vocabularyUpgrade,
    TResult? Function(PronunciationBlock value)? pronunciation,
    TResult? Function(AiTutorMockBlock value)? aiTutorMock,
    TResult? Function(SummaryBlock value)? summary,
  }) {
    return multipleChoice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExplanationBlock value)? explanation,
    TResult Function(ExampleAnswerBlock value)? exampleAnswer,
    TResult Function(WeakStrongBlock value)? weakStrong,
    TResult Function(FormulaBlock value)? formula,
    TResult Function(MultipleChoiceBlock value)? multipleChoice,
    TResult Function(RecordAnswerBlock value)? recordAnswer,
    TResult Function(CueCardBlock value)? cueCard,
    TResult Function(VocabularyUpgradeBlock value)? vocabularyUpgrade,
    TResult Function(PronunciationBlock value)? pronunciation,
    TResult Function(AiTutorMockBlock value)? aiTutorMock,
    TResult Function(SummaryBlock value)? summary,
    required TResult orElse(),
  }) {
    if (multipleChoice != null) {
      return multipleChoice(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MultipleChoiceBlockImplToJson(
      this,
    );
  }
}

abstract class MultipleChoiceBlock implements IeltsBlock {
  const factory MultipleChoiceBlock(
      {required final String question,
      required final List<McOption> options,
      required final String correctOptionId,
      required final String explanation}) = _$MultipleChoiceBlockImpl;

  factory MultipleChoiceBlock.fromJson(Map<String, dynamic> json) =
      _$MultipleChoiceBlockImpl.fromJson;

  String get question;
  List<McOption> get options;
  String get correctOptionId;
  String get explanation;

  /// Create a copy of IeltsBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MultipleChoiceBlockImplCopyWith<_$MultipleChoiceBlockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RecordAnswerBlockImplCopyWith<$Res> {
  factory _$$RecordAnswerBlockImplCopyWith(_$RecordAnswerBlockImpl value,
          $Res Function(_$RecordAnswerBlockImpl) then) =
      __$$RecordAnswerBlockImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String prompt,
      int durationSeconds,
      IeltsPart targetPart,
      String instructions,
      String? gradingRubric});
}

/// @nodoc
class __$$RecordAnswerBlockImplCopyWithImpl<$Res>
    extends _$IeltsBlockCopyWithImpl<$Res, _$RecordAnswerBlockImpl>
    implements _$$RecordAnswerBlockImplCopyWith<$Res> {
  __$$RecordAnswerBlockImplCopyWithImpl(_$RecordAnswerBlockImpl _value,
      $Res Function(_$RecordAnswerBlockImpl) _then)
      : super(_value, _then);

  /// Create a copy of IeltsBlock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prompt = null,
    Object? durationSeconds = null,
    Object? targetPart = null,
    Object? instructions = null,
    Object? gradingRubric = freezed,
  }) {
    return _then(_$RecordAnswerBlockImpl(
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
      durationSeconds: null == durationSeconds
          ? _value.durationSeconds
          : durationSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      targetPart: null == targetPart
          ? _value.targetPart
          : targetPart // ignore: cast_nullable_to_non_nullable
              as IeltsPart,
      instructions: null == instructions
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String,
      gradingRubric: freezed == gradingRubric
          ? _value.gradingRubric
          : gradingRubric // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecordAnswerBlockImpl implements RecordAnswerBlock {
  const _$RecordAnswerBlockImpl(
      {required this.prompt,
      required this.durationSeconds,
      required this.targetPart,
      required this.instructions,
      this.gradingRubric,
      final String? $type})
      : $type = $type ?? 'record_answer';

  factory _$RecordAnswerBlockImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecordAnswerBlockImplFromJson(json);

  @override
  final String prompt;
  @override
  final int durationSeconds;
  @override
  final IeltsPart targetPart;
  @override
  final String instructions;
  @override
  final String? gradingRubric;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'IeltsBlock.recordAnswer(prompt: $prompt, durationSeconds: $durationSeconds, targetPart: $targetPart, instructions: $instructions, gradingRubric: $gradingRubric)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordAnswerBlockImpl &&
            (identical(other.prompt, prompt) || other.prompt == prompt) &&
            (identical(other.durationSeconds, durationSeconds) ||
                other.durationSeconds == durationSeconds) &&
            (identical(other.targetPart, targetPart) ||
                other.targetPart == targetPart) &&
            (identical(other.instructions, instructions) ||
                other.instructions == instructions) &&
            (identical(other.gradingRubric, gradingRubric) ||
                other.gradingRubric == gradingRubric));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, prompt, durationSeconds,
      targetPart, instructions, gradingRubric);

  /// Create a copy of IeltsBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordAnswerBlockImplCopyWith<_$RecordAnswerBlockImpl> get copyWith =>
      __$$RecordAnswerBlockImplCopyWithImpl<_$RecordAnswerBlockImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title, String body) explanation,
    required TResult Function(String prompt, String weakAnswer,
            String strongAnswer, String whyStrong)
        exampleAnswer,
    required TResult Function(String weak, String strong, String notes)
        weakStrong,
    required TResult Function(String formulaName, List<String> steps) formula,
    required TResult Function(String question, List<McOption> options,
            String correctOptionId, String explanation)
        multipleChoice,
    required TResult Function(String prompt, int durationSeconds,
            IeltsPart targetPart, String instructions, String? gradingRubric)
        recordAnswer,
    required TResult Function(String topic, List<String> bulletPoints,
            int prepSeconds, int speakingSeconds)
        cueCard,
    required TResult Function(
            String basicPhrase,
            List<VocabUpgrade> upgradedPhrases,
            String practicePrompt,
            int durationSeconds)
        vocabularyUpgrade,
    required TResult Function(
            String phrase,
            PronunciationFocus focus,
            String modelText,
            int recordingSeconds,
            String? followUpPrompt,
            int? followUpSeconds)
        pronunciation,
    required TResult Function(String instructions, int estimatedMinutes)
        aiTutorMock,
    required TResult Function(List<String> keyTakeaways, String? nextLessonId)
        summary,
  }) {
    return recordAnswer(
        prompt, durationSeconds, targetPart, instructions, gradingRubric);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title, String body)? explanation,
    TResult? Function(String prompt, String weakAnswer, String strongAnswer,
            String whyStrong)?
        exampleAnswer,
    TResult? Function(String weak, String strong, String notes)? weakStrong,
    TResult? Function(String formulaName, List<String> steps)? formula,
    TResult? Function(String question, List<McOption> options,
            String correctOptionId, String explanation)?
        multipleChoice,
    TResult? Function(String prompt, int durationSeconds, IeltsPart targetPart,
            String instructions, String? gradingRubric)?
        recordAnswer,
    TResult? Function(String topic, List<String> bulletPoints, int prepSeconds,
            int speakingSeconds)?
        cueCard,
    TResult? Function(String basicPhrase, List<VocabUpgrade> upgradedPhrases,
            String practicePrompt, int durationSeconds)?
        vocabularyUpgrade,
    TResult? Function(String phrase, PronunciationFocus focus, String modelText,
            int recordingSeconds, String? followUpPrompt, int? followUpSeconds)?
        pronunciation,
    TResult? Function(String instructions, int estimatedMinutes)? aiTutorMock,
    TResult? Function(List<String> keyTakeaways, String? nextLessonId)? summary,
  }) {
    return recordAnswer?.call(
        prompt, durationSeconds, targetPart, instructions, gradingRubric);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, String body)? explanation,
    TResult Function(String prompt, String weakAnswer, String strongAnswer,
            String whyStrong)?
        exampleAnswer,
    TResult Function(String weak, String strong, String notes)? weakStrong,
    TResult Function(String formulaName, List<String> steps)? formula,
    TResult Function(String question, List<McOption> options,
            String correctOptionId, String explanation)?
        multipleChoice,
    TResult Function(String prompt, int durationSeconds, IeltsPart targetPart,
            String instructions, String? gradingRubric)?
        recordAnswer,
    TResult Function(String topic, List<String> bulletPoints, int prepSeconds,
            int speakingSeconds)?
        cueCard,
    TResult Function(String basicPhrase, List<VocabUpgrade> upgradedPhrases,
            String practicePrompt, int durationSeconds)?
        vocabularyUpgrade,
    TResult Function(String phrase, PronunciationFocus focus, String modelText,
            int recordingSeconds, String? followUpPrompt, int? followUpSeconds)?
        pronunciation,
    TResult Function(String instructions, int estimatedMinutes)? aiTutorMock,
    TResult Function(List<String> keyTakeaways, String? nextLessonId)? summary,
    required TResult orElse(),
  }) {
    if (recordAnswer != null) {
      return recordAnswer(
          prompt, durationSeconds, targetPart, instructions, gradingRubric);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExplanationBlock value) explanation,
    required TResult Function(ExampleAnswerBlock value) exampleAnswer,
    required TResult Function(WeakStrongBlock value) weakStrong,
    required TResult Function(FormulaBlock value) formula,
    required TResult Function(MultipleChoiceBlock value) multipleChoice,
    required TResult Function(RecordAnswerBlock value) recordAnswer,
    required TResult Function(CueCardBlock value) cueCard,
    required TResult Function(VocabularyUpgradeBlock value) vocabularyUpgrade,
    required TResult Function(PronunciationBlock value) pronunciation,
    required TResult Function(AiTutorMockBlock value) aiTutorMock,
    required TResult Function(SummaryBlock value) summary,
  }) {
    return recordAnswer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExplanationBlock value)? explanation,
    TResult? Function(ExampleAnswerBlock value)? exampleAnswer,
    TResult? Function(WeakStrongBlock value)? weakStrong,
    TResult? Function(FormulaBlock value)? formula,
    TResult? Function(MultipleChoiceBlock value)? multipleChoice,
    TResult? Function(RecordAnswerBlock value)? recordAnswer,
    TResult? Function(CueCardBlock value)? cueCard,
    TResult? Function(VocabularyUpgradeBlock value)? vocabularyUpgrade,
    TResult? Function(PronunciationBlock value)? pronunciation,
    TResult? Function(AiTutorMockBlock value)? aiTutorMock,
    TResult? Function(SummaryBlock value)? summary,
  }) {
    return recordAnswer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExplanationBlock value)? explanation,
    TResult Function(ExampleAnswerBlock value)? exampleAnswer,
    TResult Function(WeakStrongBlock value)? weakStrong,
    TResult Function(FormulaBlock value)? formula,
    TResult Function(MultipleChoiceBlock value)? multipleChoice,
    TResult Function(RecordAnswerBlock value)? recordAnswer,
    TResult Function(CueCardBlock value)? cueCard,
    TResult Function(VocabularyUpgradeBlock value)? vocabularyUpgrade,
    TResult Function(PronunciationBlock value)? pronunciation,
    TResult Function(AiTutorMockBlock value)? aiTutorMock,
    TResult Function(SummaryBlock value)? summary,
    required TResult orElse(),
  }) {
    if (recordAnswer != null) {
      return recordAnswer(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RecordAnswerBlockImplToJson(
      this,
    );
  }
}

abstract class RecordAnswerBlock implements IeltsBlock {
  const factory RecordAnswerBlock(
      {required final String prompt,
      required final int durationSeconds,
      required final IeltsPart targetPart,
      required final String instructions,
      final String? gradingRubric}) = _$RecordAnswerBlockImpl;

  factory RecordAnswerBlock.fromJson(Map<String, dynamic> json) =
      _$RecordAnswerBlockImpl.fromJson;

  String get prompt;
  int get durationSeconds;
  IeltsPart get targetPart;
  String get instructions;
  String? get gradingRubric;

  /// Create a copy of IeltsBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecordAnswerBlockImplCopyWith<_$RecordAnswerBlockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CueCardBlockImplCopyWith<$Res> {
  factory _$$CueCardBlockImplCopyWith(
          _$CueCardBlockImpl value, $Res Function(_$CueCardBlockImpl) then) =
      __$$CueCardBlockImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String topic,
      List<String> bulletPoints,
      int prepSeconds,
      int speakingSeconds});
}

/// @nodoc
class __$$CueCardBlockImplCopyWithImpl<$Res>
    extends _$IeltsBlockCopyWithImpl<$Res, _$CueCardBlockImpl>
    implements _$$CueCardBlockImplCopyWith<$Res> {
  __$$CueCardBlockImplCopyWithImpl(
      _$CueCardBlockImpl _value, $Res Function(_$CueCardBlockImpl) _then)
      : super(_value, _then);

  /// Create a copy of IeltsBlock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topic = null,
    Object? bulletPoints = null,
    Object? prepSeconds = null,
    Object? speakingSeconds = null,
  }) {
    return _then(_$CueCardBlockImpl(
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      bulletPoints: null == bulletPoints
          ? _value._bulletPoints
          : bulletPoints // ignore: cast_nullable_to_non_nullable
              as List<String>,
      prepSeconds: null == prepSeconds
          ? _value.prepSeconds
          : prepSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      speakingSeconds: null == speakingSeconds
          ? _value.speakingSeconds
          : speakingSeconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CueCardBlockImpl implements CueCardBlock {
  const _$CueCardBlockImpl(
      {required this.topic,
      required final List<String> bulletPoints,
      required this.prepSeconds,
      required this.speakingSeconds,
      final String? $type})
      : _bulletPoints = bulletPoints,
        $type = $type ?? 'cue_card';

  factory _$CueCardBlockImpl.fromJson(Map<String, dynamic> json) =>
      _$$CueCardBlockImplFromJson(json);

  @override
  final String topic;
  final List<String> _bulletPoints;
  @override
  List<String> get bulletPoints {
    if (_bulletPoints is EqualUnmodifiableListView) return _bulletPoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bulletPoints);
  }

  @override
  final int prepSeconds;
  @override
  final int speakingSeconds;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'IeltsBlock.cueCard(topic: $topic, bulletPoints: $bulletPoints, prepSeconds: $prepSeconds, speakingSeconds: $speakingSeconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CueCardBlockImpl &&
            (identical(other.topic, topic) || other.topic == topic) &&
            const DeepCollectionEquality()
                .equals(other._bulletPoints, _bulletPoints) &&
            (identical(other.prepSeconds, prepSeconds) ||
                other.prepSeconds == prepSeconds) &&
            (identical(other.speakingSeconds, speakingSeconds) ||
                other.speakingSeconds == speakingSeconds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      topic,
      const DeepCollectionEquality().hash(_bulletPoints),
      prepSeconds,
      speakingSeconds);

  /// Create a copy of IeltsBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CueCardBlockImplCopyWith<_$CueCardBlockImpl> get copyWith =>
      __$$CueCardBlockImplCopyWithImpl<_$CueCardBlockImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title, String body) explanation,
    required TResult Function(String prompt, String weakAnswer,
            String strongAnswer, String whyStrong)
        exampleAnswer,
    required TResult Function(String weak, String strong, String notes)
        weakStrong,
    required TResult Function(String formulaName, List<String> steps) formula,
    required TResult Function(String question, List<McOption> options,
            String correctOptionId, String explanation)
        multipleChoice,
    required TResult Function(String prompt, int durationSeconds,
            IeltsPart targetPart, String instructions, String? gradingRubric)
        recordAnswer,
    required TResult Function(String topic, List<String> bulletPoints,
            int prepSeconds, int speakingSeconds)
        cueCard,
    required TResult Function(
            String basicPhrase,
            List<VocabUpgrade> upgradedPhrases,
            String practicePrompt,
            int durationSeconds)
        vocabularyUpgrade,
    required TResult Function(
            String phrase,
            PronunciationFocus focus,
            String modelText,
            int recordingSeconds,
            String? followUpPrompt,
            int? followUpSeconds)
        pronunciation,
    required TResult Function(String instructions, int estimatedMinutes)
        aiTutorMock,
    required TResult Function(List<String> keyTakeaways, String? nextLessonId)
        summary,
  }) {
    return cueCard(topic, bulletPoints, prepSeconds, speakingSeconds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title, String body)? explanation,
    TResult? Function(String prompt, String weakAnswer, String strongAnswer,
            String whyStrong)?
        exampleAnswer,
    TResult? Function(String weak, String strong, String notes)? weakStrong,
    TResult? Function(String formulaName, List<String> steps)? formula,
    TResult? Function(String question, List<McOption> options,
            String correctOptionId, String explanation)?
        multipleChoice,
    TResult? Function(String prompt, int durationSeconds, IeltsPart targetPart,
            String instructions, String? gradingRubric)?
        recordAnswer,
    TResult? Function(String topic, List<String> bulletPoints, int prepSeconds,
            int speakingSeconds)?
        cueCard,
    TResult? Function(String basicPhrase, List<VocabUpgrade> upgradedPhrases,
            String practicePrompt, int durationSeconds)?
        vocabularyUpgrade,
    TResult? Function(String phrase, PronunciationFocus focus, String modelText,
            int recordingSeconds, String? followUpPrompt, int? followUpSeconds)?
        pronunciation,
    TResult? Function(String instructions, int estimatedMinutes)? aiTutorMock,
    TResult? Function(List<String> keyTakeaways, String? nextLessonId)? summary,
  }) {
    return cueCard?.call(topic, bulletPoints, prepSeconds, speakingSeconds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, String body)? explanation,
    TResult Function(String prompt, String weakAnswer, String strongAnswer,
            String whyStrong)?
        exampleAnswer,
    TResult Function(String weak, String strong, String notes)? weakStrong,
    TResult Function(String formulaName, List<String> steps)? formula,
    TResult Function(String question, List<McOption> options,
            String correctOptionId, String explanation)?
        multipleChoice,
    TResult Function(String prompt, int durationSeconds, IeltsPart targetPart,
            String instructions, String? gradingRubric)?
        recordAnswer,
    TResult Function(String topic, List<String> bulletPoints, int prepSeconds,
            int speakingSeconds)?
        cueCard,
    TResult Function(String basicPhrase, List<VocabUpgrade> upgradedPhrases,
            String practicePrompt, int durationSeconds)?
        vocabularyUpgrade,
    TResult Function(String phrase, PronunciationFocus focus, String modelText,
            int recordingSeconds, String? followUpPrompt, int? followUpSeconds)?
        pronunciation,
    TResult Function(String instructions, int estimatedMinutes)? aiTutorMock,
    TResult Function(List<String> keyTakeaways, String? nextLessonId)? summary,
    required TResult orElse(),
  }) {
    if (cueCard != null) {
      return cueCard(topic, bulletPoints, prepSeconds, speakingSeconds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExplanationBlock value) explanation,
    required TResult Function(ExampleAnswerBlock value) exampleAnswer,
    required TResult Function(WeakStrongBlock value) weakStrong,
    required TResult Function(FormulaBlock value) formula,
    required TResult Function(MultipleChoiceBlock value) multipleChoice,
    required TResult Function(RecordAnswerBlock value) recordAnswer,
    required TResult Function(CueCardBlock value) cueCard,
    required TResult Function(VocabularyUpgradeBlock value) vocabularyUpgrade,
    required TResult Function(PronunciationBlock value) pronunciation,
    required TResult Function(AiTutorMockBlock value) aiTutorMock,
    required TResult Function(SummaryBlock value) summary,
  }) {
    return cueCard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExplanationBlock value)? explanation,
    TResult? Function(ExampleAnswerBlock value)? exampleAnswer,
    TResult? Function(WeakStrongBlock value)? weakStrong,
    TResult? Function(FormulaBlock value)? formula,
    TResult? Function(MultipleChoiceBlock value)? multipleChoice,
    TResult? Function(RecordAnswerBlock value)? recordAnswer,
    TResult? Function(CueCardBlock value)? cueCard,
    TResult? Function(VocabularyUpgradeBlock value)? vocabularyUpgrade,
    TResult? Function(PronunciationBlock value)? pronunciation,
    TResult? Function(AiTutorMockBlock value)? aiTutorMock,
    TResult? Function(SummaryBlock value)? summary,
  }) {
    return cueCard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExplanationBlock value)? explanation,
    TResult Function(ExampleAnswerBlock value)? exampleAnswer,
    TResult Function(WeakStrongBlock value)? weakStrong,
    TResult Function(FormulaBlock value)? formula,
    TResult Function(MultipleChoiceBlock value)? multipleChoice,
    TResult Function(RecordAnswerBlock value)? recordAnswer,
    TResult Function(CueCardBlock value)? cueCard,
    TResult Function(VocabularyUpgradeBlock value)? vocabularyUpgrade,
    TResult Function(PronunciationBlock value)? pronunciation,
    TResult Function(AiTutorMockBlock value)? aiTutorMock,
    TResult Function(SummaryBlock value)? summary,
    required TResult orElse(),
  }) {
    if (cueCard != null) {
      return cueCard(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CueCardBlockImplToJson(
      this,
    );
  }
}

abstract class CueCardBlock implements IeltsBlock {
  const factory CueCardBlock(
      {required final String topic,
      required final List<String> bulletPoints,
      required final int prepSeconds,
      required final int speakingSeconds}) = _$CueCardBlockImpl;

  factory CueCardBlock.fromJson(Map<String, dynamic> json) =
      _$CueCardBlockImpl.fromJson;

  String get topic;
  List<String> get bulletPoints;
  int get prepSeconds;
  int get speakingSeconds;

  /// Create a copy of IeltsBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CueCardBlockImplCopyWith<_$CueCardBlockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VocabularyUpgradeBlockImplCopyWith<$Res> {
  factory _$$VocabularyUpgradeBlockImplCopyWith(
          _$VocabularyUpgradeBlockImpl value,
          $Res Function(_$VocabularyUpgradeBlockImpl) then) =
      __$$VocabularyUpgradeBlockImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String basicPhrase,
      List<VocabUpgrade> upgradedPhrases,
      String practicePrompt,
      int durationSeconds});
}

/// @nodoc
class __$$VocabularyUpgradeBlockImplCopyWithImpl<$Res>
    extends _$IeltsBlockCopyWithImpl<$Res, _$VocabularyUpgradeBlockImpl>
    implements _$$VocabularyUpgradeBlockImplCopyWith<$Res> {
  __$$VocabularyUpgradeBlockImplCopyWithImpl(
      _$VocabularyUpgradeBlockImpl _value,
      $Res Function(_$VocabularyUpgradeBlockImpl) _then)
      : super(_value, _then);

  /// Create a copy of IeltsBlock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? basicPhrase = null,
    Object? upgradedPhrases = null,
    Object? practicePrompt = null,
    Object? durationSeconds = null,
  }) {
    return _then(_$VocabularyUpgradeBlockImpl(
      basicPhrase: null == basicPhrase
          ? _value.basicPhrase
          : basicPhrase // ignore: cast_nullable_to_non_nullable
              as String,
      upgradedPhrases: null == upgradedPhrases
          ? _value._upgradedPhrases
          : upgradedPhrases // ignore: cast_nullable_to_non_nullable
              as List<VocabUpgrade>,
      practicePrompt: null == practicePrompt
          ? _value.practicePrompt
          : practicePrompt // ignore: cast_nullable_to_non_nullable
              as String,
      durationSeconds: null == durationSeconds
          ? _value.durationSeconds
          : durationSeconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VocabularyUpgradeBlockImpl implements VocabularyUpgradeBlock {
  const _$VocabularyUpgradeBlockImpl(
      {required this.basicPhrase,
      required final List<VocabUpgrade> upgradedPhrases,
      required this.practicePrompt,
      required this.durationSeconds,
      final String? $type})
      : _upgradedPhrases = upgradedPhrases,
        $type = $type ?? 'vocabulary_upgrade';

  factory _$VocabularyUpgradeBlockImpl.fromJson(Map<String, dynamic> json) =>
      _$$VocabularyUpgradeBlockImplFromJson(json);

  @override
  final String basicPhrase;
  final List<VocabUpgrade> _upgradedPhrases;
  @override
  List<VocabUpgrade> get upgradedPhrases {
    if (_upgradedPhrases is EqualUnmodifiableListView) return _upgradedPhrases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_upgradedPhrases);
  }

  @override
  final String practicePrompt;
  @override
  final int durationSeconds;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'IeltsBlock.vocabularyUpgrade(basicPhrase: $basicPhrase, upgradedPhrases: $upgradedPhrases, practicePrompt: $practicePrompt, durationSeconds: $durationSeconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VocabularyUpgradeBlockImpl &&
            (identical(other.basicPhrase, basicPhrase) ||
                other.basicPhrase == basicPhrase) &&
            const DeepCollectionEquality()
                .equals(other._upgradedPhrases, _upgradedPhrases) &&
            (identical(other.practicePrompt, practicePrompt) ||
                other.practicePrompt == practicePrompt) &&
            (identical(other.durationSeconds, durationSeconds) ||
                other.durationSeconds == durationSeconds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      basicPhrase,
      const DeepCollectionEquality().hash(_upgradedPhrases),
      practicePrompt,
      durationSeconds);

  /// Create a copy of IeltsBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VocabularyUpgradeBlockImplCopyWith<_$VocabularyUpgradeBlockImpl>
      get copyWith => __$$VocabularyUpgradeBlockImplCopyWithImpl<
          _$VocabularyUpgradeBlockImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title, String body) explanation,
    required TResult Function(String prompt, String weakAnswer,
            String strongAnswer, String whyStrong)
        exampleAnswer,
    required TResult Function(String weak, String strong, String notes)
        weakStrong,
    required TResult Function(String formulaName, List<String> steps) formula,
    required TResult Function(String question, List<McOption> options,
            String correctOptionId, String explanation)
        multipleChoice,
    required TResult Function(String prompt, int durationSeconds,
            IeltsPart targetPart, String instructions, String? gradingRubric)
        recordAnswer,
    required TResult Function(String topic, List<String> bulletPoints,
            int prepSeconds, int speakingSeconds)
        cueCard,
    required TResult Function(
            String basicPhrase,
            List<VocabUpgrade> upgradedPhrases,
            String practicePrompt,
            int durationSeconds)
        vocabularyUpgrade,
    required TResult Function(
            String phrase,
            PronunciationFocus focus,
            String modelText,
            int recordingSeconds,
            String? followUpPrompt,
            int? followUpSeconds)
        pronunciation,
    required TResult Function(String instructions, int estimatedMinutes)
        aiTutorMock,
    required TResult Function(List<String> keyTakeaways, String? nextLessonId)
        summary,
  }) {
    return vocabularyUpgrade(
        basicPhrase, upgradedPhrases, practicePrompt, durationSeconds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title, String body)? explanation,
    TResult? Function(String prompt, String weakAnswer, String strongAnswer,
            String whyStrong)?
        exampleAnswer,
    TResult? Function(String weak, String strong, String notes)? weakStrong,
    TResult? Function(String formulaName, List<String> steps)? formula,
    TResult? Function(String question, List<McOption> options,
            String correctOptionId, String explanation)?
        multipleChoice,
    TResult? Function(String prompt, int durationSeconds, IeltsPart targetPart,
            String instructions, String? gradingRubric)?
        recordAnswer,
    TResult? Function(String topic, List<String> bulletPoints, int prepSeconds,
            int speakingSeconds)?
        cueCard,
    TResult? Function(String basicPhrase, List<VocabUpgrade> upgradedPhrases,
            String practicePrompt, int durationSeconds)?
        vocabularyUpgrade,
    TResult? Function(String phrase, PronunciationFocus focus, String modelText,
            int recordingSeconds, String? followUpPrompt, int? followUpSeconds)?
        pronunciation,
    TResult? Function(String instructions, int estimatedMinutes)? aiTutorMock,
    TResult? Function(List<String> keyTakeaways, String? nextLessonId)? summary,
  }) {
    return vocabularyUpgrade?.call(
        basicPhrase, upgradedPhrases, practicePrompt, durationSeconds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, String body)? explanation,
    TResult Function(String prompt, String weakAnswer, String strongAnswer,
            String whyStrong)?
        exampleAnswer,
    TResult Function(String weak, String strong, String notes)? weakStrong,
    TResult Function(String formulaName, List<String> steps)? formula,
    TResult Function(String question, List<McOption> options,
            String correctOptionId, String explanation)?
        multipleChoice,
    TResult Function(String prompt, int durationSeconds, IeltsPart targetPart,
            String instructions, String? gradingRubric)?
        recordAnswer,
    TResult Function(String topic, List<String> bulletPoints, int prepSeconds,
            int speakingSeconds)?
        cueCard,
    TResult Function(String basicPhrase, List<VocabUpgrade> upgradedPhrases,
            String practicePrompt, int durationSeconds)?
        vocabularyUpgrade,
    TResult Function(String phrase, PronunciationFocus focus, String modelText,
            int recordingSeconds, String? followUpPrompt, int? followUpSeconds)?
        pronunciation,
    TResult Function(String instructions, int estimatedMinutes)? aiTutorMock,
    TResult Function(List<String> keyTakeaways, String? nextLessonId)? summary,
    required TResult orElse(),
  }) {
    if (vocabularyUpgrade != null) {
      return vocabularyUpgrade(
          basicPhrase, upgradedPhrases, practicePrompt, durationSeconds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExplanationBlock value) explanation,
    required TResult Function(ExampleAnswerBlock value) exampleAnswer,
    required TResult Function(WeakStrongBlock value) weakStrong,
    required TResult Function(FormulaBlock value) formula,
    required TResult Function(MultipleChoiceBlock value) multipleChoice,
    required TResult Function(RecordAnswerBlock value) recordAnswer,
    required TResult Function(CueCardBlock value) cueCard,
    required TResult Function(VocabularyUpgradeBlock value) vocabularyUpgrade,
    required TResult Function(PronunciationBlock value) pronunciation,
    required TResult Function(AiTutorMockBlock value) aiTutorMock,
    required TResult Function(SummaryBlock value) summary,
  }) {
    return vocabularyUpgrade(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExplanationBlock value)? explanation,
    TResult? Function(ExampleAnswerBlock value)? exampleAnswer,
    TResult? Function(WeakStrongBlock value)? weakStrong,
    TResult? Function(FormulaBlock value)? formula,
    TResult? Function(MultipleChoiceBlock value)? multipleChoice,
    TResult? Function(RecordAnswerBlock value)? recordAnswer,
    TResult? Function(CueCardBlock value)? cueCard,
    TResult? Function(VocabularyUpgradeBlock value)? vocabularyUpgrade,
    TResult? Function(PronunciationBlock value)? pronunciation,
    TResult? Function(AiTutorMockBlock value)? aiTutorMock,
    TResult? Function(SummaryBlock value)? summary,
  }) {
    return vocabularyUpgrade?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExplanationBlock value)? explanation,
    TResult Function(ExampleAnswerBlock value)? exampleAnswer,
    TResult Function(WeakStrongBlock value)? weakStrong,
    TResult Function(FormulaBlock value)? formula,
    TResult Function(MultipleChoiceBlock value)? multipleChoice,
    TResult Function(RecordAnswerBlock value)? recordAnswer,
    TResult Function(CueCardBlock value)? cueCard,
    TResult Function(VocabularyUpgradeBlock value)? vocabularyUpgrade,
    TResult Function(PronunciationBlock value)? pronunciation,
    TResult Function(AiTutorMockBlock value)? aiTutorMock,
    TResult Function(SummaryBlock value)? summary,
    required TResult orElse(),
  }) {
    if (vocabularyUpgrade != null) {
      return vocabularyUpgrade(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$VocabularyUpgradeBlockImplToJson(
      this,
    );
  }
}

abstract class VocabularyUpgradeBlock implements IeltsBlock {
  const factory VocabularyUpgradeBlock(
      {required final String basicPhrase,
      required final List<VocabUpgrade> upgradedPhrases,
      required final String practicePrompt,
      required final int durationSeconds}) = _$VocabularyUpgradeBlockImpl;

  factory VocabularyUpgradeBlock.fromJson(Map<String, dynamic> json) =
      _$VocabularyUpgradeBlockImpl.fromJson;

  String get basicPhrase;
  List<VocabUpgrade> get upgradedPhrases;
  String get practicePrompt;
  int get durationSeconds;

  /// Create a copy of IeltsBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VocabularyUpgradeBlockImplCopyWith<_$VocabularyUpgradeBlockImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PronunciationBlockImplCopyWith<$Res> {
  factory _$$PronunciationBlockImplCopyWith(_$PronunciationBlockImpl value,
          $Res Function(_$PronunciationBlockImpl) then) =
      __$$PronunciationBlockImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String phrase,
      PronunciationFocus focus,
      String modelText,
      int recordingSeconds,
      String? followUpPrompt,
      int? followUpSeconds});
}

/// @nodoc
class __$$PronunciationBlockImplCopyWithImpl<$Res>
    extends _$IeltsBlockCopyWithImpl<$Res, _$PronunciationBlockImpl>
    implements _$$PronunciationBlockImplCopyWith<$Res> {
  __$$PronunciationBlockImplCopyWithImpl(_$PronunciationBlockImpl _value,
      $Res Function(_$PronunciationBlockImpl) _then)
      : super(_value, _then);

  /// Create a copy of IeltsBlock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phrase = null,
    Object? focus = null,
    Object? modelText = null,
    Object? recordingSeconds = null,
    Object? followUpPrompt = freezed,
    Object? followUpSeconds = freezed,
  }) {
    return _then(_$PronunciationBlockImpl(
      phrase: null == phrase
          ? _value.phrase
          : phrase // ignore: cast_nullable_to_non_nullable
              as String,
      focus: null == focus
          ? _value.focus
          : focus // ignore: cast_nullable_to_non_nullable
              as PronunciationFocus,
      modelText: null == modelText
          ? _value.modelText
          : modelText // ignore: cast_nullable_to_non_nullable
              as String,
      recordingSeconds: null == recordingSeconds
          ? _value.recordingSeconds
          : recordingSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      followUpPrompt: freezed == followUpPrompt
          ? _value.followUpPrompt
          : followUpPrompt // ignore: cast_nullable_to_non_nullable
              as String?,
      followUpSeconds: freezed == followUpSeconds
          ? _value.followUpSeconds
          : followUpSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PronunciationBlockImpl implements PronunciationBlock {
  const _$PronunciationBlockImpl(
      {required this.phrase,
      required this.focus,
      required this.modelText,
      required this.recordingSeconds,
      this.followUpPrompt,
      this.followUpSeconds,
      final String? $type})
      : $type = $type ?? 'pronunciation';

  factory _$PronunciationBlockImpl.fromJson(Map<String, dynamic> json) =>
      _$$PronunciationBlockImplFromJson(json);

  @override
  final String phrase;
  @override
  final PronunciationFocus focus;
  @override
  final String modelText;
  @override
  final int recordingSeconds;
  @override
  final String? followUpPrompt;
  @override
  final int? followUpSeconds;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'IeltsBlock.pronunciation(phrase: $phrase, focus: $focus, modelText: $modelText, recordingSeconds: $recordingSeconds, followUpPrompt: $followUpPrompt, followUpSeconds: $followUpSeconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PronunciationBlockImpl &&
            (identical(other.phrase, phrase) || other.phrase == phrase) &&
            (identical(other.focus, focus) || other.focus == focus) &&
            (identical(other.modelText, modelText) ||
                other.modelText == modelText) &&
            (identical(other.recordingSeconds, recordingSeconds) ||
                other.recordingSeconds == recordingSeconds) &&
            (identical(other.followUpPrompt, followUpPrompt) ||
                other.followUpPrompt == followUpPrompt) &&
            (identical(other.followUpSeconds, followUpSeconds) ||
                other.followUpSeconds == followUpSeconds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, phrase, focus, modelText,
      recordingSeconds, followUpPrompt, followUpSeconds);

  /// Create a copy of IeltsBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PronunciationBlockImplCopyWith<_$PronunciationBlockImpl> get copyWith =>
      __$$PronunciationBlockImplCopyWithImpl<_$PronunciationBlockImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title, String body) explanation,
    required TResult Function(String prompt, String weakAnswer,
            String strongAnswer, String whyStrong)
        exampleAnswer,
    required TResult Function(String weak, String strong, String notes)
        weakStrong,
    required TResult Function(String formulaName, List<String> steps) formula,
    required TResult Function(String question, List<McOption> options,
            String correctOptionId, String explanation)
        multipleChoice,
    required TResult Function(String prompt, int durationSeconds,
            IeltsPart targetPart, String instructions, String? gradingRubric)
        recordAnswer,
    required TResult Function(String topic, List<String> bulletPoints,
            int prepSeconds, int speakingSeconds)
        cueCard,
    required TResult Function(
            String basicPhrase,
            List<VocabUpgrade> upgradedPhrases,
            String practicePrompt,
            int durationSeconds)
        vocabularyUpgrade,
    required TResult Function(
            String phrase,
            PronunciationFocus focus,
            String modelText,
            int recordingSeconds,
            String? followUpPrompt,
            int? followUpSeconds)
        pronunciation,
    required TResult Function(String instructions, int estimatedMinutes)
        aiTutorMock,
    required TResult Function(List<String> keyTakeaways, String? nextLessonId)
        summary,
  }) {
    return pronunciation(phrase, focus, modelText, recordingSeconds,
        followUpPrompt, followUpSeconds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title, String body)? explanation,
    TResult? Function(String prompt, String weakAnswer, String strongAnswer,
            String whyStrong)?
        exampleAnswer,
    TResult? Function(String weak, String strong, String notes)? weakStrong,
    TResult? Function(String formulaName, List<String> steps)? formula,
    TResult? Function(String question, List<McOption> options,
            String correctOptionId, String explanation)?
        multipleChoice,
    TResult? Function(String prompt, int durationSeconds, IeltsPart targetPart,
            String instructions, String? gradingRubric)?
        recordAnswer,
    TResult? Function(String topic, List<String> bulletPoints, int prepSeconds,
            int speakingSeconds)?
        cueCard,
    TResult? Function(String basicPhrase, List<VocabUpgrade> upgradedPhrases,
            String practicePrompt, int durationSeconds)?
        vocabularyUpgrade,
    TResult? Function(String phrase, PronunciationFocus focus, String modelText,
            int recordingSeconds, String? followUpPrompt, int? followUpSeconds)?
        pronunciation,
    TResult? Function(String instructions, int estimatedMinutes)? aiTutorMock,
    TResult? Function(List<String> keyTakeaways, String? nextLessonId)? summary,
  }) {
    return pronunciation?.call(phrase, focus, modelText, recordingSeconds,
        followUpPrompt, followUpSeconds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, String body)? explanation,
    TResult Function(String prompt, String weakAnswer, String strongAnswer,
            String whyStrong)?
        exampleAnswer,
    TResult Function(String weak, String strong, String notes)? weakStrong,
    TResult Function(String formulaName, List<String> steps)? formula,
    TResult Function(String question, List<McOption> options,
            String correctOptionId, String explanation)?
        multipleChoice,
    TResult Function(String prompt, int durationSeconds, IeltsPart targetPart,
            String instructions, String? gradingRubric)?
        recordAnswer,
    TResult Function(String topic, List<String> bulletPoints, int prepSeconds,
            int speakingSeconds)?
        cueCard,
    TResult Function(String basicPhrase, List<VocabUpgrade> upgradedPhrases,
            String practicePrompt, int durationSeconds)?
        vocabularyUpgrade,
    TResult Function(String phrase, PronunciationFocus focus, String modelText,
            int recordingSeconds, String? followUpPrompt, int? followUpSeconds)?
        pronunciation,
    TResult Function(String instructions, int estimatedMinutes)? aiTutorMock,
    TResult Function(List<String> keyTakeaways, String? nextLessonId)? summary,
    required TResult orElse(),
  }) {
    if (pronunciation != null) {
      return pronunciation(phrase, focus, modelText, recordingSeconds,
          followUpPrompt, followUpSeconds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExplanationBlock value) explanation,
    required TResult Function(ExampleAnswerBlock value) exampleAnswer,
    required TResult Function(WeakStrongBlock value) weakStrong,
    required TResult Function(FormulaBlock value) formula,
    required TResult Function(MultipleChoiceBlock value) multipleChoice,
    required TResult Function(RecordAnswerBlock value) recordAnswer,
    required TResult Function(CueCardBlock value) cueCard,
    required TResult Function(VocabularyUpgradeBlock value) vocabularyUpgrade,
    required TResult Function(PronunciationBlock value) pronunciation,
    required TResult Function(AiTutorMockBlock value) aiTutorMock,
    required TResult Function(SummaryBlock value) summary,
  }) {
    return pronunciation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExplanationBlock value)? explanation,
    TResult? Function(ExampleAnswerBlock value)? exampleAnswer,
    TResult? Function(WeakStrongBlock value)? weakStrong,
    TResult? Function(FormulaBlock value)? formula,
    TResult? Function(MultipleChoiceBlock value)? multipleChoice,
    TResult? Function(RecordAnswerBlock value)? recordAnswer,
    TResult? Function(CueCardBlock value)? cueCard,
    TResult? Function(VocabularyUpgradeBlock value)? vocabularyUpgrade,
    TResult? Function(PronunciationBlock value)? pronunciation,
    TResult? Function(AiTutorMockBlock value)? aiTutorMock,
    TResult? Function(SummaryBlock value)? summary,
  }) {
    return pronunciation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExplanationBlock value)? explanation,
    TResult Function(ExampleAnswerBlock value)? exampleAnswer,
    TResult Function(WeakStrongBlock value)? weakStrong,
    TResult Function(FormulaBlock value)? formula,
    TResult Function(MultipleChoiceBlock value)? multipleChoice,
    TResult Function(RecordAnswerBlock value)? recordAnswer,
    TResult Function(CueCardBlock value)? cueCard,
    TResult Function(VocabularyUpgradeBlock value)? vocabularyUpgrade,
    TResult Function(PronunciationBlock value)? pronunciation,
    TResult Function(AiTutorMockBlock value)? aiTutorMock,
    TResult Function(SummaryBlock value)? summary,
    required TResult orElse(),
  }) {
    if (pronunciation != null) {
      return pronunciation(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PronunciationBlockImplToJson(
      this,
    );
  }
}

abstract class PronunciationBlock implements IeltsBlock {
  const factory PronunciationBlock(
      {required final String phrase,
      required final PronunciationFocus focus,
      required final String modelText,
      required final int recordingSeconds,
      final String? followUpPrompt,
      final int? followUpSeconds}) = _$PronunciationBlockImpl;

  factory PronunciationBlock.fromJson(Map<String, dynamic> json) =
      _$PronunciationBlockImpl.fromJson;

  String get phrase;
  PronunciationFocus get focus;
  String get modelText;
  int get recordingSeconds;
  String? get followUpPrompt;
  int? get followUpSeconds;

  /// Create a copy of IeltsBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PronunciationBlockImplCopyWith<_$PronunciationBlockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AiTutorMockBlockImplCopyWith<$Res> {
  factory _$$AiTutorMockBlockImplCopyWith(_$AiTutorMockBlockImpl value,
          $Res Function(_$AiTutorMockBlockImpl) then) =
      __$$AiTutorMockBlockImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String instructions, int estimatedMinutes});
}

/// @nodoc
class __$$AiTutorMockBlockImplCopyWithImpl<$Res>
    extends _$IeltsBlockCopyWithImpl<$Res, _$AiTutorMockBlockImpl>
    implements _$$AiTutorMockBlockImplCopyWith<$Res> {
  __$$AiTutorMockBlockImplCopyWithImpl(_$AiTutorMockBlockImpl _value,
      $Res Function(_$AiTutorMockBlockImpl) _then)
      : super(_value, _then);

  /// Create a copy of IeltsBlock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instructions = null,
    Object? estimatedMinutes = null,
  }) {
    return _then(_$AiTutorMockBlockImpl(
      instructions: null == instructions
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedMinutes: null == estimatedMinutes
          ? _value.estimatedMinutes
          : estimatedMinutes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AiTutorMockBlockImpl implements AiTutorMockBlock {
  const _$AiTutorMockBlockImpl(
      {required this.instructions,
      required this.estimatedMinutes,
      final String? $type})
      : $type = $type ?? 'ai_tutor_mock';

  factory _$AiTutorMockBlockImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiTutorMockBlockImplFromJson(json);

  @override
  final String instructions;
  @override
  final int estimatedMinutes;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'IeltsBlock.aiTutorMock(instructions: $instructions, estimatedMinutes: $estimatedMinutes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiTutorMockBlockImpl &&
            (identical(other.instructions, instructions) ||
                other.instructions == instructions) &&
            (identical(other.estimatedMinutes, estimatedMinutes) ||
                other.estimatedMinutes == estimatedMinutes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, instructions, estimatedMinutes);

  /// Create a copy of IeltsBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiTutorMockBlockImplCopyWith<_$AiTutorMockBlockImpl> get copyWith =>
      __$$AiTutorMockBlockImplCopyWithImpl<_$AiTutorMockBlockImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title, String body) explanation,
    required TResult Function(String prompt, String weakAnswer,
            String strongAnswer, String whyStrong)
        exampleAnswer,
    required TResult Function(String weak, String strong, String notes)
        weakStrong,
    required TResult Function(String formulaName, List<String> steps) formula,
    required TResult Function(String question, List<McOption> options,
            String correctOptionId, String explanation)
        multipleChoice,
    required TResult Function(String prompt, int durationSeconds,
            IeltsPart targetPart, String instructions, String? gradingRubric)
        recordAnswer,
    required TResult Function(String topic, List<String> bulletPoints,
            int prepSeconds, int speakingSeconds)
        cueCard,
    required TResult Function(
            String basicPhrase,
            List<VocabUpgrade> upgradedPhrases,
            String practicePrompt,
            int durationSeconds)
        vocabularyUpgrade,
    required TResult Function(
            String phrase,
            PronunciationFocus focus,
            String modelText,
            int recordingSeconds,
            String? followUpPrompt,
            int? followUpSeconds)
        pronunciation,
    required TResult Function(String instructions, int estimatedMinutes)
        aiTutorMock,
    required TResult Function(List<String> keyTakeaways, String? nextLessonId)
        summary,
  }) {
    return aiTutorMock(instructions, estimatedMinutes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title, String body)? explanation,
    TResult? Function(String prompt, String weakAnswer, String strongAnswer,
            String whyStrong)?
        exampleAnswer,
    TResult? Function(String weak, String strong, String notes)? weakStrong,
    TResult? Function(String formulaName, List<String> steps)? formula,
    TResult? Function(String question, List<McOption> options,
            String correctOptionId, String explanation)?
        multipleChoice,
    TResult? Function(String prompt, int durationSeconds, IeltsPart targetPart,
            String instructions, String? gradingRubric)?
        recordAnswer,
    TResult? Function(String topic, List<String> bulletPoints, int prepSeconds,
            int speakingSeconds)?
        cueCard,
    TResult? Function(String basicPhrase, List<VocabUpgrade> upgradedPhrases,
            String practicePrompt, int durationSeconds)?
        vocabularyUpgrade,
    TResult? Function(String phrase, PronunciationFocus focus, String modelText,
            int recordingSeconds, String? followUpPrompt, int? followUpSeconds)?
        pronunciation,
    TResult? Function(String instructions, int estimatedMinutes)? aiTutorMock,
    TResult? Function(List<String> keyTakeaways, String? nextLessonId)? summary,
  }) {
    return aiTutorMock?.call(instructions, estimatedMinutes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, String body)? explanation,
    TResult Function(String prompt, String weakAnswer, String strongAnswer,
            String whyStrong)?
        exampleAnswer,
    TResult Function(String weak, String strong, String notes)? weakStrong,
    TResult Function(String formulaName, List<String> steps)? formula,
    TResult Function(String question, List<McOption> options,
            String correctOptionId, String explanation)?
        multipleChoice,
    TResult Function(String prompt, int durationSeconds, IeltsPart targetPart,
            String instructions, String? gradingRubric)?
        recordAnswer,
    TResult Function(String topic, List<String> bulletPoints, int prepSeconds,
            int speakingSeconds)?
        cueCard,
    TResult Function(String basicPhrase, List<VocabUpgrade> upgradedPhrases,
            String practicePrompt, int durationSeconds)?
        vocabularyUpgrade,
    TResult Function(String phrase, PronunciationFocus focus, String modelText,
            int recordingSeconds, String? followUpPrompt, int? followUpSeconds)?
        pronunciation,
    TResult Function(String instructions, int estimatedMinutes)? aiTutorMock,
    TResult Function(List<String> keyTakeaways, String? nextLessonId)? summary,
    required TResult orElse(),
  }) {
    if (aiTutorMock != null) {
      return aiTutorMock(instructions, estimatedMinutes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExplanationBlock value) explanation,
    required TResult Function(ExampleAnswerBlock value) exampleAnswer,
    required TResult Function(WeakStrongBlock value) weakStrong,
    required TResult Function(FormulaBlock value) formula,
    required TResult Function(MultipleChoiceBlock value) multipleChoice,
    required TResult Function(RecordAnswerBlock value) recordAnswer,
    required TResult Function(CueCardBlock value) cueCard,
    required TResult Function(VocabularyUpgradeBlock value) vocabularyUpgrade,
    required TResult Function(PronunciationBlock value) pronunciation,
    required TResult Function(AiTutorMockBlock value) aiTutorMock,
    required TResult Function(SummaryBlock value) summary,
  }) {
    return aiTutorMock(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExplanationBlock value)? explanation,
    TResult? Function(ExampleAnswerBlock value)? exampleAnswer,
    TResult? Function(WeakStrongBlock value)? weakStrong,
    TResult? Function(FormulaBlock value)? formula,
    TResult? Function(MultipleChoiceBlock value)? multipleChoice,
    TResult? Function(RecordAnswerBlock value)? recordAnswer,
    TResult? Function(CueCardBlock value)? cueCard,
    TResult? Function(VocabularyUpgradeBlock value)? vocabularyUpgrade,
    TResult? Function(PronunciationBlock value)? pronunciation,
    TResult? Function(AiTutorMockBlock value)? aiTutorMock,
    TResult? Function(SummaryBlock value)? summary,
  }) {
    return aiTutorMock?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExplanationBlock value)? explanation,
    TResult Function(ExampleAnswerBlock value)? exampleAnswer,
    TResult Function(WeakStrongBlock value)? weakStrong,
    TResult Function(FormulaBlock value)? formula,
    TResult Function(MultipleChoiceBlock value)? multipleChoice,
    TResult Function(RecordAnswerBlock value)? recordAnswer,
    TResult Function(CueCardBlock value)? cueCard,
    TResult Function(VocabularyUpgradeBlock value)? vocabularyUpgrade,
    TResult Function(PronunciationBlock value)? pronunciation,
    TResult Function(AiTutorMockBlock value)? aiTutorMock,
    TResult Function(SummaryBlock value)? summary,
    required TResult orElse(),
  }) {
    if (aiTutorMock != null) {
      return aiTutorMock(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AiTutorMockBlockImplToJson(
      this,
    );
  }
}

abstract class AiTutorMockBlock implements IeltsBlock {
  const factory AiTutorMockBlock(
      {required final String instructions,
      required final int estimatedMinutes}) = _$AiTutorMockBlockImpl;

  factory AiTutorMockBlock.fromJson(Map<String, dynamic> json) =
      _$AiTutorMockBlockImpl.fromJson;

  String get instructions;
  int get estimatedMinutes;

  /// Create a copy of IeltsBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiTutorMockBlockImplCopyWith<_$AiTutorMockBlockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SummaryBlockImplCopyWith<$Res> {
  factory _$$SummaryBlockImplCopyWith(
          _$SummaryBlockImpl value, $Res Function(_$SummaryBlockImpl) then) =
      __$$SummaryBlockImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> keyTakeaways, String? nextLessonId});
}

/// @nodoc
class __$$SummaryBlockImplCopyWithImpl<$Res>
    extends _$IeltsBlockCopyWithImpl<$Res, _$SummaryBlockImpl>
    implements _$$SummaryBlockImplCopyWith<$Res> {
  __$$SummaryBlockImplCopyWithImpl(
      _$SummaryBlockImpl _value, $Res Function(_$SummaryBlockImpl) _then)
      : super(_value, _then);

  /// Create a copy of IeltsBlock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyTakeaways = null,
    Object? nextLessonId = freezed,
  }) {
    return _then(_$SummaryBlockImpl(
      keyTakeaways: null == keyTakeaways
          ? _value._keyTakeaways
          : keyTakeaways // ignore: cast_nullable_to_non_nullable
              as List<String>,
      nextLessonId: freezed == nextLessonId
          ? _value.nextLessonId
          : nextLessonId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SummaryBlockImpl implements SummaryBlock {
  const _$SummaryBlockImpl(
      {required final List<String> keyTakeaways,
      this.nextLessonId,
      final String? $type})
      : _keyTakeaways = keyTakeaways,
        $type = $type ?? 'summary';

  factory _$SummaryBlockImpl.fromJson(Map<String, dynamic> json) =>
      _$$SummaryBlockImplFromJson(json);

  final List<String> _keyTakeaways;
  @override
  List<String> get keyTakeaways {
    if (_keyTakeaways is EqualUnmodifiableListView) return _keyTakeaways;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keyTakeaways);
  }

  @override
  final String? nextLessonId;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'IeltsBlock.summary(keyTakeaways: $keyTakeaways, nextLessonId: $nextLessonId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SummaryBlockImpl &&
            const DeepCollectionEquality()
                .equals(other._keyTakeaways, _keyTakeaways) &&
            (identical(other.nextLessonId, nextLessonId) ||
                other.nextLessonId == nextLessonId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_keyTakeaways), nextLessonId);

  /// Create a copy of IeltsBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SummaryBlockImplCopyWith<_$SummaryBlockImpl> get copyWith =>
      __$$SummaryBlockImplCopyWithImpl<_$SummaryBlockImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title, String body) explanation,
    required TResult Function(String prompt, String weakAnswer,
            String strongAnswer, String whyStrong)
        exampleAnswer,
    required TResult Function(String weak, String strong, String notes)
        weakStrong,
    required TResult Function(String formulaName, List<String> steps) formula,
    required TResult Function(String question, List<McOption> options,
            String correctOptionId, String explanation)
        multipleChoice,
    required TResult Function(String prompt, int durationSeconds,
            IeltsPart targetPart, String instructions, String? gradingRubric)
        recordAnswer,
    required TResult Function(String topic, List<String> bulletPoints,
            int prepSeconds, int speakingSeconds)
        cueCard,
    required TResult Function(
            String basicPhrase,
            List<VocabUpgrade> upgradedPhrases,
            String practicePrompt,
            int durationSeconds)
        vocabularyUpgrade,
    required TResult Function(
            String phrase,
            PronunciationFocus focus,
            String modelText,
            int recordingSeconds,
            String? followUpPrompt,
            int? followUpSeconds)
        pronunciation,
    required TResult Function(String instructions, int estimatedMinutes)
        aiTutorMock,
    required TResult Function(List<String> keyTakeaways, String? nextLessonId)
        summary,
  }) {
    return summary(keyTakeaways, nextLessonId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title, String body)? explanation,
    TResult? Function(String prompt, String weakAnswer, String strongAnswer,
            String whyStrong)?
        exampleAnswer,
    TResult? Function(String weak, String strong, String notes)? weakStrong,
    TResult? Function(String formulaName, List<String> steps)? formula,
    TResult? Function(String question, List<McOption> options,
            String correctOptionId, String explanation)?
        multipleChoice,
    TResult? Function(String prompt, int durationSeconds, IeltsPart targetPart,
            String instructions, String? gradingRubric)?
        recordAnswer,
    TResult? Function(String topic, List<String> bulletPoints, int prepSeconds,
            int speakingSeconds)?
        cueCard,
    TResult? Function(String basicPhrase, List<VocabUpgrade> upgradedPhrases,
            String practicePrompt, int durationSeconds)?
        vocabularyUpgrade,
    TResult? Function(String phrase, PronunciationFocus focus, String modelText,
            int recordingSeconds, String? followUpPrompt, int? followUpSeconds)?
        pronunciation,
    TResult? Function(String instructions, int estimatedMinutes)? aiTutorMock,
    TResult? Function(List<String> keyTakeaways, String? nextLessonId)? summary,
  }) {
    return summary?.call(keyTakeaways, nextLessonId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, String body)? explanation,
    TResult Function(String prompt, String weakAnswer, String strongAnswer,
            String whyStrong)?
        exampleAnswer,
    TResult Function(String weak, String strong, String notes)? weakStrong,
    TResult Function(String formulaName, List<String> steps)? formula,
    TResult Function(String question, List<McOption> options,
            String correctOptionId, String explanation)?
        multipleChoice,
    TResult Function(String prompt, int durationSeconds, IeltsPart targetPart,
            String instructions, String? gradingRubric)?
        recordAnswer,
    TResult Function(String topic, List<String> bulletPoints, int prepSeconds,
            int speakingSeconds)?
        cueCard,
    TResult Function(String basicPhrase, List<VocabUpgrade> upgradedPhrases,
            String practicePrompt, int durationSeconds)?
        vocabularyUpgrade,
    TResult Function(String phrase, PronunciationFocus focus, String modelText,
            int recordingSeconds, String? followUpPrompt, int? followUpSeconds)?
        pronunciation,
    TResult Function(String instructions, int estimatedMinutes)? aiTutorMock,
    TResult Function(List<String> keyTakeaways, String? nextLessonId)? summary,
    required TResult orElse(),
  }) {
    if (summary != null) {
      return summary(keyTakeaways, nextLessonId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExplanationBlock value) explanation,
    required TResult Function(ExampleAnswerBlock value) exampleAnswer,
    required TResult Function(WeakStrongBlock value) weakStrong,
    required TResult Function(FormulaBlock value) formula,
    required TResult Function(MultipleChoiceBlock value) multipleChoice,
    required TResult Function(RecordAnswerBlock value) recordAnswer,
    required TResult Function(CueCardBlock value) cueCard,
    required TResult Function(VocabularyUpgradeBlock value) vocabularyUpgrade,
    required TResult Function(PronunciationBlock value) pronunciation,
    required TResult Function(AiTutorMockBlock value) aiTutorMock,
    required TResult Function(SummaryBlock value) summary,
  }) {
    return summary(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExplanationBlock value)? explanation,
    TResult? Function(ExampleAnswerBlock value)? exampleAnswer,
    TResult? Function(WeakStrongBlock value)? weakStrong,
    TResult? Function(FormulaBlock value)? formula,
    TResult? Function(MultipleChoiceBlock value)? multipleChoice,
    TResult? Function(RecordAnswerBlock value)? recordAnswer,
    TResult? Function(CueCardBlock value)? cueCard,
    TResult? Function(VocabularyUpgradeBlock value)? vocabularyUpgrade,
    TResult? Function(PronunciationBlock value)? pronunciation,
    TResult? Function(AiTutorMockBlock value)? aiTutorMock,
    TResult? Function(SummaryBlock value)? summary,
  }) {
    return summary?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExplanationBlock value)? explanation,
    TResult Function(ExampleAnswerBlock value)? exampleAnswer,
    TResult Function(WeakStrongBlock value)? weakStrong,
    TResult Function(FormulaBlock value)? formula,
    TResult Function(MultipleChoiceBlock value)? multipleChoice,
    TResult Function(RecordAnswerBlock value)? recordAnswer,
    TResult Function(CueCardBlock value)? cueCard,
    TResult Function(VocabularyUpgradeBlock value)? vocabularyUpgrade,
    TResult Function(PronunciationBlock value)? pronunciation,
    TResult Function(AiTutorMockBlock value)? aiTutorMock,
    TResult Function(SummaryBlock value)? summary,
    required TResult orElse(),
  }) {
    if (summary != null) {
      return summary(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SummaryBlockImplToJson(
      this,
    );
  }
}

abstract class SummaryBlock implements IeltsBlock {
  const factory SummaryBlock(
      {required final List<String> keyTakeaways,
      final String? nextLessonId}) = _$SummaryBlockImpl;

  factory SummaryBlock.fromJson(Map<String, dynamic> json) =
      _$SummaryBlockImpl.fromJson;

  List<String> get keyTakeaways;
  String? get nextLessonId;

  /// Create a copy of IeltsBlock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SummaryBlockImplCopyWith<_$SummaryBlockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
