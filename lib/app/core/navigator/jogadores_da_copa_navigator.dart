import 'package:flutter/widgets.dart';

class JogadoresDaCopaNavigator {
  JogadoresDaCopaNavigator._();

  static final navigatorKey = GlobalKey<NavigatorState>();
  static NavigatorState get to => navigatorKey.currentState!;
}
