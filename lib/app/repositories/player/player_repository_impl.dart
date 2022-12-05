import 'package:jogadores_da_copa/app/core/exceptions/failure_exception.dart';
import 'package:jogadores_da_copa/app/core/helpers/constants.dart';
import 'package:jogadores_da_copa/app/core/local_storage/local_storage.dart';
import 'package:jogadores_da_copa/app/core/logger/app_logger.dart';
import 'package:jogadores_da_copa/app/core/rest_client/rest_client_exception.dart';
import 'package:jogadores_da_copa/app/models/response_model.dart';
import 'package:jogadores_da_copa/app/repositories/player/player_repository.dart';

class PlayerRepositoryImpl implements PlayerRepository {
  final LocalStorage _localStorage;
  final AppLogger _log;

  PlayerRepositoryImpl({
    required LocalStorage localStorage,
    required AppLogger log,
  })  : _localStorage = localStorage,
        _log = log;

  @override
  Future<List<ResponseModel>> getPlayersDataFromLocalStorage() async {
    try {
      var jsonData = await _localStorage.read<List<String>>(
        Constants.API_FOOTBALL_RESPONSE_JSON_WITHOUT_PAGINATION,
      );
      jsonData ??= [];

      return jsonData.map((e) => ResponseModel.fromJson(e)).toList();
    } on RestClientException catch (e, s) {
      _log.error('Erro ao buscar jogadores', e, s);
      throw FailureException(
        message: 'Erro ao buscar jogadores',
      );
    }
  }
}
