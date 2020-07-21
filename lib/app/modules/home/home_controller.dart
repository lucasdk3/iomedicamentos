import 'package:iomedicamentos/app/modules/home/prescricao_controller.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final PrescricaoController prescricaoController;

  _HomeControllerBase(this.prescricaoController);

  @observable
  String classe;

  @action
  changeClasse(String newClasse) => classe = newClasse;

  @observable
  int classeId;

  @action
  Future<dynamic> getClasse(String classe) async {
    classe = classe;
    classeId = await setClasse(classe);
    prescricaoController.getNomes(classeId);
    return null;
  }

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
  void setIdade(String newIdade) {
    idade = double.parse(newIdade);
    if (idade >= 16) {
      idadeString = 'adulto';
    } else {
      idadeString = 'criança';
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
  Future<dynamic> getNomes(String classeId) {}

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
