import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/errors/app_error.dart';
import '../../../core/theme/koras_theme.dart';
import '../../../shared/widgets/koras_button.dart';
import '../../../shared/widgets/koras_card.dart';
import '../../../shared/widgets/koras_screen.dart';
import '../data/voice_refinement_models.dart';
import '../data/voice_refinement_repository.dart';

/// Lets the user pick target adjustments then submits them to the server,
/// which generates a 14-day plan (server-side, no client DSP).
class VoiceRefinementExploreScreen extends HookConsumerWidget {
  const VoiceRefinementExploreScreen({super.key, required this.baselineId});
  final String baselineId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pitch = useState(0.0);
    final speed = useState(1.0);
    final resonance = useState(0.0);
    final brightness = useState(0.0);
    final busy = useState(false);
    final error = useState<String?>(null);

    Future<void> submit() async {
      busy.value = true;
      error.value = null;
      try {
        await ref.read(voiceRefinementRepositoryProvider).submitTarget(
              baselineId: baselineId,
              target: VoiceRefinementTargetIntent(
                pitchSemitones: pitch.value,
                speedRatio: speed.value,
                resonance: resonance.value,
                brightness: brightness.value,
              ),
            );
        ref.invalidate(voiceRefinementPlanProvider);
        if (context.mounted) context.go('/app/voice-refinement');
      } catch (e) {
        error.value = errorToMessage(e);
      } finally {
        busy.value = false;
      }
    }

    final k = context.koras;
    return KorasScreen(
      title: 'Explore target voice',
      children: [
        const SizedBox(height: 12),
        KorasCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Target adjustments',
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              const Text(
                  'These are your goals for the plan. The plan itself is generated on the server and applied through drills — no audio is transformed on-device.'),
              const SizedBox(height: 16),
              _SliderRow(
                label: 'Pitch (semitones)',
                value: pitch.value,
                min: -6,
                max: 6,
                divisions: 12,
                onChanged: (v) => pitch.value = v,
                display: (v) =>
                    v == 0 ? '0' : '${v > 0 ? "+" : ""}${v.toStringAsFixed(1)}',
              ),
              _SliderRow(
                label: 'Pace (× speed)',
                value: speed.value,
                min: 0.85,
                max: 1.15,
                divisions: 30,
                onChanged: (v) => speed.value = v,
                display: (v) => '${v.toStringAsFixed(2)}×',
              ),
              _SliderRow(
                label: 'Resonance',
                value: resonance.value,
                min: -1,
                max: 1,
                divisions: 20,
                onChanged: (v) => resonance.value = v,
                display: (v) =>
                    v == 0 ? '0' : '${v > 0 ? "+" : ""}${v.toStringAsFixed(2)}',
              ),
              _SliderRow(
                label: 'Brightness',
                value: brightness.value,
                min: -1,
                max: 1,
                divisions: 20,
                onChanged: (v) => brightness.value = v,
                display: (v) =>
                    v == 0 ? '0' : '${v > 0 ? "+" : ""}${v.toStringAsFixed(2)}',
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.centerLeft,
          child: KorasButton.primary(
            onPressed: busy.value ? null : submit,
            child:
                Text(busy.value ? 'Building plan…' : 'Build 14-day plan'),
          ),
        ),
        if (error.value != null) ...[
          const SizedBox(height: 12),
          Text(error.value!, style: TextStyle(color: k.danger)),
        ],
        const SizedBox(height: 32),
      ],
    );
  }
}

class _SliderRow extends StatelessWidget {
  const _SliderRow({
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.divisions,
    required this.onChanged,
    required this.display,
  });

  final String label;
  final double value;
  final double min;
  final double max;
  final int divisions;
  final ValueChanged<double> onChanged;
  final String Function(double) display;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text(label)),
              Text(display(value),
                  style: const TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
          Slider(
            value: value,
            min: min,
            max: max,
            divisions: divisions,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
