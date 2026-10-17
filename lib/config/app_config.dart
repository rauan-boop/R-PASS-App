class AppConfig {
  AppConfig._();

  // When true the app runs entirely on built-in mock data: no Supabase,
  // no registration, nothing is written anywhere.
  static const demoMode = bool.fromEnvironment('DEMO_MODE', defaultValue: true);

  static const _supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  static const _supabaseAnonKey = String.fromEnvironment('SUPABASE_ANON_KEY');

  static String get supabaseUrl =>
      demoMode && _supabaseUrl.isEmpty ? 'https://demo.invalid' : _supabaseUrl;
  static String get supabaseAnonKey =>
      demoMode && _supabaseAnonKey.isEmpty ? 'demo-anon-key' : _supabaseAnonKey;

  static const flutterFlowAssetsBaseUrl =
      String.fromEnvironment('FLUTTERFLOW_ASSETS_BASE_URL');
  static const telegramSupportUrl =
      String.fromEnvironment('TELEGRAM_SUPPORT_URL');
  static const whatsappBaseUrl = String.fromEnvironment('WHATSAPP_BASE_URL');
  static const ipAddressApiUrl = String.fromEnvironment('IP_ADDRESS_API_URL');

  static String get restUrl => '$supabaseUrl/rest/v1';
  static String get functionsUrl => '$supabaseUrl/functions/v1';
  static String get publicAssetsUrl =>
      '$supabaseUrl/storage/v1/object/public/public-assets';

  static void validate() {
    if (!demoMode && (_supabaseUrl.isEmpty || _supabaseAnonKey.isEmpty)) {
      throw StateError(
        'SUPABASE_URL and SUPABASE_ANON_KEY must be supplied with --dart-define.',
      );
    }
  }
}
