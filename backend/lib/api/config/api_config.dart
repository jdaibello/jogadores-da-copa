import 'package:dotenv/dotenv.dart' show load, env;
import 'package:get_it/get_it.dart';
import 'package:jogadores_da_copa_api/api/config/external_api_connection_config.dart';
import 'package:jogadores_da_copa_api/api/config/service_locator_config.dart';
import 'package:jogadores_da_copa_api/api/logger/api_logger.dart';
import 'package:jogadores_da_copa_api/api/logger/logger_impl.dart';
import 'package:jogadores_da_copa_api/api/routers/router_config.dart';
import 'package:shelf_router/shelf_router.dart';

class ApiConfig {
  Future<void> loadAppConfig(Router router) async {
    await _loadEnv();
    _loadExternalApiConfig();
    _configureLogger();
    _loadDependencies();
    _loadRoutersConfiguration(router);
  }

  Future<void> _loadEnv() async => load();

  void _loadExternalApiConfig() {
    final externalApiConfig = ExternalApiConnectionConfig(
      baseUrl: env['EXTERNAL_API_BASE_URL']!,
      apiKey: env['APISPORTS_KEY']!,
    );

    GetIt.I.registerSingleton(externalApiConfig);
  }

  void _configureLogger() =>
      GetIt.I.registerLazySingleton<ApiLogger>(() => LoggerImpl());

  void _loadDependencies() => configureDependencies();

  void _loadRoutersConfiguration(Router router) =>
      RouterConfig(router).configure();
}
