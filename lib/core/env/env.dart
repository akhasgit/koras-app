/// Compile-time environment accessors.
///
/// Values are injected at build time via `--dart-define-from-file=env/<env>.json`
/// and read through `String.fromEnvironment`. There is no runtime `.env`;
/// rebuild to change a value. See `all_docs/mobile/03-environment-setup.md`.
class Env {
  const Env._();

  static const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  static const supabaseAnonKey = String.fromEnvironment('SUPABASE_ANON_KEY');
  static const korasApiUrl = String.fromEnvironment('KORAS_API_URL');
  static const deepLinkScheme =
      String.fromEnvironment('DEEP_LINK_SCHEME', defaultValue: 'koras');
  static const webSiteUrl = String.fromEnvironment('WEB_SITE_URL');
  static const env = String.fromEnvironment('ENV', defaultValue: 'dev');

  static bool get isProd => env == 'prod';

  /// OAuth + invite deep-link callbacks.
  static String get authCallbackUrl => '$deepLinkScheme://auth/callback';
  static String get inviteCallbackUrl => '$deepLinkScheme://invite';

  /// Fail fast at startup if the required defines are missing.
  static void assertReady() {
    if (supabaseUrl.isEmpty || supabaseAnonKey.isEmpty) {
      throw StateError(
        'Missing Supabase env. Run with --dart-define-from-file=env/dev.json',
      );
    }
    if (korasApiUrl.isEmpty) {
      throw StateError(
        'Missing KORAS_API_URL. Run with --dart-define-from-file=env/dev.json',
      );
    }
  }
}
