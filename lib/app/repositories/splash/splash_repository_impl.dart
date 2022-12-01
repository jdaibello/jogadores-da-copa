import 'package:flutter/material.dart';
import 'package:jogadores_da_copa/app/core/database/sqlite_connection_factory.dart';
import 'package:jogadores_da_copa/app/core/exceptions/failure_exception.dart';
import 'package:jogadores_da_copa/app/core/logger/app_logger.dart';
import 'package:jogadores_da_copa/app/core/rest_client/rest_client.dart';
import 'package:jogadores_da_copa/app/core/rest_client/rest_client_exception.dart';
import 'package:jogadores_da_copa/app/models/paging_model.dart';
import 'package:jogadores_da_copa/app/models/player_model.dart';
import 'package:jogadores_da_copa/app/repositories/splash/splash_repository.dart';
import 'package:sqflite/sqflite.dart';

class SplashRepositoryImpl implements SplashRepository {
  final RestClient _restClient;
  final SqliteConnectionFactory _sqliteConnectionFactory;
  final AppLogger _log;

  List<PlayerModel> players = [];
  int auxPage = 1;

  SplashRepositoryImpl({
    required RestClient restClient,
    required SqliteConnectionFactory sqliteConnectionFactory,
    required AppLogger log,
  })  : _restClient = restClient,
        _sqliteConnectionFactory = sqliteConnectionFactory,
        _log = log;

  @override
  Future<List<PlayerModel>> fetchPlayersFromApi() async {
    try {
      final isPlayersPopulated = await _playersIsAlreadyPopulated();

      if (!isPlayersPopulated) {
        final result = await _restClient.get('/players', queryParameters: {
          'league': 1,
          'season': 2022,
          'page': auxPage,
        });

        PagingModel pagingModel = PagingModel.fromMap(
          await result.data['paging'],
        );

        if (pagingModel.current < pagingModel.total) {
          auxPage = pagingModel.current + 1;

          players.addAll(
            await result.data['response']?.map<PlayerModel>(
              (player) => PlayerModel.fromMap(player),
            ),
          );

          //* unfortunately, because of the API rate limit (10 requests/min),
          //* we need to wait some time beetween the first and the last request.
          await Future.delayed(const Duration(seconds: 5));

          players = await fetchPlayersFromApi();
        }

        return players;
      } else {
        return [];
      }
    } on RestClientException catch (e, s) {
      _log.error('Erro ao buscar jogadores', e, s);
      throw FailureException(
        message: 'Erro ao buscar jogadores',
      );
    }
  }

  @override
  Future<void> populatePlayers(List<PlayerModel> players) async {
    var listOfPlayersFetchedFromApi = <PlayerModel>[];

    listOfPlayersFetchedFromApi = await fetchPlayersFromApi();

    for (var player in listOfPlayersFetchedFromApi) {
      savePlayerToLocalDatabase(player);
    }

    debugPrint('$listOfPlayersFetchedFromApi');
  }

  @override
  Future<void> savePlayerToLocalDatabase(PlayerModel player) async {
    final isPlayersPopulated = await _playersIsAlreadyPopulated();

    if (!isPlayersPopulated) {
      final conn = await _sqliteConnectionFactory.openConnetion();
      await conn.insert('player', {
        'id': null,
        'name': player.name,
      });
    }
  }

  Future<bool> _playersIsAlreadyPopulated() async {
    final conn = await _sqliteConnectionFactory.openConnetion();
    final result = await conn.rawQuery('SELECT COUNT(*) FROM player;');

    if (Sqflite.firstIntValue(result)! > 0) {
      return true;
    } else {
      return false;
    }
  }
}
