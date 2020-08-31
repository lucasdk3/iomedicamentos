import 'package:firebase_auth/firebase_auth.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final HasuraConnect _hasuraConnect;
  final FirebaseAuth auth;

  _HomeControllerBase(this._hasuraConnect, this.auth);

  @observable
  String classe;

  @action
  changeClasse(String newClasse) => classe = newClasse;

  @observable
  int classeId;

  @action
  Future<int> setClasse(String classe) async {
    if (classe == 'Anestésico') {
      classeId = 1;
    } else if (classe == 'Profilaxia antibiótica') {
      classeId = 2;
    } else {
      classeId = 3;
    }
    return classeId;
  }

  @observable
  List<String> listNomes = [];

  @observable
  List<String> listApresentacoes = [];

  @observable
  List<int> listNomesId = [];

  @observable
  int doseApresentacao;

  @observable
  int dosemg;

  @observable
  double doseml;

  @observable
  String fonteMed;

  @observable
  String nomeSelecionado;

  @observable
  String nomeReferencia;

  @observable
  String tipoApresentacao;

  @observable
  String observacao;

  @observable
  int doseMax;

  @observable
  String idadeString;

  @observable
  double idade;

  @action
  Future<String> setIdade(String newIdade) async {
    idade = double.parse(newIdade);
    if (idade >= 16) {
      return idadeString = 'adulto';
    } else {
      return idadeString = 'criança';
    }
  }

  @observable
  int tempo;

  @observable
  double doseReferencia;

  @observable
  double peso;

  @action
  void setPeso(String newPeso) {
    peso = double.parse(newPeso);
  }

  @action
  Future<double> getPeso() async {
    if (peso == null) {
      return peso = (idade * 2) + 8;
    } else {
      return peso;
    }
  }

  @observable
  TextEditingController idadeController = TextEditingController();

  @observable
  TextEditingController pesoController = TextEditingController();

  @observable
  String apresentacaoSelecionada;

  @action
  Future<dynamic> getNomes(int classeId) async {
    listNomes.clear();
    listNomesId.clear();
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
          listNomes.add(nomes);
          listNomesId.add(nomeId);
        }
      }
    }
  }

  @action
  Future<List> getNomesSuggestions(String query) async {
    List<String> nomeSugestao = List();
    nomeSugestao.clear();
    nomeSugestao.addAll(listNomes);
    nomeSugestao
        .retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return nomeSugestao;
  }

  Future<dynamic> getApresentacao(
      String nome, String idade, int classeId) async {
    listApresentacoes.clear();
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
        listApresentacoes.add(apresentacoes);
      }
    }
  }

  @observable
  int nomeId;

  @observable
  int id;

  Future<String> getMedicamento(String nome, String idade, String apresentacao,
      double peso, int classeId) async {
    print(peso);
    listNomes.clear();
    listNomesId.clear();
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
        doseApresentacao = document["dose_apresentacao"];
        dosemg = document["dose_mg"];
        doseml = document["dose_ml"];
        fonteMed = document["fonte"];
        nomeSelecionado = document["nome"];
        nomeReferencia = document["nome_referencia"];
        tipoApresentacao = document["tipo_apresentacao"];
        observacao = document["observacao"];
        doseMax = document["dose_max"];
        idadeString = document["idade"];
        tempo = document["dose_tempo"];
        doseReferencia = document["dose_refe"];
        nomeId = document["nome_id"];
        id = document['id'];

        resultado = await setMedicamento(peso);

        var user = await auth.currentUser();
        var userId = user.uid;
        setRanking(id, userId);
      }
    }
    return resultado;
  }

  @action
  Future<List> getApresentacaoSuggestions(String query) async {
    List<String> apresentacaoSugestao = List();
    apresentacaoSugestao.clear();
    apresentacaoSugestao.addAll(listApresentacoes);
    apresentacaoSugestao
        .retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return apresentacaoSugestao;
  }

  @observable
  String resultado;

  @observable
  double dosagem;

  @observable
  double dose;

  @action
  Future<String> setMedicamento(double peso) async {
    if (tipoApresentacao == 'comprimido' || tipoApresentacao == 'capsula') {
      dosagem = dosemg / doseApresentacao;
      if (dosagem > 1) {
        if (tipoApresentacao == 'comprimido') {
          return resultado =
              'Para esse paciente é indicado $dosagem comprimidos, $observacao. Fonte: $fonteMed';
        } else {
          return resultado =
              'Para esse paciente é indicado $dosagem capsulas, $observacao. Fonte: $fonteMed';
        }
      } else {
        if (tipoApresentacao == 'comprimido') {
          return resultado =
              'Para esse paciente é indicado $dosagem comprimido, $observacao. Fonte: $fonteMed';
        } else {
          return resultado =
              'Para esse paciente é indicado $dosagem capsula, $observacao. Fonte: $fonteMed';
        }
      }
    } else if (tipoApresentacao == 'injetavel') {
      dose = doseApresentacao * peso;
      (dose >= doseMax)
          ? dosagem = (doseMax * doseml) / dosemg
          : dosagem = (dose * doseml) / dosemg;
      return resultado =
          'Para esse paciente é indicado uma injeção de $dosagem, $observacao. Fonte: $fonteMed';
    } else if (tipoApresentacao == 'suspensao') {
      dose = doseApresentacao * peso;
      (dose >= doseMax)
          ? dosagem = (doseMax / 1)
          : dosagem = (dose * doseml) / dosemg;
      return resultado =
          'Para esse paciente é indicado $dosagem ml, $observacao. Fonte: $fonteMed';
    } else if (tipoApresentacao == 'anestesico') {
      ((doseReferencia * peso) >= doseMax)
          ? dose = (doseMax / 1)
          : dose = (doseReferencia * peso);
      dosagem = dose / (doseApresentacao * 1.8);
      return resultado =
          'Para esse paciente é indicado $dosagem tubetes. Fonte: $fonteMed';
    } else if (tipoApresentacao == 'comprimido_m' ||
        tipoApresentacao == 'capsula_m' ||
        tipoApresentacao == 'dragea') {
      dosagem = dosemg / doseApresentacao;
      if (dosagem > 1) {
        if (tipoApresentacao == 'comprimido_m') {
          return resultado =
              'Para esse paciente é indicado $dosagem comprimidos, $observacao. Fonte: $fonteMed';
        } else if (tipoApresentacao == 'capsula_m') {
          return resultado =
              'Para esse paciente é indicado $dosagem capsulas, $observacao. Fonte: $fonteMed';
        } else {
          return resultado =
              'Para esse paciente é indicado $dosagem drageas, de $tempo em $tempo horas, $observacao. Fonte: $fonteMed';
        }
      } else {
        if (tipoApresentacao == 'comprimido_m') {
          return resultado =
              'Para esse paciente é indicado $dosagem comprimido, $observacao. Fonte: $fonteMed';
        } else if (tipoApresentacao == 'capsula_m') {
          return resultado =
              'Para esse paciente é indicado $dosagem capsula, $observacao. Fonte: $fonteMed';
        } else {
          return resultado =
              'Para esse paciente é indicado $dosagem dragea, de $tempo em $tempo horas, $observacao. Fonte: $fonteMed';
        }
      }
    } else if (tipoApresentacao == 'suspensao_m') {
      dose = doseReferencia * peso;
      dosagem = (dose * doseml) / dosemg / (24 / tempo);
      return resultado =
          'Para esse paciente é indicado $dosagem ml, de $tempo em $tempo horas, $observacao. Fonte: $fonteMed';
    } else if (tipoApresentacao == 'solucao_m') {
      (doseMax <= peso) ? dosagem = (doseMax / 1) : dosagem = peso;
      return resultado =
          'Para esse paciente é indicado $dosagem gotas, de $tempo em $tempo horas, $observacao. Fonte: $fonteMed';
    } else if (tipoApresentacao == 'elixir') {
      dose = doseReferencia * peso;
      dosagem = dose / (dosemg / doseml) / (24 / tempo);
      return resultado =
          'Para esse paciente é indicado $dosagem ml, de $tempo em $tempo horas, $observacao. Fonte: $fonteMed';
    }
    return resultado;
  }

  @action
  Future<dynamic> setRanking(int id, String userId) async {
    var query = """
      query setRanking(\$id:Int!,\$userId:String!){
        ranking(where: {medicamento_id: {_eq: \$id} , user_id: {_eq: \$userId}}) {
          quantidade
          user_id
          medicamento_id
          id
        }
      }
    """;
    var doc = await _hasuraConnect.query(query, variables: {
      "id": id,
      "userId": userId,
    });
    if (doc["data"]["ranking"].isEmpty) {
      print('vazio');
      setNewRanking(id, userId);
    } else {
      for (var document in doc["data"]["ranking"]) {
        int newId = document["id"];
        updateRanking(newId);
      }
    }
  }

  @action
  Future<dynamic> setNewRanking(int id, String userId) async {
    var query = """
      mutation setRanking(\$id:Int!,\$userId:String!){
        insert_ranking(objects: {quantidade: 1, medicamento_id: \$id, user_id: \$userId}) {
          returning {
            id
          }
        }
      }
    """;
    var doc = await _hasuraConnect.mutation(query, variables: {
      "id": id,
      "userId": userId,
    });
    return doc;
  }

  @action
  Future<dynamic> updateRanking(int id) async {
    var query = """
      mutation setRanking(\$id:Int!){
        update_ranking(where: {id: {_eq: \$id}}, _inc: {quantidade: 1}) {
          affected_rows
        }
      }
    """;
    var doc = await _hasuraConnect.mutation(query, variables: {
      "id": id,
    });
    return doc;
  }
}
