import 'package:jogadores_da_copa/app/models/player_model.dart';

abstract class PlayerRepository {
  Future<List<PlayerModel>> getPlayers();
}
