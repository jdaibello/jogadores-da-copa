import 'dart:convert';

import 'package:jogadores_da_copa/app/models/player_model.dart';

class ResponseModel {
  final PlayerModel player;

  ResponseModel({
    required this.player,
  });

  Map<String, dynamic> toMap() {
    return {
      'player': player.toMap(),
    };
  }

  factory ResponseModel.fromMap(Map<String, dynamic> map) {
    return ResponseModel(
      player: PlayerModel.fromMap(map['player']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseModel.fromJson(String source) =>
      ResponseModel.fromMap(json.decode(source));
}
