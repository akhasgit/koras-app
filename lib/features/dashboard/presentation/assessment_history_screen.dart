import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/errors/app_error.dart';
import '../../../core/theme/koras_theme.dart';
import '../../../shared/providers/current_profile.dart';
import '../../../shared/widgets/avatar_menu_button.dart';
import '../../../shared/widgets/glass/glass_card.dart';
import '../../../shared/widgets/koras_error.dart';
import '../../../shared/widgets/koras_header.dart';
import '../../../shared/widgets/koras_loading.dart';
import '../../../shared/widgets/koras_pill.dart';
import '../../../shared/widgets/koras_score_pill.dart';
import '../../../shared/widgets/koras_sparkline.dart';
import '../data/assessments_repository.dart';
import '../data/voice_assessment.dart';

/// Reads — assessment history restyled per `LHistory` in
/// `handoffs/koras-mobile-handoff/koras-learner.jsx`.
class AssessmentHistoryScreen extends ConsumerWidget {
  const AssessmentHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final history = ref.watch(assessmentHistoryProvider);
    final profile = ref.watch(currentProfileProvider).valueOrNull;
    final statusBarH = MediaQuery.paddingOf(context).top;

    return history.when(
      loading: () => const KorasLoading(),
      error: (e, _) => KorasError(
        message: errorToMessage(e),
        onRetry: () => ref.invalidate(assessmentHistoryProvider),
      ),
      data: (items) {
        final thisMonth = items
            .where((a) =>
                a.createdAt != null &&
                DateTime.now().difference(a.createdAt!).inDays < 30)
            .length;
        return RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(assessmentHistoryProvider);
            await ref.read(assessmentHistoryProvider.future);
          },
          child: ListView(
            padding: EdgeInsets.only(top: statusBarH + 8, bottom: 110),
            children: [
              KorasHeader(
                kicker: items.isEmpty
                    ? 'Reads'
                    : '${items.length} reads · +$thisMonth this month',
                title: 'Your reads',
                trailing: profile != null
                    ? AvatarMenuButton(profile: profile)
                    : null,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: items.isEmpty
                    ? const _EmptyReads()
                    : Column(
                        children: [
                          if (items.length >= 2) ...[
                            _TrendCard(items: items),
                            const SizedBox(height: 12),
                          ],
                          for (final a in items) ...[
                            _ReadCard(assessment: a),
                            const SizedBox(height: 12),
                          ],
                        ],
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _TrendCard extends StatelessWidget {
  const _TrendCard({required this.items});
  final List<VoiceAssessment> items; // newest first

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    // Chronological overall scores for the sparkline.
    final points =
        items.reversed.map((a) => a.scores.overall).toList(growable: false);
    final delta = points.last - points.first;
    final deltaLabel = delta >= 0 ? '+$delta overall' : '$delta overall';

    return GlassCard(
      radius: 24,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'OVERALL TREND',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontSize: 11,
                      color: k.muted,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              KorasPill(
                label: deltaLabel,
                tone: delta >= 0 ? PillTone.success : PillTone.warn,
                icon: delta >= 0
                    ? LucideIcons.trendingUp
                    : LucideIcons.trendingDown,
              ),
            ],
          ),
          const SizedBox(height: 10),
          KorasSparkline(points: points, height: 48),
        ],
      ),
    );
  }
}

class _ReadCard extends StatelessWidget {
  const _ReadCard({required this.assessment});
  final VoiceAssessment assessment;

  String _dateLabel(DateTime dt) {
    final local = dt.toLocal();
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final day = DateTime(local.year, local.month, local.day);
    if (day == today) {
      return 'Today · ${DateFormat.jm().format(local)}';
    }
    if (day == today.subtract(const Duration(days: 1))) {
      return 'Yesterday';
    }
    return DateFormat('EEE · MMM d').format(local);
  }

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    final a = assessment;
    final snippet = (a.transcript ?? '').trim();

    return GlassCard(
      radius: 22,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                a.isBaseline ? 'BASELINE' : 'VOICE READ',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontSize: 11,
                      color: a.isBaseline ? k.accentDeep : k.muted,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              if (a.createdAt != null)
                Text(
                  _dateLabel(a.createdAt!),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: k.muted),
                ),
            ],
          ),
          if (snippet.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              snippet,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w600,
                    height: 1.35,
                    color: k.ink900,
                  ),
            ),
          ],
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              KorasScorePill(
                  label: 'Overall', value: a.scores.overall, primary: true),
              KorasScorePill(label: 'Pitch', value: a.scores.pitch),
              KorasScorePill(label: 'Pace', value: a.scores.pace),
            ],
          ),
        ],
      ),
    );
  }
}

class _EmptyReads extends StatelessWidget {
  const _EmptyReads();

  @override
  Widget build(BuildContext context) {
    final k = context.koras;
    return GlassCard(
      child: Column(
        children: [
          Icon(LucideIcons.mic, size: 32, color: k.muted),
          const SizedBox(height: 12),
          Text(
            'No reads yet',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: k.ink900),
          ),
          const SizedBox(height: 6),
          Text(
            'Record your first voice assessment and it will appear here.',
            textAlign: TextAlign.center,
            style:
                Theme.of(context).textTheme.bodyMedium?.copyWith(color: k.muted),
          ),
        ],
      ),
    );
  }
}
