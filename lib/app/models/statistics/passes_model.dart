// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PassesModel {
  final int? total;
  final int? key;
  final num? accuracy;

  PassesModel({
    this.total,
    this.key,
    this.accuracy,
  });

  PassesModel copyWith({
    int? total,
    int? key,
    num? accuracy,
  }) {
    return PassesModel(
      total: total ?? this.total,
      key: key ?? this.key,
      accuracy: accuracy ?? this.accuracy,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'total': total,
      'key': key,
      'accuracy': accuracy,
    };
  }

  factory PassesModel.fromMap(Map<String, dynamic> map) {
    return PassesModel(
      total: map['total'] != null ? map['total'] as int : null,
      key: map['key'] != null ? map['key'] as int : null,
      accuracy: map['accuracy'] != null ? map['accuracy'] as num : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PassesModel.fromJson(String source) =>
      PassesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PassesModel(total: $total, key: $key, accuracy: $accuracy)';

  @override
  bool operator ==(covariant PassesModel other) {
    if (identical(this, other)) return true;

    return other.total == total &&
        other.key == key &&
        other.accuracy == accuracy;
  }

  @override
  int get hashCode => total.hashCode ^ key.hashCode ^ accuracy.hashCode;
}
