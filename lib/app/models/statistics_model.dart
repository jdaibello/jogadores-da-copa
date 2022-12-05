// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:jogadores_da_copa/app/models/statistics/cards_model.dart';
import 'package:jogadores_da_copa/app/models/statistics/dribbles_model.dart';
import 'package:jogadores_da_copa/app/models/statistics/duels_model.dart';
import 'package:jogadores_da_copa/app/models/statistics/fouls_model.dart';
import 'package:jogadores_da_copa/app/models/statistics/games_model.dart';
import 'package:jogadores_da_copa/app/models/statistics/goals_model.dart';
import 'package:jogadores_da_copa/app/models/statistics/league_model.dart';
import 'package:jogadores_da_copa/app/models/statistics/passes_model.dart';
import 'package:jogadores_da_copa/app/models/statistics/penalty_model.dart';
import 'package:jogadores_da_copa/app/models/statistics/shots_model.dart';
import 'package:jogadores_da_copa/app/models/statistics/substitutes_model.dart';
import 'package:jogadores_da_copa/app/models/statistics/tackles_model.dart';
import 'package:jogadores_da_copa/app/models/statistics/team_model.dart';

class StatisticsModel {
  final TeamModel team;
  final LeagueModel league;
  final GamesModel games;
  final SubstitutesModel substitutes;
  final ShotsModel shots;
  final GoalsModel goals;
  final PassesModel passes;
  final TacklesModel tackles;
  final DuelsModel duels;
  final DribblesModel dribbles;
  final FoulsModel fouls;
  final CardsModel cards;
  final PenaltyModel penalty;

  StatisticsModel({
    required this.team,
    required this.league,
    required this.games,
    required this.substitutes,
    required this.shots,
    required this.goals,
    required this.passes,
    required this.tackles,
    required this.duels,
    required this.dribbles,
    required this.fouls,
    required this.cards,
    required this.penalty,
  });

  StatisticsModel copyWith({
    TeamModel? team,
    LeagueModel? league,
    GamesModel? games,
    SubstitutesModel? substitutes,
    ShotsModel? shots,
    GoalsModel? goals,
    PassesModel? passes,
    TacklesModel? tackles,
    DuelsModel? duels,
    DribblesModel? dribbles,
    FoulsModel? fouls,
    CardsModel? cards,
    PenaltyModel? penalty,
  }) {
    return StatisticsModel(
      team: team ?? this.team,
      league: league ?? this.league,
      games: games ?? this.games,
      substitutes: substitutes ?? this.substitutes,
      shots: shots ?? this.shots,
      goals: goals ?? this.goals,
      passes: passes ?? this.passes,
      tackles: tackles ?? this.tackles,
      duels: duels ?? this.duels,
      dribbles: dribbles ?? this.dribbles,
      fouls: fouls ?? this.fouls,
      cards: cards ?? this.cards,
      penalty: penalty ?? this.penalty,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'team': team.toMap(),
      'league': league.toMap(),
      'games': games.toMap(),
      'substitutes': substitutes.toMap(),
      'shots': shots.toMap(),
      'goals': goals.toMap(),
      'passes': passes.toMap(),
      'tackles': tackles.toMap(),
      'duels': duels.toMap(),
      'dribbles': dribbles.toMap(),
      'fouls': fouls.toMap(),
      'cards': cards.toMap(),
      'penalty': penalty.toMap(),
    };
  }

  factory StatisticsModel.fromMap(Map<String, dynamic> map) {
    return StatisticsModel(
      team: TeamModel.fromMap(map['team'] as Map<String, dynamic>),
      league: LeagueModel.fromMap(map['league'] as Map<String, dynamic>),
      games: GamesModel.fromMap(map['games'] as Map<String, dynamic>),
      substitutes:
          SubstitutesModel.fromMap(map['substitutes'] as Map<String, dynamic>),
      shots: ShotsModel.fromMap(map['shots'] as Map<String, dynamic>),
      goals: GoalsModel.fromMap(map['goals'] as Map<String, dynamic>),
      passes: PassesModel.fromMap(map['passes'] as Map<String, dynamic>),
      tackles: TacklesModel.fromMap(map['tackles'] as Map<String, dynamic>),
      duels: DuelsModel.fromMap(map['duels'] as Map<String, dynamic>),
      dribbles: DribblesModel.fromMap(map['dribbles'] as Map<String, dynamic>),
      fouls: FoulsModel.fromMap(map['fouls'] as Map<String, dynamic>),
      cards: CardsModel.fromMap(map['cards'] as Map<String, dynamic>),
      penalty: PenaltyModel.fromMap(map['penalty'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory StatisticsModel.fromJson(String source) =>
      StatisticsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StatisticsModel(team: $team, league: $league, games: $games, substitutes: $substitutes, shots: $shots, goals: $goals, passes: $passes, tackles: $tackles, duels: $duels, dribbles: $dribbles, fouls: $fouls, cards: $cards, penalty: $penalty)';
  }

  @override
  bool operator ==(covariant StatisticsModel other) {
    if (identical(this, other)) return true;

    return other.team == team &&
        other.league == league &&
        other.games == games &&
        other.substitutes == substitutes &&
        other.shots == shots &&
        other.goals == goals &&
        other.passes == passes &&
        other.tackles == tackles &&
        other.duels == duels &&
        other.dribbles == dribbles &&
        other.fouls == fouls &&
        other.cards == cards &&
        other.penalty == penalty;
  }

  @override
  int get hashCode {
    return team.hashCode ^
        league.hashCode ^
        games.hashCode ^
        substitutes.hashCode ^
        shots.hashCode ^
        goals.hashCode ^
        passes.hashCode ^
        tackles.hashCode ^
        duels.hashCode ^
        dribbles.hashCode ^
        fouls.hashCode ^
        cards.hashCode ^
        penalty.hashCode;
  }
}
