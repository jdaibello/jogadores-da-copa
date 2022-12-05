import 'package:jogadores_da_copa/app/models/response_model.dart';
import 'package:jogadores_da_copa/app/repositories/player/player_repository.dart';
import 'package:jogadores_da_copa/app/services/player/player_service.dart';

class PlayerServiceImpl implements PlayerService {
  final PlayerRepository _playerRepository;

  PlayerServiceImpl({
    required PlayerRepository playerRepository,
  }) : _playerRepository = playerRepository;

  @override
  Future<List<ResponseModel>> getPlayersDataFromLocalStorage() =>
      _playerRepository.getPlayersDataFromLocalStorage();
}
