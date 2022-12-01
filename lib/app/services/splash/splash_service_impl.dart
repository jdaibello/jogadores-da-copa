import 'package:jogadores_da_copa/app/models/player_model.dart';
import 'package:jogadores_da_copa/app/repositories/splash/splash_repository.dart';
import 'package:jogadores_da_copa/app/services/splash/splash_service.dart';

class SplashServiceImpl implements SplashService {
  final SplashRepository _splashRepository;

  SplashServiceImpl({
    required SplashRepository splashRepository,
  }) : _splashRepository = splashRepository;

  @override
  Future<List<PlayerModel>> fetchPlayersFromApi() =>
      _splashRepository.fetchPlayersFromApi();

  @override
  Future<void> populatePlayers(List<PlayerModel> players) =>
      _splashRepository.populatePlayers(players);

  @override
  Future<void> savePlayerToLocalDatabase(PlayerModel player) =>
      _splashRepository.savePlayerToLocalDatabase(player);
}
