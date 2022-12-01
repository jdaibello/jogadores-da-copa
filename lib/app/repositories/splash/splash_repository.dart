import 'package:jogadores_da_copa/app/models/player_model.dart';

abstract class SplashRepository {
  Future<List<PlayerModel>> populatePlayers();
}
