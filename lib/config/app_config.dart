class AppConfig {
  AppConfig._();

  static const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  static const supabaseAnonKey = String.fromEnvironment('SUPABASE_ANON_KEY');

  static const firebaseApiKey = String.fromEnvironment('FIREBASE_API_KEY');
  static const firebaseAuthDomain =
      String.fromEnvironment('FIREBASE_AUTH_DOMAIN');
  static const firebaseProjectId =
      String.fromEnvironment('FIREBASE_PROJECT_ID');
  static const firebaseStorageBucket =
      String.fromEnvironment('FIREBASE_STORAGE_BUCKET');
  static const firebaseMessagingSenderId =
      String.fromEnvironment('FIREBASE_MESSAGING_SENDER_ID');
  static const firebaseAppId = String.fromEnvironment('FIREBASE_APP_ID');
  static const flutterFlowAssetsBaseUrl =
      String.fromEnvironment('FLUTTERFLOW_ASSETS_BASE_URL');
  static const telegramSupportUrl =
      String.fromEnvironment('TELEGRAM_SUPPORT_URL');
  static const whatsappBaseUrl = String.fromEnvironment('WHATSAPP_BASE_URL');
  static const ipAddressApiUrl =
      String.fromEnvironment('IP_ADDRESS_API_URL');

  static String get restUrl => '$supabaseUrl/rest/v1';
  static String get functionsUrl => '$supabaseUrl/functions/v1';
  static String get publicAssetsUrl =>
      '$supabaseUrl/storage/v1/object/public/public-assets';

  static void validate() {
    if (supabaseUrl.isEmpty || supabaseAnonKey.isEmpty) {
      throw StateError(
        'SUPABASE_URL and SUPABASE_ANON_KEY must be supplied with --dart-define.',
      );
    }
  }
}
