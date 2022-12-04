import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:jogadores_da_copa_api/api/config/external_api_connection_config.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'api_football_controller.g.dart';

@Injectable()
class ApiFootballController {
  @Route.get('/')
  Future<Response> getApiFootballUrl(Request request) async {
    ExternalApiConnectionConfig externalApiConfig =
        GetIt.I.get<ExternalApiConnectionConfig>();

    return Response.ok(jsonEncode('"url": ${externalApiConfig.baseUrl}'));
  }

  Router get router => _$ApiFootballControllerRouter(this);
}
