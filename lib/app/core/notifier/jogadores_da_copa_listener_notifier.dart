// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:jogadores_da_copa/app/core/notifier/jogadores_da_copa_change_notifier.dart';
import 'package:jogadores_da_copa/app/core/ui/widgets/loader.dart';

class JogadoresDaCopaListenerNotifier {
  final JogadoresDaCopaChangeNotifier changeNotifier;

  JogadoresDaCopaListenerNotifier({required this.changeNotifier});

  void listener({
    required BuildContext context,
    EverVoidCallback? everCallback,
    required SuccessVoidCallback successCallback,
    ErrorVoidCallback? errorCallback,
  }) {
    changeNotifier.addListener(() {
      if (everCallback != null) {
        everCallback(changeNotifier, this);
      }

      if (changeNotifier.loading) {
        Loader.show();
      } else {
        Loader.hide();
      }

      if (changeNotifier.hasError) {
        if (errorCallback != null) {
          errorCallback(changeNotifier, this);
        }
      } else if (changeNotifier.isSuccess) {
        successCallback(changeNotifier, this);
      }
    });
  }

  void dispose() {
    changeNotifier.removeListener(() {});
  }
}

typedef SuccessVoidCallback = void Function(
  JogadoresDaCopaChangeNotifier notifier,
  JogadoresDaCopaListenerNotifier listenerInstance,
);

typedef ErrorVoidCallback = void Function(
  JogadoresDaCopaChangeNotifier notifier,
  JogadoresDaCopaListenerNotifier listenerInstance,
);

typedef EverVoidCallback = void Function(
  JogadoresDaCopaChangeNotifier notifier,
  JogadoresDaCopaListenerNotifier listenerInstance,
);
