import 'package:flutter/material.dart';
import 'package:jogadores_da_copa/app/core/logger/logger_app_logger_impl.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoggerAppLoggerImpl log = LoggerAppLoggerImpl();
    log.info('Entrou na Splash Page');

    return const Scaffold(
      body: Center(
        child: Text('Splash Page'),
      ),
    );
  }
}
