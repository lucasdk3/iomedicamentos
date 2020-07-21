import 'package:hasura_connect/hasura_connect.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final HasuraConnect _hasuraConnect;

  _HomeControllerBase(this._hasuraConnect);

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
  double doseApresentacao;

  @observable
  double dosemg;

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
  String doseMax;

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
    List<String> consultasSugestao = List();
    consultasSugestao.addAll(listNomes);
    consultasSugestao
        .retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return consultasSugestao;
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

  Future<String> getMedicamento(String nome, String idade, String apresentacao,
      double peso, int classeId) async {
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
        peso = peso;
        resultado = await setMedicamento();
      }
    }
    return resultado;
  }

  @action
  Future<List> getApresentacaoSuggestions(String query) async {
    List<String> apresentacaoSugestao = List();
    apresentacaoSugestao.addAll(listApresentacoes);
    apresentacaoSugestao
        .retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return apresentacaoSugestao;
  }

  @observable
  String resultado;

  @observable
  double dosagem;

  @action
  Future<String> setMedicamento() async {
    if (tipoApresentacao == 'comprimido' ||
        tipoApresentacao == 'capsula' ||
        tipoApresentacao == 'comprimido_m' ||
        tipoApresentacao == 'capsula_m') {
      dosagem = dosemg / doseApresentacao;
      if (dosagem > 1) {
        return resultado =
            'Para esse paciente é indicado $dosagem doses de $tempo em $tempo. fonte: $fonteMed';
      } else {
        return resultado =
            'Para esse paciente é indicado $dosagem dose de $tempo em $tempo. fonte: $fonteMed';
      }
    }
    return resultado;
  }
}
