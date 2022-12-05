import 'package:flutter/material.dart';
import 'package:jogadores_da_copa/app/core/exceptions/failure_exception.dart';
import 'package:jogadores_da_copa/app/core/helpers/constants.dart';
import 'package:jogadores_da_copa/app/core/local_storage/local_storage.dart';
import 'package:jogadores_da_copa/app/core/logger/app_logger.dart';
import 'package:jogadores_da_copa/app/core/rest_client/rest_client.dart';
import 'package:jogadores_da_copa/app/core/rest_client/rest_client_exception.dart';
import 'package:jogadores_da_copa/app/models/api_football_response_model.dart';
import 'package:jogadores_da_copa/app/models/paging_model.dart';
import 'package:jogadores_da_copa/app/models/response_model.dart';
import 'package:jogadores_da_copa/app/repositories/splash/splash_repository.dart';

class SplashRepositoryImpl implements SplashRepository {
  final RestClient _restClient;
  final LocalStorage _localStorage;
  final AppLogger _log;

  List<ResponseModel> playersData = [];
  int auxPage = 1;

  SplashRepositoryImpl({
    required RestClient restClient,
    required LocalStorage localStorage,
    required AppLogger log,
  })  : _restClient = restClient,
        _localStorage = localStorage,
        _log = log;

  @override
  Future<List<ResponseModel>> fetchPlayersDataFromApi() async {
    try {
      final isPlayersPopulated = await _playersIsAlreadyPopulated();

      if (!isPlayersPopulated) {
        final result = await _restClient.get('/players', queryParameters: {
          'league': 1,
          'season': 2022,
          'page': auxPage,
        });

        PagingModel pagingModel = PagingModel.fromMap(
          await result.data['paging'],
        );

        if (pagingModel.current < pagingModel.total) {
          auxPage = pagingModel.current + 1;

          // TODO: Need to fix "'Unhandled Exception: type 'MappedListIterable<dynamic, List<ResponseModel>?>' is not a subtype of type 'Iterable<ResponseModel>'" error
          playersData.addAll(
            await result.data['response']?.map<List<ResponseModel>?>(
              (playerData) => ApiFootballResponseModel.fromJson(playerData)
                  .response
                  ?.toList(),
            ),
          );

          //* unfortunately, because of the API rate limit (10 requests/min),
          //* we need to wait some time beetween the first and the last request.
          // await Future.delayed(const Duration(seconds: 5));

          // playersData = await fetchPlayersDataFromApi();
        }

        return playersData;
      } else {
        return [];
      }
    } on RestClientException catch (e, s) {
      _log.error('Erro ao buscar jogadores', e, s);
      throw FailureException(
        message: 'Erro ao buscar jogadores',
      );
    }
  }

  @override
  Future<void> populatePlayers(List<ResponseModel> playersData) async {
    var listOfPlayersFetchedFromApi = <ResponseModel>[];

    listOfPlayersFetchedFromApi = await fetchPlayersDataFromApi();

    for (var playerData in listOfPlayersFetchedFromApi) {
      savePlayerDataToLocalStorage(playerData);
    }

    debugPrint('$listOfPlayersFetchedFromApi');
  }

  @override
  Future<void> savePlayerDataToLocalStorage(ResponseModel playerData) async {
    final isPlayersPopulated = await _playersIsAlreadyPopulated();

    if (!isPlayersPopulated) {
      await _localStorage.write<String>(
        Constants.API_FOOTBALL_RESPONSE_JSON_WITHOUT_PAGINATION,
        playerData.toJson(),
      );
    }
  }

  Future<bool> _playersIsAlreadyPopulated() async {
    final jsonData = await _localStorage
        .contains(Constants.API_FOOTBALL_RESPONSE_JSON_WITHOUT_PAGINATION);

    if (jsonData) {
      return true;
    } else {
      return false;
    }
  }
}
