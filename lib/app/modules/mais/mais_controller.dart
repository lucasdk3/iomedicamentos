import 'package:firebase_auth/firebase_auth.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:iomedicamentos/app/modules/mais/mais_model.dart';
import 'package:iomedicamentos/app/utils/user_controller.dart';
import 'package:mobx/mobx.dart';

part 'mais_controller.g.dart';

class MaisController = _MaisControllerBase with _$MaisController;

abstract class _MaisControllerBase with Store {
  final FirebaseAuth auth;
  HasuraConnect connect =
      HasuraConnect('https://iomedicamentos.herokuapp.com/v1/graphql');

  _MaisControllerBase(this.auth) {
    getRanking();
  }

  @observable
  List<MaisModel> listItens = [];

  UserController _userController = UserController();

  @action
  Future<dynamic> getRanking() async {
    var user = await auth.currentUser();
    var userId = user.uid;
    print(userId);
    getRankingDB(userId).then((data) => listItens = data);
  }

  @action
  Future<List<MaisModel>> getRankingDB(String userId) async {
    var query = """
      query getRankingDB(\$userId:String!) {
        ranking(where: {user_id: {_eq: \$userId}}, order_by: {quantidade: desc}) {
          quantidade
          medicamento {
            apresentacao
            classe_id
            nome
          }
        }
      }
    """;

    var doc = await connect.query(query, variables: {
      "userId": userId,
    });

    return MaisModel.fromJsonList(doc["data"]["ranking"] as List);
  }
}
