import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/errors/app_error.dart';
import '../../../core/theme/koras_theme.dart';
import '../../../core/theme/typography.dart';
import '../../../shared/providers/current_profile.dart';
import '../../../shared/widgets/avatar_menu_button.dart';
import '../../../shared/widgets/glass/glass_card.dart';
import '../../../shared/widgets/koras_button.dart';
import '../../../shared/widgets/koras_error.dart';
import '../../../shared/widgets/koras_header.dart';
import '../../../shared/widgets/koras_loading.dart';
import '../../../shared/widgets/koras_pill.dart';
import '../../../shared/widgets/koras_radar.dart';
import '../../../shared/widgets/koras_score_ring.dart';
import '../../learner_insights/data/learner_insights.dart';
import '../../learner_insights/data/learner_insights_repository.dart';
import '../data/assessments_repository.dart';
import '../data/voice_assessment.dart';

/// Voice tab — "Your voice" glass redesign.
/// Shows overall score ring, all 5 dimension bars, trend, coach feedback,
/// and the last 5 assessment sessions as a history list.
class ProgressScreen extends ConsumerWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(currentProfileProvider).valueOrNull;
    final latestAsync = ref.watch(latestAssessmentProvider);
    final insightsAsync = ref.watch(learnerInsightsProvider);
    final historyAsync = ref.watch(assessmentHistoryProvider);

    final statusBarH = MediaQuery.paddingOf(context).top;

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(latestAssessmentProvider);
        ref.invalidate(learnerInsightsProvider);
        ref.invalidate(assessmentHistoryProvider);
      },
      child: ListView(
        padding: EdgeInsets.only(top: statusBarH + 8, bottom: 110),
        children: [
          KorasHeader(
            kicker: 'VOICE',
            title: 'Your voice',
            italic: true,
            trailing: profile != null
                ? AvatarMenuButton(profile: profile)
                : null,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                // ── Card 1: overall score + archetype + feedback ─────────
                latestAsync.when(
                  loading: () => const KorasLoading(),
                  error: (e, _) => KorasError(message: errorToMessage(e)),
                  data: (latest) => latest == null
                      ? _NoAssessmentCard()
                      : Column(
                          children: [
                            _ScoreHeroCard(
                              latest: latest,
                              insights: insightsAsync.valueOrNull,
                            ),
                            const SizedBox(height: 14),
                            // ── Card 2: radar + dimension bars ───────────
                            _DimensionsCard(scores: latest.scores),
                            // ── Coach feedback ───────────────────────────
                            if (latest.coachFeedback?.isNotEmpty == true) ...[
                              const SizedBox(height: 14),
                              _CoachFeedbackCard(latest: latest),
                            ],
                          ],
                        ),
                ),
                const SizedBox(height: 14),

                // ── Assessment history ───────────────────────────────────
                historyAsync.when(
                  loading: () => const SizedBox.shrink(),
                  error: (_, __) => const SizedBox.shrink(),
                  data: (history) {
                    if (history.isEmpty) return const SizedBox.shrink();
                    return _HistoryCard(history: history.take(5).toList());
                  },
                ),

                // ── Insights extras ──────────────────────────────────────
                insightsAsync.when(
                  loading: () => const SizedBox.shrink(),
                  error: (_, __) => const SizedBox.shrink(),
                  data: (insights) {
                    if (insights == null) return const SizedBox.shrink();
                    return Column(
                      children: [
                        if (insights.strengthsTags.isNotEmpty ||
                            insights.weaknessesTags.isNotEmpty) ...[
                          const SizedBox(height: 14),
                          _TagsCard(insights: insights),
                        ],
                      ],
                    );
                  },
                ),

                const SizedBox(height: 14),
                _RecordCta(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Card 1 — overall ring + archetype + brief feedback
// ─────────────────────────────────────────────────────────────────────────────

class _ScoreHeroCard extends StatelessWidget {
  const _ScoreHeroCard({required this.latest, this.insights});
  final VoiceAssessment latest;
  final LearnerInsights? insights;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final trend = (insights?.improvementLast30d ?? 0).round();
    final s = latest.scores;

    // Potential: overall + half of remaining headroom (simple heuristic)
    final potential = (s.overall + (100 - s.overall) * 0.4).round();

    return GlassCard(
      strong: true,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          KorasScoreRing(value: s.overall, size: 90),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Kicker: "OVERALL · ARCHETYPE"
                Text(
                  latest.archetype != null
                      ? 'OVERALL · ${latest.archetype!.toUpperCase()}'
                      : 'OVERALL',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: k.muted, letterSpacing: 1.2),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                // One-sentence feedback
                if (latest.coachFeedback?.isNotEmpty == true)
                  Text(
                    _firstSentence(latest.coachFeedback!),
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: k.ink700, height: 1.5),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                const SizedBox(height: 10),
                // Potential pill
                if (trend != 0)
                  _PotentialPill(score: potential, up: trend > 0)
                else
                  _PotentialPill(score: potential, up: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Returns just the first sentence of feedback for the compact card.
  String _firstSentence(String text) {
    final dot = text.indexOf('. ');
    if (dot > 0 && dot < text.length - 2) return text.substring(0, dot + 1);
    return text.length > 120 ? '${text.substring(0, 120)}…' : text;
  }
}

class _PotentialPill extends StatelessWidget {
  const _PotentialPill({required this.score, required this.up});
  final int score;
  final bool up;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: k.ember.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: k.ember.withValues(alpha: 0.22)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            up ? LucideIcons.trendingUp : LucideIcons.trendingDown,
            size: 13,
            color: k.accentDeep,
          ),
          const SizedBox(width: 5),
          Text(
            'Potential  $score',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: k.accentDeep, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Card 2 — radar chart (left) + dimension score bars (right)
// ─────────────────────────────────────────────────────────────────────────────

class _DimensionsCard extends StatelessWidget {
  const _DimensionsCard({required this.scores});
  final VoiceScores scores;

  @override
  Widget build(BuildContext context) {
    // Map our 5 DB dimensions onto the pentagon vertices (clockwise from top):
    // top=Pitch, upper-right=Loudness(resonance), lower-right=Clarity,
    // lower-left=Pace, upper-left=Tone(confidence)
    final dims = [
      KorasRadarDim('PITCH', scores.pitch),
      KorasRadarDim('LOUD', scores.resonance),
      KorasRadarDim('CLAR', scores.clarity),
      KorasRadarDim('PACE', scores.pace),
      KorasRadarDim('TONE', scores.confidence),
    ];

    return GlassCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          KorasRadar(dims: dims, size: 130),
          const SizedBox(width: 16),
          // Dimension bars — full names
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _DimBar(label: 'Pitch', value: scores.pitch),
                const SizedBox(height: 10),
                _DimBar(label: 'Loudness', value: scores.resonance),
                const SizedBox(height: 10),
                _DimBar(
                    label: 'Clarity',
                    value: scores.clarity,
                    highlight: true),
                const SizedBox(height: 10),
                _DimBar(label: 'Pace', value: scores.pace),
                const SizedBox(height: 10),
                _DimBar(label: 'Tone', value: scores.confidence),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DimBar extends StatelessWidget {
  const _DimBar(
      {required this.label, required this.value, this.highlight = false});
  final String label;
  final int value;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final color = highlight ? k.success : k.ember;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: k.ink700, fontWeight: FontWeight.w500)),
            Text(
              '$value',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: LinearProgressIndicator(
            value: (value / 100).clamp(0.0, 1.0),
            minHeight: 6,
            backgroundColor: k.line,
            valueColor: AlwaysStoppedAnimation(color),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Card 3 — coach feedback (full text)
// ─────────────────────────────────────────────────────────────────────────────

class _CoachFeedbackCard extends StatelessWidget {
  const _CoachFeedbackCard({required this.latest});
  final VoiceAssessment latest;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 34,
                height: 34,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: k.ember.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(LucideIcons.lightbulb, size: 17, color: k.accentDeep),
              ),
              const SizedBox(width: 10),
              Text("Coach's top fix",
                  style: korasSerifItalic(17, color: k.ink900)),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            latest.coachFeedback!,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: k.ink700, height: 1.6),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Assessment history list
// ─────────────────────────────────────────────────────────────────────────────

class _HistoryCard extends StatelessWidget {
  const _HistoryCard({required this.history});
  final List<VoiceAssessment> history;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('SESSION HISTORY',
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(color: k.muted, letterSpacing: 1.4)),
          const SizedBox(height: 12),
          for (var i = 0; i < history.length; i++) ...[
            _HistoryRow(assessment: history[i]),
            if (i < history.length - 1)
              Divider(height: 20, color: k.line),
          ],
        ],
      ),
    );
  }
}

class _HistoryRow extends StatelessWidget {
  const _HistoryRow({required this.assessment});
  final VoiceAssessment assessment;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final date = assessment.createdAt == null
        ? '—'
        : DateFormat('MMM d').format(assessment.createdAt!);
    final score = assessment.scores.overall;
    final scoreColor = k.scoreColor(score);
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: scoreColor.withValues(alpha: 0.14),
            shape: BoxShape.circle,
          ),
          child: Text(
            '$score',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: scoreColor,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                assessment.isBaseline ? 'Baseline assessment' : 'Voice check',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w600, color: k.ink900),
              ),
              Text(date,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: k.muted)),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _MiniBar(label: 'C', value: assessment.scores.clarity, color: k.ember),
            const SizedBox(width: 6),
            _MiniBar(label: 'P', value: assessment.scores.pace, color: k.ember),
          ],
        ),
      ],
    );
  }
}

