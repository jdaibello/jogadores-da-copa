import 'package:jogadores_da_copa/app/core/logger/app_logger.dart';
import 'package:jogadores_da_copa/app/core/notifier/jogadores_da_copa_change_notifier.dart';
import 'package:jogadores_da_copa/app/models/response_model.dart';
import 'package:jogadores_da_copa/app/services/player/player_service.dart';

class HomeController extends JogadoresDaCopaChangeNotifier {
  final PlayerService _playerService;
  final AppLogger _log;

  var playersFetched = <ResponseModel>[];

  HomeController({
    required AppLogger log,
    required PlayerService playerService,
  })  : _playerService = playerService,
        _log = log;

  Future<void> getPlayers() async {
    showLoading();
    notifyListeners();

    List<ResponseModel> players =
        await _playerService.getPlayersDataFromLocalStorage();

    playersFetched = players.map((data) => data).toList();

    _log.append(
        '-------------------------- Player Data --------------------------');
    _log.append('Count: ${playersFetched.length}');
    _log.append('First player: ${playersFetched.first}');
    _log.append('Last player: ${playersFetched.last}');
    _log.closeAppend();

    hideLoading();
    notifyListeners();
  }
}
