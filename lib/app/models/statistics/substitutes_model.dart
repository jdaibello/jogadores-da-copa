// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SubstitutesModel {
  final int started;
  final int out;
  final int bench;

  SubstitutesModel({
    required this.started,
    required this.out,
    required this.bench,
  });

  SubstitutesModel copyWith({
    int? started,
    int? out,
    int? bench,
  }) {
    return SubstitutesModel(
      started: started ?? this.started,
      out: out ?? this.out,
      bench: bench ?? this.bench,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'in': started,
      'out': out,
      'bench': bench,
    };
  }

  factory SubstitutesModel.fromMap(Map<String, dynamic> map) {
    return SubstitutesModel(
      started: map['in'] as int,
      out: map['out'] as int,
      bench: map['bench'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubstitutesModel.fromJson(String source) =>
      SubstitutesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SubstitutesModel(started: $started, out: $out, bench: $bench)';

  @override
  bool operator ==(covariant SubstitutesModel other) {
    if (identical(this, other)) return true;

    return other.started == started && other.out == out && other.bench == bench;
  }

  @override
  int get hashCode => started.hashCode ^ out.hashCode ^ bench.hashCode;
}
