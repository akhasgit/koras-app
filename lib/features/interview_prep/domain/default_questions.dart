import '../data/interview_models.dart';
import 'interview_enums.dart';

/// Offline / fallback question bank, ported from
/// `koras-web/src/lib/interview-prep/default-questions.ts`.
///
/// TODO(content): transcribe the full default bank verbatim from the web.
const kDefaultQuestions = <InterviewQuestion>[
  InterviewQuestion(
    id: 'q-tell-me-about-yourself',
    question: 'Tell me about yourself.',
    questionType: InterviewQuestionType.general,
  ),
  InterviewQuestion(
    id: 'q-why-this-role',
    question: 'Why are you interested in this role?',
    questionType: InterviewQuestionType.motivation,
  ),
  InterviewQuestion(
    id: 'q-greatest-strength',
    question: 'What is your greatest strength?',
    questionType: InterviewQuestionType.strengths,
  ),
  InterviewQuestion(
    id: 'q-biggest-weakness',
    question: 'What is your biggest weakness?',
    questionType: InterviewQuestionType.weakness,
  ),
  InterviewQuestion(
    id: 'q-conflict',
    question: 'Tell me about a time you handled a conflict on a team.',
    questionType: InterviewQuestionType.teamwork,
    framework: InterviewFramework.star,
  ),
  InterviewQuestion(
    id: 'q-leadership',
    question: 'Describe a time you led a project or a team.',
    questionType: InterviewQuestionType.leadership,
    framework: InterviewFramework.star,
  ),
];
