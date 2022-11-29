import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jogadores_da_copa/app/core/navigator/jogadores_da_copa_navigator.dart';
import 'package:jogadores_da_copa/app/core/ui/ui_config.dart';
import 'package:jogadores_da_copa/app/modules/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (_, __) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: UIConfig.title,
        theme: UIConfig.theme,
        navigatorKey: JogadoresDaCopaNavigator.navigatorKey,
        navigatorObservers: [Asuka.asukaHeroController],
        builder: Asuka.builder,
        home: const SplashPage(),
      ),
    );
  }
}
