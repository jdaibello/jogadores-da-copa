// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:jogadores_da_copa/app/models/response_model.dart';
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
    return Selector<HomeController, List<ResponseModel>>(
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
  final ResponseModel _response;

  const _PlayerItem(this._response);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(6),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            child: Image.network(_response.player.photo!),
          ),
          trailing: Text(_response.player.nationality ?? 'Unknown nationality'),
          title: Text(_response.player.name),
          subtitle: Text(_response.player.birth.date!),
        ),
      ),
    );
  }
}
