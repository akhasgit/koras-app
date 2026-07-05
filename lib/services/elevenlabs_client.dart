import 'package:flutter_riverpod/flutter_riverpod.dart' show Ref;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'elevenlabs_client.g.dart';

/// ElevenLabs ConvAI live socket. The signed URL is minted server-side by the
/// `ai-tutor-signed-url` edge function (so `ELEVENLABS_API_KEY` never ships).
class ElevenLabsClient {
  const ElevenLabsClient();

  WebSocketChannel connect(String signedUrl) =>
      WebSocketChannel.connect(Uri.parse(signedUrl));
}

@riverpod
ElevenLabsClient elevenLabsClient(Ref ref) => const ElevenLabsClient();
