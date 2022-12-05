// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:jogadores_da_copa/app/models/player/player_model.dart';
import 'package:jogadores_da_copa/app/modules/home/home_controller.dart';
import 'package:provider/provider.dart';

class PlayerListWidget extends StatelessWidget {
  final HomeController _controller;

  const PlayerListWidget({
    super.key,
    required HomeController controller,
  }) : _controller = controller;

  @override
  Widget build(BuildContext context) {
    return Selector<HomeController, List<PlayerModel>>(
      selector: (context, controller) => _controller.playersFetched,
      child: context.select((value) => null),
      builder: (context, value, child) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: value.length,
          itemBuilder: (context, index) {
            return _PlayerItem(value[index]);
          },
        );
      },
    );
  }
}

class _PlayerItem extends StatelessWidget {
  final PlayerModel _player;

  const _PlayerItem(this._player);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        _player.name,
      ),
      trailing: Text(_player.nationality ?? 'Unknown nationality'),
    );
  }
}
