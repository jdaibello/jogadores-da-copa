import 'package:jogadores_da_copa/app/models/response_model.dart';

abstract class SplashService {
  Future<List<ResponseModel>> fetchPlayersDataFromApi();
  Future<void> populatePlayersData(List<ResponseModel> playersData);
  Future<void> savePlayerToLocalStorage(ResponseModel playerData);
}
