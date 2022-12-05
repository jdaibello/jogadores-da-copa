// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LeagueModel {
  final int id;
  final String name;
  final String country;
  final String logo;
  final String? flag;
  final int season;

  LeagueModel({
    required this.id,
    required this.name,
    required this.country,
    required this.logo,
    this.flag,
    required this.season,
  });

  LeagueModel copyWith({
    int? id,
    String? name,
    String? country,
    String? logo,
    String? flag,
    int? season,
  }) {
    return LeagueModel(
      id: id ?? this.id,
      name: name ?? this.name,
      country: country ?? this.country,
      logo: logo ?? this.logo,
      flag: flag ?? this.flag,
      season: season ?? this.season,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'country': country,
      'logo': logo,
      'flag': flag,
      'season': season,
    };
  }

  factory LeagueModel.fromMap(Map<String, dynamic> map) {
    return LeagueModel(
      id: map['id'] as int,
      name: map['name'] as String,
      country: map['country'] as String,
      logo: map['logo'] as String,
      flag: map['flag'] != null ? map['flag'] as String : null,
      season: map['season'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory LeagueModel.fromJson(String source) =>
      LeagueModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LeagueModel(id: $id, name: $name, country: $country, logo: $logo, flag: $flag, season: $season)';
  }

  @override
  bool operator ==(covariant LeagueModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.country == country &&
        other.logo == logo &&
        other.flag == flag &&
        other.season == season;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        country.hashCode ^
        logo.hashCode ^
        flag.hashCode ^
        season.hashCode;
  }
}
