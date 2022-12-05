// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DuelsModel {
  final int? total;
  final int? won;

  DuelsModel({
    this.total,
    this.won,
  });

  DuelsModel copyWith({
    int? total,
    int? won,
  }) {
    return DuelsModel(
      total: total ?? this.total,
      won: won ?? this.won,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'total': total,
      'won': won,
    };
  }

  factory DuelsModel.fromMap(Map<String, dynamic> map) {
    return DuelsModel(
      total: map['total'] != null ? map['total'] as int : null,
      won: map['won'] != null ? map['won'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DuelsModel.fromJson(String source) =>
      DuelsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DuelsModel(total: $total, won: $won)';

  @override
  bool operator ==(covariant DuelsModel other) {
    if (identical(this, other)) return true;

    return other.total == total && other.won == won;
  }

  @override
  int get hashCode => total.hashCode ^ won.hashCode;
}
