import 'dart:convert';

class PlayerModel {
  final int id;
  final String name;

  PlayerModel({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory PlayerModel.fromMap(Map<String, dynamic> map) {
    return PlayerModel(
      id: map['player']['id'] ?? '',
      name: map['player']['name'] ?? '',
    );
  }

  factory PlayerModel.loadFromDB(Map<String, dynamic> map) {
    return PlayerModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PlayerModel.fromJson(String source) =>
      PlayerModel.fromMap(json.decode(source));

  @override
  String toString() => 'PlayerModel(id: $id, name: $name)';
}
