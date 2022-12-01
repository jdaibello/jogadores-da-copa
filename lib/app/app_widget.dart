import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jogadores_da_copa/app/core/database/sqlite_adm_connection.dart';
import 'package:jogadores_da_copa/app/core/navigator/jogadores_da_copa_navigator.dart';
import 'package:jogadores_da_copa/app/core/ui/ui_config.dart';
import 'package:jogadores_da_copa/app/modules/home/home_module.dart';
import 'package:jogadores_da_copa/app/modules/splash/splash_page.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final sqliteAdmConnection = SqliteAdmConnection();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(sqliteAdmConnection);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(sqliteAdmConnection);
    super.dispose();
  }

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
        routes: {
          ...HomeModule().routers,
        },
        home: const SplashPage(
            // splashController: context.read(),
            ),
      ),
    );
  }
}
