import 'package:freezed_annotation/freezed_annotation.dart';

import 'ielts_block.dart';
import 'ielts_enums.dart';

part 'ielts_lessons.freezed.dart';
part 'ielts_lessons.g.dart';

/// Build-time lesson. The catalogue is `const`, never fetched from the DB. See 14.
@freezed
class IeltsLesson with _$IeltsLesson {
  const factory IeltsLesson({
    required String id,
    required String slug,
    required String title,
    required int unit,
    required String unitTitle,
    required IeltsPart part,
    required int estimatedMinutes,
    required List<String> skillTags,
    required String description,
    required String learningObjective,
    required List<IeltsBlock> blocks,
    required List<String> scoringFocus,
    required int unlockOrder,
    required int xpReward,
  }) = _IeltsLesson;

  factory IeltsLesson.fromJson(Map<String, dynamic> j) =>
      _$IeltsLessonFromJson(j);
}

/// Ported from `koras-web/src/lib/ielts/ielts-lessons.ts`.
///
/// TODO(content): transcribe the remaining lessons + blocks verbatim from the
/// web catalogue — it is the source of truth for lesson content. The structural
/// runtime below renders any lesson, so adding lessons is data-only.
const kIeltsLessons = <IeltsLesson>[
  IeltsLesson(
    id: 'ielts-1-overview',
    slug: 'ielts-speaking-overview',
    title: 'IELTS Speaking Overview',
    unit: 1,
    unitTitle: 'Foundations',
    part: IeltsPart.overview,
    estimatedMinutes: 5,
    skillTags: ['fluency'],
    description: 'How the IELTS speaking test works and how Koras grades you.',
    learningObjective: 'Understand the structure of the speaking test.',
    scoringFocus: ['fluencyCoherence'],
    unlockOrder: 1,
    xpReward: 30,
    blocks: [
      IeltsBlock.explanation(
        title: 'Three parts, twelve to fifteen minutes',
        body:
            'The speaking test has three parts: a short interview, a long turn '
            'from a cue card, and a two-way discussion.',
      ),
      IeltsBlock.recordAnswer(
        prompt: 'Tell me a little about where you live.',
        durationSeconds: 45,
        targetPart: IeltsPart.part1,
        instructions: 'Speak naturally for about 45 seconds.',
      ),
      IeltsBlock.summary(keyTakeaways: [
        'Three parts, ~12–15 minutes.',
        'You are graded on four criteria.',
      ]),
    ],
  ),
  IeltsLesson(
    id: 'ielts-2-longer-answers',
    slug: 'part-1-longer-answers',
    title: 'Part 1: Give Longer Answers',
    unit: 2,
    unitTitle: 'Part 1 Mastery',
    part: IeltsPart.part1,
    estimatedMinutes: 6,
    skillTags: ['fluency', 'vocabulary'],
    description: 'Extend short answers into full, fluent responses.',
    learningObjective: 'Turn one-word answers into developed responses.',
    scoringFocus: ['fluencyCoherence', 'lexicalResource'],
    unlockOrder: 2,
    xpReward: 50,
    blocks: [
      IeltsBlock.weakStrong(
        weak: 'Yes, I like reading.',
        strong: 'Yes, I really enjoy reading — especially historical fiction, '
            'because it lets me escape into another time.',
        notes: 'Add a reason and a specific example.',
      ),
      IeltsBlock.formula(
        formulaName: 'Answer → Reason → Example',
        steps: ['Give a direct answer', 'Add a reason', 'Give an example'],
      ),
      IeltsBlock.recordAnswer(
        prompt: 'Do you enjoy cooking? Why or why not?',
        durationSeconds: 60,
        targetPart: IeltsPart.part1,
        instructions: 'Use the Answer → Reason → Example formula.',
      ),
      IeltsBlock.summary(keyTakeaways: [
        'Always extend your answer with a reason and example.',
      ]),
    ],
  ),
];

List<IeltsLesson> ieltsLessonsForPart(IeltsPart part) =>
    kIeltsLessons.where((l) => l.part == part).toList();

IeltsLesson? ieltsLessonById(String id) {
  for (final l in kIeltsLessons) {
    if (l.id == id) return l;
  }
  return null;
}
