// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PenaltyModel {
  final int? won;
  final int? commited;
  final int? scored;
  final int? missed;
  final int? saved;

  PenaltyModel({
    this.won,
    this.commited,
    this.scored,
    this.missed,
    this.saved,
  });

  PenaltyModel copyWith({
    int? won,
    int? commited,
    int? scored,
    int? missed,
    int? saved,
  }) {
    return PenaltyModel(
      won: won ?? this.won,
      commited: commited ?? this.commited,
      scored: scored ?? this.scored,
      missed: missed ?? this.missed,
      saved: saved ?? this.saved,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'won': won,
      'commited': commited,
      'scored': scored,
      'missed': missed,
      'saved': saved,
    };
  }

  factory PenaltyModel.fromMap(Map<String, dynamic> map) {
    return PenaltyModel(
      won: map['won'] != null ? map['won'] as int : null,
      commited: map['commited'] != null ? map['commited'] as int : null,
      scored: map['scored'] != null ? map['scored'] as int : null,
      missed: map['missed'] != null ? map['missed'] as int : null,
      saved: map['saved'] != null ? map['saved'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PenaltyModel.fromJson(String source) =>
      PenaltyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PenaltyModel(won: $won, commited: $commited, scored: $scored, missed: $missed, saved: $saved)';
  }

  @override
  bool operator ==(covariant PenaltyModel other) {
    if (identical(this, other)) return true;

    return other.won == won &&
        other.commited == commited &&
        other.scored == scored &&
        other.missed == missed &&
        other.saved == saved;
  }

  @override
  int get hashCode {
    return won.hashCode ^
        commited.hashCode ^
        scored.hashCode ^
        missed.hashCode ^
        saved.hashCode;
  }
}
