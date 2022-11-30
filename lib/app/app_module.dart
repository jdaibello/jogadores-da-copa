import 'package:flutter/material.dart';
import 'package:jogadores_da_copa/app/app_widget.dart';
import 'package:jogadores_da_copa/app/core/local_storage/flutter_secure_storage_local_secure_storage_impl.dart';
import 'package:jogadores_da_copa/app/core/local_storage/local_secure_storage.dart';
import 'package:jogadores_da_copa/app/core/local_storage/local_storage.dart';
import 'package:jogadores_da_copa/app/core/local_storage/shared_preferences_local_storage_impl.dart';
import 'package:jogadores_da_copa/app/core/logger/app_logger.dart';
import 'package:jogadores_da_copa/app/core/logger/logger_app_logger_impl.dart';
import 'package:jogadores_da_copa/app/core/rest_client/dio/dio_rest_client.dart';
import 'package:jogadores_da_copa/app/core/rest_client/rest_client.dart';
import 'package:jogadores_da_copa/app/repositories/player/player_repository.dart';
import 'package:jogadores_da_copa/app/repositories/player/player_repository_impl.dart';
import 'package:jogadores_da_copa/app/services/player/player_service.dart';
import 'package:jogadores_da_copa/app/services/player/player_service_impl.dart';
import 'package:provider/provider.dart';

class AppModule extends StatelessWidget {
  const AppModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
<<<<<<< HEAD
        Provider(
          create: (_) => LoggerAppLoggerImpl(),
        ),
        Provider(
          create: (_) => SharedPreferencesLocalStorageImpl(),
        ),
        Provider(
          create: (_) => FlutterSecureStorageLocalSecureStorageImpl(),
        ),
=======
        Provider<AppLogger>(
          create: (_) => LoggerAppLoggerImpl(),
        ),
        Provider<LocalStorage>(
          create: (_) => SharedPreferencesLocalStorageImpl(),
        ),
        Provider<LocalSecureStorage>(
          create: (_) => FlutterSecureStorageLocalSecureStorageImpl(),
        ),
        Provider<RestClient>(
          create: (context) => DioRestClient(
            localStorage: context.read(),
            localSecureStorage: context.read(),
            log: context.read(),
          ),
        ),
        Provider<PlayerRepository>(
          create: (_) => PlayerRepositoryImpl(
            restClient: context.read(),
            log: context.read(),
          ),
        ),
        Provider<PlayerService>(
          create: (_) => PlayerServiceImpl(
            playerRepository: context.read(),
          ),
        ),
>>>>>>> 3cab58d7df3775394451546703d19b3be81c1927
      ],
      child: const AppWidget(),
    );
  }
}
