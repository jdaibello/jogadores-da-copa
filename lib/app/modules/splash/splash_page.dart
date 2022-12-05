import 'package:flutter/material.dart';
import 'package:jogadores_da_copa/app/core/notifier/jogadores_da_copa_listener_notifier.dart';
import 'package:jogadores_da_copa/app/core/ui/extensions/theme_extension.dart';
import 'package:jogadores_da_copa/app/modules/splash/splash_controller.dart';

class SplashPage extends StatefulWidget {
  final SplashController _splashController;

  const SplashPage({
    required SplashController splashController,
    Key? key,
  })  : _splashController = splashController,
        super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    JogadoresDaCopaListenerNotifier(changeNotifier: widget._splashController)
        .listener(
      context: context,
      successCallback: (notifier, listenerInstance) {
        listenerInstance.dispose();
      },
    );

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget._splashController.populatePlayers().then(
            (_) => Navigator.of(context).popAndPushNamed('/home'),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: context.primaryColorLight,
        child: const Center(
          child: Text('Carregando...'),
        ),
      ),
    );
  }
}
