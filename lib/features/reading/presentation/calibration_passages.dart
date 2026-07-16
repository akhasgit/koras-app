/// Bundled static calibration passages — one persona-appropriate ~60–80 word
/// read for the first-entry calibration attempt (§0 product summary).
///
/// ─────────────────────────────────────────────────────────────────────────
/// COPY REVIEW REQUIRED: every passage below is learner-facing copy.
/// British English throughout. Keep each passage between 60 and 80 words —
/// the analysis pipeline assumes a short, known text.
/// ─────────────────────────────────────────────────────────────────────────
library;

class CalibrationPassage {
  const CalibrationPassage({
    required this.id,
    required this.text,
    required this.guideWpm,
  });

  final String id;
  final String text;

  /// A gentle default pace for the persona/level; sent as `guideWpm` on the
  /// calibration attempt so pace deltas are meaningful.
  final int guideWpm;
}

// ── Student, grade band 4–6 (66 words) ─────────────────────────────────────
const _studentGrade4to6 = CalibrationPassage(
  id: 'student_4_6',
  guideWpm: 95,
  text:
      'On Saturday morning, Priya and her brother walked down to the harbour '
      'to watch the fishing boats come in. The sky was pale and the water '
      'sparkled like glass. A grey cat followed them along the wall, hoping '
      'for a small piece of fish. When the first boat arrived, the children '
      'waved, and the old fisherman waved back with a smile as wide as the '
      'sea.',
);

// ── Student, grade band 7–9 (69 words) ─────────────────────────────────────
const _studentGrade7to9 = CalibrationPassage(
  id: 'student_7_9',
  guideWpm: 110,
  text:
      'The library at the end of Mill Street looked ordinary from the '
      'outside, but inside it held maps of places that no longer existed. '
      'Amara traced the faded coastline with one finger and wondered who had '
      'drawn it. Rain tapped against the tall windows while she read. By '
      'closing time she had filled three pages of her notebook with questions '
      'she was determined to answer before the summer ended.',
);

// ── Student, grade band 10–12 (68 words) ───────────────────────────────────
const _studentGrade10to12 = CalibrationPassage(
  id: 'student_10_12',
  guideWpm: 120,
  text:
      'Standing at the edge of the stage, Daniel reminded himself that nerves '
      'and excitement are nearly the same feeling. The audience settled into '
      'an expectant hush. He had rehearsed this speech in empty classrooms '
      'and on the walk to school, shaping every pause until it felt natural. '
      'Whatever happened next, he knew the difference between hoping to be '
      'heard and deciding, quite calmly, that you deserve to be.',
);

// ── University (72 words) ──────────────────────────────────────────────────
const _university = CalibrationPassage(
  id: 'university',
  guideWpm: 130,
  text:
      'Reading aloud is one of the quickest ways to reveal how a sentence '
      'actually works. When you give each clause its own breath, structure '
      'becomes audible: the argument rises, turns, and settles. Researchers '
      'who study fluent speech point to rhythm and pausing, rather than '
      'speed, as the clearest markers of confidence. This short passage '
      'simply asks you to read naturally, at a comfortable pace, as though '
      'explaining an idea to a colleague.',
);

// ── Professional (72 words) ────────────────────────────────────────────────
const _professional = CalibrationPassage(
  id: 'professional',
  guideWpm: 130,
  text:
      'Thank you all for joining at short notice. Before we look at the '
      'numbers, I want to summarise where the project stands. The first '
      'phase finished on schedule, customer feedback has been broadly '
      'positive, and the remaining risks are well understood. Over the next '
      'quarter we will focus on two priorities: improving response times and '
      'simplifying the onboarding process. I will pause after each section, '
      'so please raise questions as we go.',
);

// ── Job seeker (72 words) ──────────────────────────────────────────────────
const _jobSeeker = CalibrationPassage(
  id: 'job_seeker',
  guideWpm: 125,
  text:
      'In my previous role I coordinated a small team responsible for weekly '
      'deliveries across the region. When a supplier failed at short notice, '
      'I contacted every affected customer, arranged an alternative, and '
      'kept the schedule intact. I enjoy work that rewards clear '
      'communication and steady planning. What I am looking for now is a '
      'position where I can take on more responsibility and keep developing '
      'the skills I already use every day.',
);

// ── Other / general (67 words) ─────────────────────────────────────────────
const _other = CalibrationPassage(
  id: 'other',
  guideWpm: 120,
  text:
      'Most mornings, the small café on the corner opens before the rest of '
      'the street wakes up. The owner sets out chairs, checks the till, and '
      "writes the day's specials on a chalkboard by the door. Regulars drift "
      'in one by one, greeted by the smell of fresh coffee. It is an '
      'ordinary routine, yet it gives the whole neighbourhood a gentle, '
      'dependable start to the day.',
);

/// Pick the calibration passage for an intake persona (+ grade for students).
CalibrationPassage calibrationPassageFor(String persona, {int? gradeLevel}) {
  switch (persona) {
    case 'student':
      final grade = gradeLevel ?? 7;
      if (grade <= 6) return _studentGrade4to6;
      if (grade <= 9) return _studentGrade7to9;
      return _studentGrade10to12;
    case 'university':
      return _university;
    case 'professional':
      return _professional;
    case 'job_seeker':
      return _jobSeeker;
    default:
      return _other;
  }
}
