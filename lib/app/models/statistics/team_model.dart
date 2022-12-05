// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TeamModel {
  final int id;
  final String name;
  final String logo;

  TeamModel({
    required this.id,
    required this.name,
    required this.logo,
  });

  TeamModel copyWith({
    int? id,
    String? name,
    String? logo,
  }) {
    return TeamModel(
      id: id ?? this.id,
      name: name ?? this.name,
      logo: logo ?? this.logo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'logo': logo,
    };
  }

  factory TeamModel.fromMap(Map<String, dynamic> map) {
    return TeamModel(
      id: map['id'] as int,
      name: map['name'] as String,
      logo: map['logo'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TeamModel.fromJson(String source) =>
      TeamModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TeamModel(id: $id, name: $name, logo: $logo)';

  @override
  bool operator ==(covariant TeamModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.logo == logo;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ logo.hashCode;
}
