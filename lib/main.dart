import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app.dart';
import 'core/env/env.dart';
import 'services/audio_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Env.assertReady();

  // PKCE is the correct OAuth flow for mobile deep-link callbacks (see 05).
  await Supabase.initialize(
    url: Env.supabaseUrl,
    // The SUPABASE_ANON_KEY env value is the publishable key; `anonKey` remains
    // the supported initialize parameter for it.
    // ignore: deprecated_member_use
    anonKey: Env.supabaseAnonKey,
    authOptions: const FlutterAuthClientOptions(
      authFlowType: AuthFlowType.pkce,
    ),
  );

  // Lock-screen / background controls for R2 playback + tutor audio (12, 13).
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.koras.app.audio',
    androidNotificationChannelName: 'Koras playback',
    androidNotificationOngoing: true,
  );

  // playAndRecord category so capture + playback share one session (12).
  await configureAudioSession();

  runApp(const ProviderScope(child: KorasApp()));
}
