import 'dart:convert';

class PagingModel {
  final int current;
  final int total;

  PagingModel({
    required this.current,
    required this.total,
  });

  Map<String, dynamic> toMap() {
    return {
      'current': current,
      'total': total,
    };
  }

  factory PagingModel.fromMap(Map<String, dynamic> map) {
    return PagingModel(
      current: map['current']?.toInt() ?? 0,
      total: map['total']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PagingModel.fromJson(String source) =>
      PagingModel.fromMap(json.decode(source));
}
