import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'base_controller.g.dart';

class BaseController = _BaseControllerBase with _$BaseController;

abstract class _BaseControllerBase with Store {
  @observable
  int currentIndex = 0;

  @observable
  String nome;

  @observable
  String apresentacao;

  @observable
  GlobalKey key = GlobalKey<FormState>();

  @observable
  String classe;

  @action
  changeNome(String newNome) => nome = newNome;

  @action
  changeAp(String newAp) => apresentacao = newAp;

  @action
  Future<String> getClasse(int classeId) async {
    if (classeId == 1) {
      return classe = 'Anestésico';
    } else if (classeId == 2) {
      return classe = 'Profilaxia antibiótica';
    } else if (classeId == 3) {
      return classe = 'Medicamentos';
    }
    return classe;
  }

  @action
  void updateCurrentIndex(int index) => this.currentIndex = index;
}
