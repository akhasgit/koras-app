// Onboarding quiz config, ported verbatim from `onboarding-config.ts`. See 19.

class OnboardingOption {
  const OnboardingOption(this.value, this.label, this.icon);
  final String value;
  final String label;
  final String icon;
}

class OnboardingQuestion {
  const OnboardingQuestion({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.options,
    this.allowMultiple = false,
  });

  final String id;
  final String title;
  final String subtitle;
  final bool allowMultiple;
  final List<OnboardingOption> options;
}

const kOnboardingQuestions = <OnboardingQuestion>[
  OnboardingQuestion(
    id: 'goal',
    title: 'What brings you to Koras?',
    subtitle: "Pick all that apply — we'll tailor your experience.",
    allowMultiple: true,
    options: [
      OnboardingOption(
          'build_confidence', 'Build speaking confidence', 'Sparkles'),
      OnboardingOption('reduce_accent', 'Soften my accent', 'Globe2'),
      OnboardingOption('interview_prep', 'Prepare for interviews', 'Briefcase'),
      OnboardingOption('presentations', 'Speak better at work', 'Presentation'),
      OnboardingOption('creator', 'Sound better on camera or mic', 'Mic2'),
      OnboardingOption('other', 'Something else', 'MoreHorizontal'),
    ],
  ),
  OnboardingQuestion(
    id: 'background',
    title: 'Tell us about you.',
    subtitle: 'This helps us tailor your coaching.',
    options: [
      OnboardingOption('native_english', 'Native English speaker', 'Flag'),
      OnboardingOption(
          'esl_advanced', 'English learner — advanced', 'Languages'),
      OnboardingOption(
          'esl_intermediate', 'English learner — intermediate', 'Languages'),
      OnboardingOption('student', 'Student', 'GraduationCap'),
      OnboardingOption('professional', 'Working professional', 'Briefcase'),
    ],
  ),
  OnboardingQuestion(
    id: 'biggest_challenge',
    title: 'What gets in your way most?',
    subtitle: 'Be honest — this is where we start.',
    options: [
      OnboardingOption(
          'fillers', 'Filler words (um, like, you know)', 'MessageSquare'),
      OnboardingOption('pace', 'Speaking too fast or too slow', 'Gauge'),
      OnboardingOption('clarity', 'Mumbling or unclear speech', 'Volume2'),
      OnboardingOption('confidence', 'Sounding nervous or uncertain', 'Heart'),
      OnboardingOption('monotone', 'Sounding flat or monotone', 'Activity'),
      OnboardingOption('accent', 'Strong accent affecting clarity', 'Globe2'),
    ],
  ),
  OnboardingQuestion(
    id: 'interested_program',
    title: 'Which program sounds right for you?',
    subtitle: "You can change this any time — it's just a starting point.",
    options: [
      OnboardingOption('exam_prep', 'Exam Prep (IELTS, TOEFL)', 'BookOpen'),
      OnboardingOption('interview_prep', 'Interview Prep', 'Briefcase'),
      OnboardingOption('public_speaking', 'Public Speaking', 'Mic2'),
      OnboardingOption('speech_recovery', 'Speech Recovery', 'Heart'),
      OnboardingOption('creators', 'For Creators', 'Video'),
      OnboardingOption('accent_reduction', 'Accent Reduction', 'Globe2'),
      OnboardingOption(
          'not_sure', 'Not sure yet — recommend one', 'HelpCircle'),
    ],
  ),
];

const challengeToProgram = <String, String>{
  'fillers': 'public_speaking',
  'pace': 'public_speaking',
  'clarity': 'public_speaking',
  'confidence': 'interview_prep',
  'monotone': 'creators',
  'accent': 'accent_reduction',
};

String recommendProgram({String? interestedProgram, String? biggestChallenge}) {
  if (interestedProgram != null && interestedProgram != 'not_sure') {
    return interestedProgram;
  }
  if (biggestChallenge != null &&
      challengeToProgram.containsKey(biggestChallenge)) {
    return challengeToProgram[biggestChallenge]!;
  }
  return 'public_speaking';
}
