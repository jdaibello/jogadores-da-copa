import 'package:jogadores_da_copa/app/models/response_model.dart';

abstract class SplashRepository {
  Future<List<ResponseModel>> fetchPlayersDataFromApi();
  Future<void> populatePlayers(List<ResponseModel> playersData);
  Future<void> savePlayerDataToLocalStorage(ResponseModel playerData);
}
