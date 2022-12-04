import 'package:dotenv/dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:jogadores_da_copa_api/app/logger/logger.dart';
import 'package:jogadores_da_copa_api/app/logger/logger_impl.dart';

class AppConfig {
  Future<void> loadAppConfig() async {
    await _loadEnv();
    _configureLogger();
  }

  Future<void> _loadEnv() async => DotEnv()..load();

  void _configureLogger() =>
      GetIt.I.registerLazySingleton<Logger>(() => LoggerImpl());
}
