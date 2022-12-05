import 'package:flutter/material.dart';
import 'package:jogadores_da_copa/app/core/notifier/jogadores_da_copa_listener_notifier.dart';
import 'package:jogadores_da_copa/app/models/player/player_model.dart';
import 'package:jogadores_da_copa/app/modules/home/home_controller.dart';
import 'package:jogadores_da_copa/app/modules/home/widgets/player_list_widget.dart';
import 'package:provider/provider.dart';

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

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await _loadPlayers();
    });
  }

  Future<void> _loadPlayers() async {
    await widget._homeController.getPlayers();
    players = widget._homeController.playersFetched;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Theme.of(context).primaryColorLight,
        child: Column(
          children: [
            Consumer<HomeController>(
              builder: (context, value, child) {
                return Expanded(
                  child: PlayerListWidget(
                    controller: value,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
