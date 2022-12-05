// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DribblesModel {
  final int? attempts;
  final int? success;
  final int? past;

  DribblesModel({
    this.attempts,
    this.success,
    this.past,
  });

  DribblesModel copyWith({
    int? attempts,
    int? success,
    int? past,
  }) {
    return DribblesModel(
      attempts: attempts ?? this.attempts,
      success: success ?? this.success,
      past: past ?? this.past,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'attempts': attempts,
      'success': success,
      'past': past,
    };
  }

  factory DribblesModel.fromMap(Map<String, dynamic> map) {
    return DribblesModel(
      attempts: map['attempts'] != null ? map['attempts'] as int : null,
      success: map['success'] != null ? map['success'] as int : null,
      past: map['past'] != null ? map['past'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DribblesModel.fromJson(String source) =>
      DribblesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'DribblesModel(attempts: $attempts, success: $success, past: $past)';

  @override
  bool operator ==(covariant DribblesModel other) {
    if (identical(this, other)) return true;

    return other.attempts == attempts &&
        other.success == success &&
        other.past == past;
  }

  @override
  int get hashCode => attempts.hashCode ^ success.hashCode ^ past.hashCode;
}
