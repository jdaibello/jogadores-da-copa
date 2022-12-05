// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GoalsModel {
  final int total;
  final int? conceded;
  final int? assists;
  final int? saves;

  GoalsModel({
    required this.total,
    this.conceded,
    this.assists,
    this.saves,
  });

  GoalsModel copyWith({
    int? total,
    int? conceded,
    int? assists,
    int? saves,
  }) {
    return GoalsModel(
      total: total ?? this.total,
      conceded: conceded ?? this.conceded,
      assists: assists ?? this.assists,
      saves: saves ?? this.saves,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'total': total,
      'conceded': conceded,
      'assists': assists,
      'saves': saves,
    };
  }

  factory GoalsModel.fromMap(Map<String, dynamic> map) {
    return GoalsModel(
      total: map['total'] as int,
      conceded: map['conceded'] != null ? map['conceded'] as int : null,
      assists: map['assists'] != null ? map['assists'] as int : null,
      saves: map['saves'] != null ? map['saves'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GoalsModel.fromJson(String source) =>
      GoalsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GoalsModel(total: $total, conceded: $conceded, assists: $assists, saves: $saves)';
  }

  @override
  bool operator ==(covariant GoalsModel other) {
    if (identical(this, other)) return true;

    return other.total == total &&
        other.conceded == conceded &&
        other.assists == assists &&
        other.saves == saves;
  }

  @override
  int get hashCode {
    return total.hashCode ^
        conceded.hashCode ^
        assists.hashCode ^
        saves.hashCode;
  }
}
