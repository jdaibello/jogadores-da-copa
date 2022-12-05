import 'package:jogadores_da_copa/app/models/response_model.dart';

abstract class PlayerService {
  Future<List<ResponseModel>> getPlayersDataFromLocalStorage();
}
