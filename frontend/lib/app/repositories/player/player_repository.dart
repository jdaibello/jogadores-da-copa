import 'package:jogadores_da_copa/app/models/response_model.dart';

abstract class PlayerRepository {
  Future<List<ResponseModel>> getPlayersDataFromLocalStorage();
}
