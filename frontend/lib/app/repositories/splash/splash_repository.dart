import 'package:jogadores_da_copa/app/models/player_model.dart';

abstract class SplashRepository {
  Future<List<PlayerModel>> fetchPlayersFromApi();
  Future<void> populatePlayers(List<PlayerModel> players);
  Future<void> savePlayerToLocalDatabase(PlayerModel player);
}
