// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:jogadores_da_copa/app/core/database/sqlite_connection_factory.dart';
import 'package:jogadores_da_copa/app/core/logger/app_logger.dart';
import 'package:jogadores_da_copa/app/models/player_model.dart';
import 'package:jogadores_da_copa/app/repositories/splash/splash_repository.dart';

class SplashRepositoryImpl implements SplashRepository {
  final SqliteConnectionFactory _sqliteConnectionFactory;
  final AppLogger _log;

  SplashRepositoryImpl({
    required SqliteConnectionFactory sqliteConnectionFactory,
    required AppLogger log,
  })  : _sqliteConnectionFactory = sqliteConnectionFactory,
        _log = log;

  @override
  Future<List<PlayerModel>> populatePlayers() async {
    return [];
  }
}
