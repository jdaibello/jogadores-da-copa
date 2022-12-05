import 'package:flutter/material.dart';
import 'package:jogadores_da_copa/app/core/notifier/jogadores_da_copa_change_notifier.dart';
import 'package:jogadores_da_copa/app/models/player/player_model.dart';
import 'package:jogadores_da_copa/app/models/response_model.dart';
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

    List<ResponseModel> players =
        await _playerService.getPlayersDataFromLocalStorage();

    playersFetched = players.map((data) => data.player).toList();

    debugPrint(
      'Number of players fetch from local storage: ${playersFetched.length}',
    );

    hideLoading();
    notifyListeners();
  }
}
