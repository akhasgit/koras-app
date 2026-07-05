import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/models/enums.dart';
import '../../../shared/widgets/koras_screen.dart';
import '../../programs/domain/program_catalog.dart';
import '../../programs/presentation/program_access_providers.dart';
import '../../programs/presentation/widgets/program_card.dart';

/// Practice catalogue — all programs, marked open vs locked.
class PracticeScreen extends ConsumerWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accessible = ref.watch(accessibleProgramIdsProvider).valueOrNull;
    final livePrograms =
        kPrograms.where((p) => p.status == ProgramStatus.live);
    final incomingPrograms =
        kPrograms.where((p) => p.status == ProgramStatus.incoming);

    return KorasScreen(
      title: 'Practice',
      children: [
        const SizedBox(height: 8),
        for (final program in [...livePrograms, ...incomingPrograms]) ...[
          ProgramCard(
            program: program,
            locked: accessible != null && !accessible.contains(program.id),
          ),
          const SizedBox(height: 10),
        ],
      ],
    );
  }
}
