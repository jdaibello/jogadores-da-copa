import 'package:jogadores_da_copa/app/models/response_model.dart';
import 'package:jogadores_da_copa/app/repositories/splash/splash_repository.dart';
import 'package:jogadores_da_copa/app/services/splash/splash_service.dart';

class SplashServiceImpl implements SplashService {
  final SplashRepository _splashRepository;

  SplashServiceImpl({
    required SplashRepository splashRepository,
  }) : _splashRepository = splashRepository;

  @override
  Future<List<ResponseModel>> fetchPlayersDataFromApi() =>
      _splashRepository.fetchPlayersDataFromApi();

  @override
  Future<void> populatePlayersData(List<ResponseModel> playersData) =>
      _splashRepository.populatePlayers(playersData);

  @override
  Future<void> savePlayerToLocalStorage(ResponseModel playerData) =>
      _splashRepository.savePlayerDataToLocalStorage(playerData);
}
