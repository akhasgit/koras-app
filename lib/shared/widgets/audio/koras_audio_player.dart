import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/errors/app_error.dart';
import '../../../core/theme/koras_theme.dart';
import '../../../services/r2_client.dart';

part 'koras_audio_player.g.dart';

/// Get a playback URL from koras-api. A 410 → [GoneError] → "expired".
@riverpod
Future<String> playbackUrl(Ref ref, String audioKey) =>
    ref.watch(r2ClientProvider).playbackUrl(audioKey);

/// Plays an R2 recording fed by a presigned GET. See 12.
class KorasAudioPlayer extends ConsumerWidget {
  const KorasAudioPlayer({super.key, required this.audioKey});

  final String audioKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final urlAsync = ref.watch(playbackUrlProvider(audioKey));
    return urlAsync.when(
      data: (url) => _Controls(url: url),
      loading: () => const SizedBox(
        height: 56,
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) => Text(
        e is GoneError || e is NotFoundError
            ? 'Recording expired'
            : "Couldn't load this recording.",
        style: TextStyle(color: context.koras.ink500),
      ),
    );
  }
}

class _Controls extends HookConsumerWidget {
  const _Controls({required this.url});

  final String url;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = useMemoized(() => AudioPlayer()..setUrl(url), [url]);
    useEffect(() => player.dispose, [player]);

    final playing = useStream(player.playingStream).data ?? false;
    final k = context.koras;

    return Row(
      children: [
        IconButton.filled(
          onPressed: () => playing ? player.pause() : player.play(),
          icon: Icon(playing ? LucideIcons.pause : LucideIcons.play),
          style: IconButton.styleFrom(
            backgroundColor: k.ember,
            foregroundColor: k.paper,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: StreamBuilder<Duration>(
            stream: player.positionStream,
            builder: (context, snap) {
              final pos = snap.data ?? Duration.zero;
              final total = player.duration ?? Duration.zero;
              final value = total.inMilliseconds == 0
                  ? 0.0
                  : (pos.inMilliseconds / total.inMilliseconds).clamp(0.0, 1.0);
              return LinearProgressIndicator(
                value: value,
                color: k.ember,
                backgroundColor: k.line,
              );
            },
          ),
        ),
      ],
    );
  }
}
