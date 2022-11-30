import 'dart:convert';

import 'package:jogadores_da_copa/app/models/paging_model.dart';
import 'package:jogadores_da_copa/app/models/response_model.dart';

class ApiFootballResponseModel {
  final int? results;
  final PagingModel? paging;
  final List<ResponseModel>? response;

  ApiFootballResponseModel({
    this.results,
    this.paging,
    this.response,
  });

  Map<String, dynamic> toMap() {
    return {
      'results': results,
      'paging': paging?.toMap(),
      'response': response?.map((player) => player.toMap()).toList(),
    };
  }

  factory ApiFootballResponseModel.fromMap(Map<String, dynamic> map) {
    return ApiFootballResponseModel(
      results: map['results']?.toInt(),
      paging: map['paging'] != null ? PagingModel.fromMap(map['paging']) : null,
      response: map['response'] != null
          ? List<ResponseModel>.from(
              map['response']?.map((player) => ResponseModel.fromMap(player)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiFootballResponseModel.fromJson(String source) =>
      ApiFootballResponseModel.fromMap(json.decode(source));
}
