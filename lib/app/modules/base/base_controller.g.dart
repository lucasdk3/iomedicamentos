// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BaseController on _BaseControllerBase, Store {
  final _$currentIndexAtom = Atom(name: '_BaseControllerBase.currentIndex');

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  final _$nomeAtom = Atom(name: '_BaseControllerBase.nome');

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  final _$apresentacaoAtom = Atom(name: '_BaseControllerBase.apresentacao');

  @override
  String get apresentacao {
    _$apresentacaoAtom.reportRead();
    return super.apresentacao;
  }

  @override
  set apresentacao(String value) {
    _$apresentacaoAtom.reportWrite(value, super.apresentacao, () {
      super.apresentacao = value;
    });
  }

  final _$keyAtom = Atom(name: '_BaseControllerBase.key');

  @override
  GlobalKey<State<StatefulWidget>> get key {
    _$keyAtom.reportRead();
    return super.key;
  }

  @override
  set key(GlobalKey<State<StatefulWidget>> value) {
    _$keyAtom.reportWrite(value, super.key, () {
      super.key = value;
    });
  }

  final _$classeAtom = Atom(name: '_BaseControllerBase.classe');

  @override
  String get classe {
    _$classeAtom.reportRead();
    return super.classe;
  }

  @override
  set classe(String value) {
    _$classeAtom.reportWrite(value, super.classe, () {
      super.classe = value;
    });
  }

  final _$getClasseAsyncAction = AsyncAction('_BaseControllerBase.getClasse');

  @override
  Future<String> getClasse(int classeId) {
    return _$getClasseAsyncAction.run(() => super.getClasse(classeId));
  }

  final _$_BaseControllerBaseActionController =
      ActionController(name: '_BaseControllerBase');

  @override
  dynamic changeNome(String newNome) {
    final _$actionInfo = _$_BaseControllerBaseActionController.startAction(
        name: '_BaseControllerBase.changeNome');
    try {
      return super.changeNome(newNome);
    } finally {
      _$_BaseControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeAp(String newAp) {
    final _$actionInfo = _$_BaseControllerBaseActionController.startAction(
        name: '_BaseControllerBase.changeAp');
    try {
      return super.changeAp(newAp);
    } finally {
      _$_BaseControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateCurrentIndex(int index) {
    final _$actionInfo = _$_BaseControllerBaseActionController.startAction(
        name: '_BaseControllerBase.updateCurrentIndex');
    try {
      return super.updateCurrentIndex(index);
    } finally {
      _$_BaseControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex},
nome: ${nome},
apresentacao: ${apresentacao},
key: ${key},
classe: ${classe}
    ''';
  }
}
