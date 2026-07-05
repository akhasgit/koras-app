import 'package:audio_session/audio_session.dart';

/// Configure the shared audio session once at app start (called from main.dart
/// after Supabase.initialize). `playAndRecord` + `defaultToSpeaker` so capture
/// playback doesn't dump to the earpiece; Bluetooth allowed. See 12.
Future<void> configureAudioSession() async {
  final session = await AudioSession.instance;
  await session.configure(AudioSessionConfiguration(
    avAudioSessionCategory: AVAudioSessionCategory.playAndRecord,
    avAudioSessionCategoryOptions:
        AVAudioSessionCategoryOptions.defaultToSpeaker |
            AVAudioSessionCategoryOptions.allowBluetooth,
    avAudioSessionMode: AVAudioSessionMode.spokenAudio,
    androidAudioAttributes: const AndroidAudioAttributes(
      contentType: AndroidAudioContentType.speech,
      usage: AndroidAudioUsage.voiceCommunication,
    ),
    androidAudioFocusGainType: AndroidAudioFocusGainType.gain,
  ));
}
