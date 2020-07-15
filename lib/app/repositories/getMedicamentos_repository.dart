import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:iomedicamentos/app/modules/home/home_controller.dart';

class GetMedicamentosRepository extends Disposable {
  final HasuraConnect _hasuraConnect;
  final HomeController controller;

  GetMedicamentosRepository(this._hasuraConnect, this.controller);
  var result;
  Future<String> getMedicamento(String nome, String idade, String apresentacao,
      double peso, int classeId) async {
    controller.listNomes.clear();
    controller.listNomesId.clear();
    var query = """
      query getApresentacao(\$nome:String!,\$idade:String!,\$apresentacao:String!,\$classeId:Int!) {
        medicamentos(where: {nome: {_eq: \$nome}, idade: {_eq: \$idade}, apresentacao: {_eq: \$apresentacao}, classe_id: {_eq: \$classeId}}) {
          apresentacao
          dose_apresentacao
          dose_mg
          dose_ml
          dose_tempo
          fonte
          id
          idade
          nome
          nome_id
          nome_referencia
          observacao
          tipo_apresentacao
          dose_max
          idade
          dose_refe
        }
      }
    """;
    var doc = await _hasuraConnect.query(query, variables: {
      "nome": nome,
      "idade": idade,
      "apresentacao": apresentacao,
      "classeId": classeId
    });
    if (doc["data"]["medicamentos"].isEmpty) {
      print('vazio');
    } else {
      for (var document in doc["data"]["medicamentos"]) {
        controller.doseApresentacao = document["dose_apresentacao"];
        controller.dosemg = document["dose_mg"];
        controller.doseml = document["dose_ml"];
        controller.fonteMed = document["fonte"];
        controller.nomeSelecionado = document["nome"];
        controller.nomeReferencia = document["nome_referencia"];
        controller.tipoApresentacao = document["tipo_apresentacao"];
        controller.observacao = document["observacao"];
        controller.doseMax = document["dose_max"];
        controller.idadeString = document["idade"];
        controller.tempo = document["dose_tempo"];
        controller.doseReferencia = document["dose_refe"];
        controller.peso = peso;
        result = await controller.setMedicamento();
      }
    }
    return result;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
