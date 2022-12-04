import 'package:jogadores_da_copa/app/models/player_model.dart';
import 'package:jogadores_da_copa/app/repositories/player/player_repository.dart';
import 'package:jogadores_da_copa/app/services/player/player_service.dart';

class PlayerServiceImpl implements PlayerService {
  final PlayerRepository _playerRepository;

  PlayerServiceImpl({
    required PlayerRepository playerRepository,
  }) : _playerRepository = playerRepository;

  @override
  Future<List<PlayerModel>> getPlayersFromDatabase() =>
      _playerRepository.getPlayersFromDatabase();
}
