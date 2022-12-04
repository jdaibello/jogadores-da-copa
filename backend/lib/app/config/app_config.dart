import 'package:dotenv/dotenv.dart';

class AppConfig {
  Future<void> loadAppConfig() async {
    await _loadEnv();
  }

  Future<void> _loadEnv() async => DotEnv()..load();
}
