import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environments {
  Environments._();

  static String? param(String paramName) {
    return dotenv.env[paramName];
  }

  static Future<void> loadEnv() async {
    await dotenv.load(fileName: '.env');
  }
}
