import 'package:flutter/material.dart';
import 'package:jogadores_da_copa/app/app_module.dart';
import 'package:jogadores_da_copa/app/core/application_config.dart';

Future<void> main() async {
  await ApplicationConfig().configureApp();
  runApp(const AppModule());
}
