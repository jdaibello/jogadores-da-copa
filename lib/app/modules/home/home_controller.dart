import 'package:jogadores_da_copa/app/core/notifier/jogadores_da_copa_change_notifier.dart';
import 'package:jogadores_da_copa/app/models/player_model.dart';
import 'package:jogadores_da_copa/app/services/player/player_service.dart';

class HomeController extends JogadoresDaCopaChangeNotifier {
  final PlayerService _playerService;
  List<PlayerModel> playersFetched = [];

  HomeController({
    required PlayerService playerService,
  }) : _playerService = playerService;

  Future<void> getPlayers() async {
    showLoading();
    notifyListeners();

    List<PlayerModel> players = await _playerService.getPlayers();
    playersFetched = players;

    hideLoading();
    notifyListeners();
  }
}
