import 'package:flutter/material.dart';
import 'package:jogadores_da_copa/app/core/helpers/environments.dart';

class ApplicationConfig {
  Future<void> configureApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _loadEnv();
  }

  Future<void> _loadEnv() => Environments.loadEnv();
}
