import 'package:jogadores_da_copa_api/api/routers/api_router.dart';
import 'package:jogadores_da_copa_api/modules/api_football/api_football_router.dart';
import 'package:shelf_router/shelf_router.dart';

class RouterConfig {
  final Router _router;
  final List<ApiRouter> _routers = [
    ApiFootballRouter(),
  ];

  RouterConfig(this._router);

  void configure() => _routers.forEach((r) => r.configure(_router));
}
