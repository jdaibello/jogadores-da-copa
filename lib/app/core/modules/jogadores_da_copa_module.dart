import 'package:flutter/widgets.dart';
import 'package:jogadores_da_copa/app/core/modules/jogadores_da_copa_page.dart';
import 'package:provider/single_child_widget.dart';

abstract class JogadoresDaCopaModule {
  final Map<String, WidgetBuilder> _routers;
  final List<SingleChildWidget>? _bindings;

  JogadoresDaCopaModule({
    List<SingleChildWidget>? bindings,
    required Map<String, WidgetBuilder> routers,
  })  : _routers = routers,
        _bindings = bindings;

  Map<String, WidgetBuilder> get routers {
    return _routers.map(
      (key, pageBuilder) => MapEntry(
        key,
        (_) => JogadoresDaCopaPage(
          page: pageBuilder,
          bindings: _bindings,
        ),
      ),
    );
  }

  Widget getPage(String path, BuildContext context) {
    final widgetBuilder = _routers[path];
    if (widgetBuilder != null) {
      return JogadoresDaCopaPage(
        page: widgetBuilder,
        bindings: _bindings,
      );
    }
    throw Exception();
  }
}
