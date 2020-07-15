import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:iomedicamentos/app/modules/home/home_controller.dart';

class GetNomesRepository extends Disposable {
  final HasuraConnect _hasuraConnect;
  final HomeController controller;
  GetNomesRepository(this._hasuraConnect, this.controller);
  Future<dynamic> getNomes(int classeId) async {
    controller.listNomes.clear();
    controller.listNomesId.clear();
    var query = """
      query getNomes(\$classeId:Int!,) {
        nome_medicamentos(where: {classe_id: {_eq: \$classeId}}) {
          id
          classe_id
          nome
        }
      }
    """;
    var doc =
        await _hasuraConnect.query(query, variables: {"classeId": classeId});
    if (doc["data"]["nome_medicamentos"].isEmpty) {
      print('vazio');
    } else {
      if (doc["data"]["nome_medicamentos"].length > 0) {
        for (var document in doc["data"]["nome_medicamentos"]) {
          String nomes = document["nome"];
          int nomeId = document["id"];
          controller.listNomes.add(nomes);
          controller.listNomesId.add(nomeId);
        }
      }
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
