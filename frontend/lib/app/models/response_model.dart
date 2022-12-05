// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart' show DeepCollectionEquality;
import 'package:jogadores_da_copa/app/models/player/player_model.dart';
import 'package:jogadores_da_copa/app/models/statistics_model.dart';

class ResponseModel {
  final PlayerModel player;
  final List<StatisticsModel> statistics;

  ResponseModel({
    required this.player,
    required this.statistics,
  });

  ResponseModel copyWith({
    PlayerModel? player,
    List<StatisticsModel>? statistics,
  }) {
    return ResponseModel(
      player: player ?? this.player,
      statistics: statistics ?? this.statistics,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'player': player.toMap(),
      'statistics': statistics.map((statistic) => statistic.toMap()).toList(),
    };
  }

  factory ResponseModel.fromMap(Map<String, dynamic> map) {
    return ResponseModel(
      player: PlayerModel.fromMap(map['player'] as Map<String, dynamic>),
      statistics: List<StatisticsModel>.from(
        (map['statistics'] as List<int>).map<StatisticsModel>(
          (statistic) =>
              StatisticsModel.fromMap(statistic as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseModel.fromJson(String source) =>
      ResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ResponseModel(player: $player, statistics: $statistics)';

  @override
  bool operator ==(covariant ResponseModel other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.player == player && listEquals(other.statistics, statistics);
  }

  @override
  int get hashCode => player.hashCode ^ statistics.hashCode;
}
