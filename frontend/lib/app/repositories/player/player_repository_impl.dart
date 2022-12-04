import 'package:jogadores_da_copa/app/core/database/sqlite_connection_factory.dart';
import 'package:jogadores_da_copa/app/core/exceptions/failure_exception.dart';
import 'package:jogadores_da_copa/app/core/logger/app_logger.dart';
import 'package:jogadores_da_copa/app/core/rest_client/rest_client_exception.dart';
import 'package:jogadores_da_copa/app/models/player_model.dart';
import 'package:jogadores_da_copa/app/repositories/player/player_repository.dart';

class PlayerRepositoryImpl implements PlayerRepository {
  final SqliteConnectionFactory _sqliteConnectionFactory;
  final AppLogger _log;

  PlayerRepositoryImpl({
    required SqliteConnectionFactory sqliteConnectionFactory,
    required AppLogger log,
  })  : _sqliteConnectionFactory = sqliteConnectionFactory,
        _log = log;

  @override
  Future<List<PlayerModel>> getPlayersFromDatabase() async {
    try {
      final conn = await _sqliteConnectionFactory.openConnetion();
      final result = await conn.rawQuery('SELECT * FROM player;');

      return result.map((player) => PlayerModel.loadFromDB(player)).toList();
    } on RestClientException catch (e, s) {
      _log.error('Erro ao buscar jogadores', e, s);
      throw FailureException(
        message: 'Erro ao buscar jogadores',
      );
    }
  }
}
