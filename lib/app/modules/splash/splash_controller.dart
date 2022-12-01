import 'package:jogadores_da_copa/app/core/notifier/jogadores_da_copa_change_notifier.dart';
import 'package:jogadores_da_copa/app/models/player_model.dart';
import 'package:jogadores_da_copa/app/services/splash/splash_service.dart';

class SplashController extends JogadoresDaCopaChangeNotifier {
  final SplashService _splashService;
  List<PlayerModel> playersFetched = [];

  SplashController({
    required SplashService splashService,
  }) : _splashService = splashService;

  Future<void> fetchPlayersFromApi() async {
    showLoading();
    notifyListeners();

    List<PlayerModel> players = await _splashService.fetchPlayersFromApi();
    playersFetched = players;

    hideLoading();
    notifyListeners();
  }

  Future<void> populatePlayers() async {
    showLoading();
    notifyListeners();

    await _splashService.populatePlayers(playersFetched);

    hideLoading();
    notifyListeners();
  }
}
