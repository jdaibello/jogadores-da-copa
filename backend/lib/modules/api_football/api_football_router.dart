import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:jogadores_da_copa_api/api/routers/api_router.dart';
import 'package:jogadores_da_copa_api/modules/api_football/controller/api_football_controller.dart';
import 'package:shelf_router/shelf_router.dart';

class ApiFootballRouter implements ApiRouter {
  @Injectable()
  final apiFootballController = GetIt.I.get<ApiFootballController>();

  @override
  void configure(Router router) {
    router.mount('/api-football/', apiFootballController.router);
  }
}
