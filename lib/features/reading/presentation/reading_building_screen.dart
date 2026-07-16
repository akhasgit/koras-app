import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/errors/app_error.dart';
import '../../../core/theme/koras_theme.dart';
import '../../../core/theme/typography.dart';
import '../../../shared/widgets/glass/glass_card.dart';
import '../../../shared/widgets/koras_button.dart';
import '../../../shared/widgets/koras_pill.dart';
import '../data/reading_models.dart';
import '../data/reading_repository.dart';

/// "Building your programme…" — LAnalyzing progress-pill pattern from the
/// handoff. Polls `GET /program` on the house cadence (3 s × 40) until the
/// programme leaves `generating` (§4.4).
class ReadingBuildingScreen extends HookConsumerWidget {
  const ReadingBuildingScreen({super.key, required this.onReady});

  /// Called once the programme is `active` (or `completed`). A programme that
  /// is `active` with a `generation_error` is the §3.3 starter fallback — the
  /// path screen shows the "starter programme" note.
  final void Function(ReadingProgram program) onReady;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final k = context.koras;
    final error = useState<String?>(null);
    final elapsed = useState(0);
    final retryToken = useState(0);

    useEffect(() {
      final ticker = Timer.periodic(
        const Duration(seconds: 1),
        (_) => elapsed.value += 1,
      );
      var cancelled = false;
      Future<void>(() async {
        try {
          final program =
              await ref.read(readingRepositoryProvider).pollProgram();
          if (!cancelled) onReady(program);
        } catch (e) {
          if (!cancelled) error.value = errorToMessage(e);
        }
      });
      return () {
        cancelled = true;
        ticker.cancel();
      };
    }, [retryToken.value]);

    if (error.value != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: Column(
          children: [
            Icon(LucideIcons.circleAlert, color: k.danger, size: 40),
            const SizedBox(height: 12),
            Text(
              'Your programme is taking longer than expected.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            KorasButton.primary(
              onPressed: () {
                error.value = null;
                elapsed.value = 0;
                retryToken.value += 1;
              },
              child: const Text('Check again'),
            ),
          ],
        ),
      );
    }

    // Cosmetic stage progression driven by elapsed time — the real signal is
    // the poll above.
    final phase = elapsed.value < 6 ? 0 : (elapsed.value < 18 ? 1 : 2);
    final barValue = (0.15 + elapsed.value * 0.02).clamp(0.15, 0.9);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 60, 16, 40),
      child: Column(
        children: [
          GlassCard(
            radius: 34,
            padding: EdgeInsets.zero,
            child: SizedBox(
              width: 148,
              height: 148,
              child: Icon(LucideIcons.sparkles, size: 56, color: k.ember),
            ),
          ),
          const SizedBox(height: 28),
          Text(
            'Building your programme…',
            textAlign: TextAlign.center,
            style: korasSerifItalic(27, color: k.ink900),
          ),
          const SizedBox(height: 10),
          Text(
            'Shaping stages around your calibration read — pace, flow and the '
            'words that tripped you up. Usually under a minute.',
            textAlign: TextAlign.center,
            style:
                Theme.of(context).textTheme.bodyMedium?.copyWith(color: k.muted),
          ),
          const SizedBox(height: 26),
          SizedBox(
            width: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: LinearProgressIndicator(
                value: barValue.toDouble(),
                minHeight: 6,
                color: k.ember,
                backgroundColor: k.line,
              ),
            ),
          ),
          const SizedBox(height: 22),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: [
              const KorasPill(
                label: 'Calibration read',
                tone: PillTone.success,
                icon: LucideIcons.check,
              ),
              KorasPill(
                label: 'Choosing stages',
                tone: phase >= 1 ? PillTone.success : PillTone.accent,
                icon: phase >= 1 ? LucideIcons.check : LucideIcons.sparkles,
              ),
              KorasPill(
                label: 'Writing Stage 1',
                tone: phase >= 2 ? PillTone.accent : PillTone.glass,
                icon: phase >= 2 ? LucideIcons.sparkles : null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