class _MiniBar extends StatelessWidget {
  const _MiniBar(
      {required this.label, required this.value, required this.color});
  final String label;
  final int value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return Column(
      children: [
        Text(label,
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: k.muted, fontSize: 9)),
        const SizedBox(height: 2),
        SizedBox(
          width: 28,
          height: 4,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(99),
            child: LinearProgressIndicator(
              value: (value / 100).clamp(0, 1),
              backgroundColor: k.line,
              valueColor: AlwaysStoppedAnimation(color),
            ),
          ),
        ),
        const SizedBox(height: 2),
        Text('$value',
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(fontSize: 9, color: k.ink700)),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Strengths / weaknesses tags
// ─────────────────────────────────────────────────────────────────────────────

class _TagsCard extends StatelessWidget {
  const _TagsCard({required this.insights});
  final LearnerInsights insights;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (insights.strengthsTags.isNotEmpty) ...[
            Text('STRENGTHS',
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: k.muted, letterSpacing: 1.2)),
            const SizedBox(height: 8),
            for (var i = 0; i < insights.strengthsTags.length; i++) ...[
              _InsightTag(
                label: _fmt(insights.strengthsTags[i]),
                tone: PillTone.success,
                icon: LucideIcons.check,
              ),
              if (i < insights.strengthsTags.length - 1)
                const SizedBox(height: 6),
            ],
          ],
          if (insights.strengthsTags.isNotEmpty &&
              insights.weaknessesTags.isNotEmpty)
            const SizedBox(height: 14),
          if (insights.weaknessesTags.isNotEmpty) ...[
            Text('FOCUS AREAS',
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: k.muted, letterSpacing: 1.2)),
            const SizedBox(height: 8),
            for (var i = 0; i < insights.weaknessesTags.length; i++) ...[
              _InsightTag(
                label: _fmt(insights.weaknessesTags[i]),
                tone: PillTone.accent,
                icon: LucideIcons.target,
              ),
              if (i < insights.weaknessesTags.length - 1)
                const SizedBox(height: 6),
            ],
          ],
        ],
      ),
    );
  }

  String _fmt(String tag) =>
      tag.replaceAll('_', ' ').split(' ').map((w) {
        if (w.isEmpty) return w;
        return '${w[0].toUpperCase()}${w.substring(1)}';
      }).join(' ');
}

