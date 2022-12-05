// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CardsModel {
  final int yellow;
  final int yellowred;
  final int red;

  CardsModel({
    required this.yellow,
    required this.yellowred,
    required this.red,
  });

  CardsModel copyWith({
    int? yellow,
    int? yellowred,
    int? red,
  }) {
    return CardsModel(
      yellow: yellow ?? this.yellow,
      yellowred: yellowred ?? this.yellowred,
      red: red ?? this.red,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'yellow': yellow,
      'yellowred': yellowred,
      'red': red,
    };
  }

  factory CardsModel.fromMap(Map<String, dynamic> map) {
    return CardsModel(
      yellow: map['yellow'] as int,
      yellowred: map['yellowred'] as int,
      red: map['red'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CardsModel.fromJson(String source) =>
      CardsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CardsModel(yellow: $yellow, yellowred: $yellowred, red: $red)';

  @override
  bool operator ==(covariant CardsModel other) {
    if (identical(this, other)) return true;

    return other.yellow == yellow &&
        other.yellowred == yellowred &&
        other.red == red;
  }

  @override
  int get hashCode => yellow.hashCode ^ yellowred.hashCode ^ red.hashCode;
}
