// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ShotsModel {
  final int? total;
  final int? onTarget;

  ShotsModel({
    this.total,
    this.onTarget,
  });

  ShotsModel copyWith({
    int? total,
    int? onTarget,
  }) {
    return ShotsModel(
      total: total ?? this.total,
      onTarget: onTarget ?? this.onTarget,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'total': total,
      'on': onTarget,
    };
  }

  factory ShotsModel.fromMap(Map<String, dynamic> map) {
    return ShotsModel(
      total: map['total'] != null ? map['total'] as int : null,
      onTarget: map['on'] != null ? map['on'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ShotsModel.fromJson(String source) =>
      ShotsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ShotsModel(total: $total, onTarget: $onTarget)';

  @override
  bool operator ==(covariant ShotsModel other) {
    if (identical(this, other)) return true;

    return other.total == total && other.onTarget == onTarget;
  }

  @override
  int get hashCode => total.hashCode ^ onTarget.hashCode;
}