/// Full-width insight chip — wraps long coaching tag text instead of overflowing.
class _InsightTag extends StatelessWidget {
  const _InsightTag({
    required this.label,
    required this.tone,
    required this.icon,
  });

  final String label;
  final PillTone tone;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final (bg, fg, border) = switch (tone) {
      PillTone.success => (
          k.success.withValues(alpha: 0.16),
          k.success,
          k.success.withValues(alpha: 0.22),
        ),
      PillTone.accent => (
          k.accentDeep.withValues(alpha: 0.12),
          k.accentDeep,
          k.accentDeep.withValues(alpha: 0.18),
        ),
      _ => (k.glassFillStrong, k.ink900, k.glassBorder),
    };

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 1),
            child: Icon(icon, size: 14, color: fg),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              softWrap: true,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: fg,
                    fontWeight: FontWeight.w600,
                    height: 1.35,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Empty / CTA states
// ─────────────────────────────────────────────────────────────────────────────

class _NoAssessmentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return GlassCard(
      strong: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 46,
            height: 46,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: k.ember.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(LucideIcons.mic, size: 24, color: k.accentDeep),
          ),
          const SizedBox(height: 14),
          Text('Record your first assessment',
              style: korasSerif(20, color: k.ink900)),
          const SizedBox(height: 8),
          Text(
            'Get your overall score, clarity, pace, pitch, resonance and confidence rated by AI — plus personalised coaching.',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: k.ink700, height: 1.55),
          ),
          const SizedBox(height: 18),
          KorasButton.primary(
            onPressed: () =>
                context.push('/app/assess?baseline=1'),
            child: const Text('Start assessment'),
          ),
        ],
      ),
    );
  }
}

class _RecordCta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return GlassCard(
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: k.ember.withValues(alpha: 0.14),
              shape: BoxShape.circle,
            ),
            child: Icon(LucideIcons.mic, size: 20, color: k.accentDeep),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Record a new check',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(
                            fontWeight: FontWeight.w600, color: k.ink900)),
                Text('Track your growth over time.',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: k.muted)),
              ],
            ),
          ),
          KorasButton.primary(
            onPressed: () => context.push('/app/assess'),
            child: const Text('Start'),
          ),
        ],
      ),
    );
  }
}
