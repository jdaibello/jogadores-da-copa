// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GamesModel {
  final int appearences;
  final int lineups;
  final int minutes;
  final int? number;
  final String position;
  final String? rating;
  final bool? captain;

  GamesModel({
    required this.appearences,
    required this.lineups,
    required this.minutes,
    this.number,
    required this.position,
    this.rating,
    this.captain,
  });

  GamesModel copyWith({
    int? appearences,
    int? lineups,
    int? minutes,
    int? number,
    String? position,
    String? rating,
    bool? captain,
  }) {
    return GamesModel(
      appearences: appearences ?? this.appearences,
      lineups: lineups ?? this.lineups,
      minutes: minutes ?? this.minutes,
      number: number ?? this.number,
      position: position ?? this.position,
      rating: rating ?? this.rating,
      captain: captain ?? this.captain,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'appearences': appearences,
      'lineups': lineups,
      'minutes': minutes,
      'number': number,
      'position': position,
      'rating': rating,
      'captain': captain,
    };
  }

  factory GamesModel.fromMap(Map<String, dynamic> map) {
    return GamesModel(
      appearences: map['appearences'] as int,
      lineups: map['lineups'] as int,
      minutes: map['minutes'] as int,
      number: map['number'] != null ? map['number'] as int : null,
      position: map['position'] as String,
      rating: map['rating'] != null ? map['rating'] as String : null,
      captain: map['captain'] != null ? map['captain'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GamesModel.fromJson(String source) =>
      GamesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GamesModel(appearences: $appearences, lineups: $lineups, minutes: $minutes, number: $number, position: $position, rating: $rating, captain: $captain)';
  }

  @override
  bool operator ==(covariant GamesModel other) {
    if (identical(this, other)) return true;

    return other.appearences == appearences &&
        other.lineups == lineups &&
        other.minutes == minutes &&
        other.number == number &&
        other.position == position &&
        other.rating == rating &&
        other.captain == captain;
  }

  @override
  int get hashCode {
    return appearences.hashCode ^
        lineups.hashCode ^
        minutes.hashCode ^
        number.hashCode ^
        position.hashCode ^
        rating.hashCode ^
        captain.hashCode;
  }
}
