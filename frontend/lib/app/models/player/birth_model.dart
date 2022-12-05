// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BirthModel {
  final String? date;
  final String? place;
  final String? country;

  BirthModel({
    this.date,
    this.place,
    this.country,
  });

  BirthModel copyWith({
    String? date,
    String? place,
    String? country,
  }) {
    return BirthModel(
      date: date ?? this.date,
      place: place ?? this.place,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'place': place,
      'country': country,
    };
  }

  factory BirthModel.fromMap(Map<String, dynamic> map) {
    return BirthModel(
      date: map['date'] != null ? map['date'] as String : null,
      place: map['place'] != null ? map['place'] as String : null,
      country: map['country'] != null ? map['country'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BirthModel.fromJson(String source) =>
      BirthModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'BirthModel(date: $date, place: $place, country: $country)';

  @override
  bool operator ==(covariant BirthModel other) {
    if (identical(this, other)) return true;

    return other.date == date &&
        other.place == place &&
        other.country == country;
  }

  @override
  int get hashCode => date.hashCode ^ place.hashCode ^ country.hashCode;
}
