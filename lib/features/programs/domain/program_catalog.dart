import 'package:flutter/widgets.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../shared/models/enums.dart';

/// Static program catalogue — the single source for cards, routes, and gating.
/// Ported verbatim from `koras-web/src/lib/programs/catalog.ts`. See 23.
@immutable
class Program {
  const Program({
    required this.id,
    required this.label,
    required this.description,
    required this.status,
    required this.icon,
    this.route,
  });

  final String id;
  final String label;
  final String description;
  final ProgramStatus status;
  final String? route;
  final IconData icon;
}

const kPrograms = <Program>[
  Program(
    id: 'ai-tutor',
    label: 'AI Tutor',
    status: ProgramStatus.live,
    description:
        'A conversational tutor for any subject — quick questions, deep dives, or full lesson recaps.',
    icon: LucideIcons.bot,
    route: '/app/ai-tutor',
  ),
  Program(
    id: 'historical-conversations',
    label: 'Historical Conversations',
    status: ProgramStatus.incoming,
    description:
        'Practice your speaking by holding a conversation with figures from history.',
    icon: LucideIcons.messageSquare,
  ),
  Program(
    id: 'daily-lesson-plan',
    label: 'Daily Lesson Plan Engine',
    status: ProgramStatus.live,
    description:
        'A personalized plan refreshed every 24 hours based on what you need to work on.',
    icon: LucideIcons.calendarRange,
    route: '/app/dashboard',
  ),
  Program(
    id: 'voice-foundations',
    label: 'Voice Foundations',
    status: ProgramStatus.live,
    description:
        'Build the basics — breath, pace, articulation, and clarity — through 7 guided days.',
    icon: LucideIcons.layers,
    route: '/app/voice-foundations',
  ),
  Program(
    id: 'daily-vocabulary',
    label: 'Daily Vocabulary',
    status: ProgramStatus.live,
    description: 'A new word and pronunciation challenge every day.',
    icon: LucideIcons.bookText,
    route: '/app/vocabulary',
  ),
  Program(
    id: 'reading',
    label: 'Reading',
    status: ProgramStatus.live,
    description:
        'Read aloud through a programme built around your voice — stages, lessons, and instant feedback on pace and flow.',
    icon: LucideIcons.bookOpen,
    route: '/app/reading',
  ),
  Program(
    id: 'listening-comprehension',
    label: 'Listening Comprehension',
    status: ProgramStatus.live,
    description:
        'Listen to real-world passages and answer with taps or your voice.',
    icon: LucideIcons.headphones,
    route: '/app/listening',
  ),
  Program(
    id: 'voice-refinement',
    label: 'Voice Refinement',
    status: ProgramStatus.live,
    description:
        'Record a baseline, set a target voice, and follow a 14-day plan.',
    icon: LucideIcons.slidersHorizontal,
    route: '/app/voice-refinement',
  ),
  Program(
    id: 'progress-tracking',
    label: 'Progress Tracking',
    status: ProgramStatus.incoming,
    description: 'XP, streaks, and skill bars to see how you grow over time.',
    icon: LucideIcons.chartColumn,
  ),
  Program(
    id: 'before-after-milestones',
    label: 'Before/After Milestones',
    status: ProgramStatus.incoming,
    description: 'Compare your voice today to how you sounded weeks ago.',
    icon: LucideIcons.flag,
  ),
  Program(
    id: 'confidence-filler',
    label: 'Confidence & Filler Control',
    status: ProgramStatus.incoming,
    description: 'Targeted exercises to reduce ums, ahs, and hedging language.',
    icon: LucideIcons.slidersHorizontal,
  ),
  Program(
    id: 'public-speaking',
    label: 'Public Speaking',
    status: ProgramStatus.incoming,
    description:
        'Practice presentations, speeches, and persuasion with real-time feedback.',
    icon: LucideIcons.mic,
  ),
  Program(
    id: 'ielts-speaking',
    label: 'IELTS Speaking',
    status: ProgramStatus.live,
    description:
        'Full IELTS Speaking practice with all 3 parts and authentic scoring.',
    icon: LucideIcons.graduationCap,
    route: '/app/ielts',
  ),
  Program(
    id: 'interview-prep',
    label: 'Interview Prep',
    status: ProgramStatus.live,
    description:
        'Save your interview context, practice with an AI interviewer, get scored.',
    icon: LucideIcons.briefcase,
    route: '/app/interview-prep',
  ),
];

Program? findProgram(String? id) =>
    kPrograms.where((p) => p.id == id).firstOrNull;
