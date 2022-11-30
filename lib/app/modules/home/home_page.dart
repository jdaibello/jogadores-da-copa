import 'package:flutter/material.dart';
import 'package:jogadores_da_copa/app/core/notifier/jogadores_da_copa_listener_notifier.dart';
import 'package:jogadores_da_copa/app/models/player_model.dart';
import 'package:jogadores_da_copa/app/modules/home/home_controller.dart';

class HomePage extends StatefulWidget {
  final HomeController _homeController;

  const HomePage({required HomeController homeController, Key? key})
      : _homeController = homeController,
        super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PlayerModel> players = [];

  @override
  void initState() {
    super.initState();

    JogadoresDaCopaListenerNotifier(changeNotifier: widget._homeController)
        .listener(
      context: context,
      successCallback: (notifier, listenerInstance) {
        listenerInstance.dispose();
      },
    );

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget._homeController.getPlayers();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<PlayerModel> players = widget._homeController.playersFetched;
    debugPrint('$players');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
