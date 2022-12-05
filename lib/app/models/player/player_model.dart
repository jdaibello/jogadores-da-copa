// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:jogadores_da_copa/app/models/player/birth_model.dart';

class PlayerModel {
  final int id;
  final String name;
  final String? firstname;
  final String? lastname;
  final int age;
  final BirthModel birth;
  final String? nationality;
  final String? height;
  final String? weight;
  final bool? injured;
  final String? photo;

  PlayerModel({
    required this.id,
    required this.name,
    this.firstname,
    this.lastname,
    required this.age,
    required this.birth,
    this.nationality,
    this.height,
    this.weight,
    this.injured,
    this.photo,
  });

  PlayerModel copyWith({
    int? id,
    String? name,
    String? firstname,
    String? lastname,
    int? age,
    BirthModel? birth,
    String? nationality,
    String? height,
    String? weight,
    bool? injured,
    String? photo,
  }) {
    return PlayerModel(
      id: id ?? this.id,
      name: name ?? this.name,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      age: age ?? this.age,
      birth: birth ?? this.birth,
      nationality: nationality ?? this.nationality,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      injured: injured ?? this.injured,
      photo: photo ?? this.photo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'firstname': firstname,
      'lastname': lastname,
      'age': age,
      'birth': birth.toMap(),
      'nationality': nationality,
      'height': height,
      'weight': weight,
      'injured': injured,
      'photo': photo,
    };
  }

  factory PlayerModel.fromMap(Map<String, dynamic> map) {
    return PlayerModel(
      id: map['id'] as int,
      name: map['name'] as String,
      firstname: map['firstname'] != null ? map['firstname'] as String : null,
      lastname: map['lastname'] != null ? map['lastname'] as String : null,
      age: map['age'] as int,
      birth: BirthModel.fromMap(map['birth'] as Map<String, dynamic>),
      nationality:
          map['nationality'] != null ? map['nationality'] as String : null,
      height: map['height'] != null ? map['height'] as String : null,
      weight: map['weight'] != null ? map['weight'] as String : null,
      injured: map['injured'] != null ? map['injured'] as bool : null,
      photo: map['photo'] != null ? map['photo'] as String : null,
    );
  }

  factory PlayerModel.loadFromDatabase(Map<String, dynamic> map) {
    return PlayerModel(
      id: map['id'] as int,
      name: map['name'] as String,
      firstname: map['firstname'] != null ? map['firstname'] as String : null,
      lastname: map['lastname'] != null ? map['lastname'] as String : null,
      age: map['age'] as int,
      birth: BirthModel.fromMap(map['birth'] as Map<String, dynamic>),
      nationality:
          map['nationality'] != null ? map['nationality'] as String : null,
      height: map['height'] != null ? map['height'] as String : null,
      weight: map['weight'] != null ? map['weight'] as String : null,
      injured: map['injured'] != null ? map['injured'] as bool : null,
      photo: map['photo'] != null ? map['photo'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlayerModel.fromJson(String source) =>
      PlayerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PlayerModel(id: $id, name: $name, firstname: $firstname, lastname: $lastname, age: $age, birth: $birth, nationality: $nationality, height: $height, weight: $weight, injured: $injured, photo: $photo)';
  }

  @override
  bool operator ==(covariant PlayerModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.firstname == firstname &&
        other.lastname == lastname &&
        other.age == age &&
        other.birth == birth &&
        other.nationality == nationality &&
        other.height == height &&
        other.weight == weight &&
        other.injured == injured &&
        other.photo == photo;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        firstname.hashCode ^
        lastname.hashCode ^
        age.hashCode ^
        birth.hashCode ^
        nationality.hashCode ^
        height.hashCode ^
        weight.hashCode ^
        injured.hashCode ^
        photo.hashCode;
  }
}
