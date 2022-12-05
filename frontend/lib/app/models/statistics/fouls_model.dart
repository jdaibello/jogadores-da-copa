// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FoulsModel {
  final int? drawn;
  final int? committed;

  FoulsModel({
    this.drawn,
    this.committed,
  });

  FoulsModel copyWith({
    int? drawn,
    int? committed,
  }) {
    return FoulsModel(
      drawn: drawn ?? this.drawn,
      committed: committed ?? this.committed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'drawn': drawn,
      'committed': committed,
    };
  }

  factory FoulsModel.fromMap(Map<String, dynamic> map) {
    return FoulsModel(
      drawn: map['drawn'] != null ? map['drawn'] as int : null,
      committed: map['committed'] != null ? map['committed'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FoulsModel.fromJson(String source) =>
      FoulsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FoulsModel(drawn: $drawn, committed: $committed)';

  @override
  bool operator ==(covariant FoulsModel other) {
    if (identical(this, other)) return true;

    return other.drawn == drawn && other.committed == committed;
  }

  @override
  int get hashCode => drawn.hashCode ^ committed.hashCode;
}
