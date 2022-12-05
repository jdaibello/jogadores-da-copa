// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TacklesModel {
  final int? total;
  final int? blocks;
  final int? interceptions;

  TacklesModel({
    this.total,
    this.blocks,
    this.interceptions,
  });

  TacklesModel copyWith({
    int? total,
    int? blocks,
    int? interceptions,
  }) {
    return TacklesModel(
      total: total ?? this.total,
      blocks: blocks ?? this.blocks,
      interceptions: interceptions ?? this.interceptions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'total': total,
      'blocks': blocks,
      'interceptions': interceptions,
    };
  }

  factory TacklesModel.fromMap(Map<String, dynamic> map) {
    return TacklesModel(
      total: map['total'] != null ? map['total'] as int : null,
      blocks: map['blocks'] != null ? map['blocks'] as int : null,
      interceptions:
          map['interceptions'] != null ? map['interceptions'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TacklesModel.fromJson(String source) =>
      TacklesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'TacklesModel(total: $total, blocks: $blocks, interceptions: $interceptions)';

  @override
  bool operator ==(covariant TacklesModel other) {
    if (identical(this, other)) return true;

    return other.total == total &&
        other.blocks == blocks &&
        other.interceptions == interceptions;
  }

  @override
  int get hashCode => total.hashCode ^ blocks.hashCode ^ interceptions.hashCode;
}
