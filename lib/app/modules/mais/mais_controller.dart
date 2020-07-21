import 'package:hasura_connect/hasura_connect.dart';
import 'package:iomedicamentos/app/utils/user_controller.dart';
import 'package:mobx/mobx.dart';

part 'mais_controller.g.dart';

class MaisController = _MaisControllerBase with _$MaisController;

abstract class _MaisControllerBase with Store {
  final HasuraConnect _hasuraConnect;

  _MaisControllerBase(this._hasuraConnect) {
    getRanking();
  }

  UserController _userController = UserController();

  @action
  Future<dynamic> getRanking() async {
    String userId = await _userController.setUid();
    getRankingDB(userId);
  }

  @action
  Future<dynamic> getRankingDB(String userId) async {
    var query = """
      query MyQuery {
        ranking(where: {user_id: {_eq: ""}}, order_by: {quantidade: desc}) {
          quantidade
          medicamento {
            apresentacao
            classe_id
            nome
          }
        }
      }
    """;

    var doc = await _hasuraConnect.query(query, variables: {
      "userId": userId,
    });

    if (doc["data"]["medicamentos"].isEmpty) {
      print('vazio');
    } else {
      for (var document in doc["data"]["medicamentos"]) {
        int newId = document["id"];
      }
    }
  }
}
