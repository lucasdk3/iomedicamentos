import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  String classe;

  @action
  changeClasse(String newClasse) => classe = newClasse;

  @observable
  int classeId;

  @action
  void setClasse(classe) {
    if (classe == 'Anestésico') {
      classeId = 1;
    } else if (classe == 'Profilaxia antibiótica') {
      classeId = 2;
    } else {
      classeId = 3;
    }
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
  int tempo;

  @observable
  double doseReferencia;

  @observable
  double peso;

  @observable
  TextEditingController idadeController = TextEditingController();

  @observable
  TextEditingController pesoController = TextEditingController();

  @observable
  String apresentacaoSelecionada;

  @action
  Future<List> getNomesSuggestions(String query) async {
    List<String> consultasSugestao = List();
    consultasSugestao.addAll(listNomes);
    consultasSugestao
        .retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return consultasSugestao;
  }

  @action
  Future<List> getApresentacaoSuggestions(String query) async {
    List<String> consultasSugestao = List();
    consultasSugestao.addAll(listApresentacoes);
    consultasSugestao
        .retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return consultasSugestao;
  }

  @action
  Future<String> setMedicamento() {}
}
