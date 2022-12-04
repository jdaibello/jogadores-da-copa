import 'package:flutter/material.dart';

class UIConfig {
  UIConfig._();

  static String get title => 'Jogadores da Copa';

  static ThemeData get theme => ThemeData(
        primaryColor: const Color.fromRGBO(155, 11, 55, 1),
        primaryColorDark: const Color.fromRGBO(81, 2, 24, 1),
        primaryColorLight: const Color.fromRGBO(227, 223, 220, 1),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(155, 11, 55, 1),
        ),
      );
}
