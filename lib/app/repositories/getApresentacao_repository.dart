import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:iomedicamentos/app/modules/home/home_controller.dart';

class GetApresentacaoRepository extends Disposable {
  final HasuraConnect _hasuraConnect;
  final HomeController controller;
  GetApresentacaoRepository(this._hasuraConnect, this.controller);

  Future<dynamic> getApresentacao(
      String nome, String idade, int classeId) async {
    controller.listNomes.clear();
    controller.listNomesId.clear();
    var query = """
      query getApresentacao(\$nome:String!, \$idade:String!, \$classeId:Int!,) {
        medicamentos(where: {nome: {_eq: \$nome}, idade: {_eq: \$idade}, classe_id: {_eq: \$classeId}}) {
          apresentacao
        }
      }
    """;
    var doc = await _hasuraConnect.query(query,
        variables: {"nome": nome, "idade": idade, "classeId": classeId});
    if (doc["data"]["medicamentos"].isEmpty) {
      print('vazio');
    } else {
      for (var document in doc["data"]["medicamentos"]) {
        String apresentacoes = document["apresentacao"];
        controller.listApresentacoes.add(apresentacoes);
      }
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
