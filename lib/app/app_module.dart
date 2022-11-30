import 'package:flutter/material.dart';
import 'package:jogadores_da_copa/app/app_widget.dart';
import 'package:jogadores_da_copa/app/core/local_storage/flutter_secure_storage_local_secure_storage_impl.dart';
import 'package:jogadores_da_copa/app/core/local_storage/shared_preferences_local_storage_impl.dart';
import 'package:jogadores_da_copa/app/core/logger/logger_app_logger_impl.dart';
import 'package:provider/provider.dart';

class AppModule extends StatelessWidget {
  const AppModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => LoggerAppLoggerImpl(),
        ),
        Provider(
          create: (_) => SharedPreferencesLocalStorageImpl(),
        ),
        Provider(
          create: (_) => FlutterSecureStorageLocalSecureStorageImpl(),
        ),
      ],
      child: const AppWidget(),
    );
  }
}
