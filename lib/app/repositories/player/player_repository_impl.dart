import 'package:jogadores_da_copa/app/core/exceptions/failure_exception.dart';
import 'package:jogadores_da_copa/app/core/logger/app_logger.dart';
import 'package:jogadores_da_copa/app/core/rest_client/rest_client.dart';
import 'package:jogadores_da_copa/app/core/rest_client/rest_client_exception.dart';
import 'package:jogadores_da_copa/app/models/player_model.dart';
import 'package:jogadores_da_copa/app/repositories/player/player_repository.dart';

class PlayerRepositoryImpl implements PlayerRepository {
  final RestClient _restClient;
  final AppLogger _log;

  PlayerRepositoryImpl({
    required RestClient restClient,
    required AppLogger log,
  })  : _restClient = restClient,
        _log = log;

  @override
  Future<List<PlayerModel>> getPlayers() async {
    try {
      final result = await _restClient.get('/players', queryParameters: {
        'league': 1,
        'season': 2022,
      });

      return result.data['response']
          ?.map<PlayerModel>(
            (player) => PlayerModel.fromMap(player),
          )
          .toList();
    } on RestClientException catch (e, s) {
      _log.error('Erro ao buscar jogadores', e, s);
      throw FailureException(
        message: 'Erro ao buscar jogadores',
      );
    }
  }
}
