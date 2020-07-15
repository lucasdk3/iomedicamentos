// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescricao_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PrescricaoController on _PrescricaoControllerBase, Store {
  final _$resultAtom = Atom(name: '_PrescricaoControllerBase.result');

  @override
  String get result {
    _$resultAtom.reportRead();
    return super.result;
  }

  @override
  set result(String value) {
    _$resultAtom.reportWrite(value, super.result, () {
      super.result = value;
    });
  }

  final _$getNomesAsyncAction =
      AsyncAction('_PrescricaoControllerBase.getNomes');

  @override
  Future<bool> getNomes(int classeId) {
    return _$getNomesAsyncAction.run(() => super.getNomes(classeId));
  }

  final _$getNomesSuggestionsAsyncAction =
      AsyncAction('_PrescricaoControllerBase.getNomesSuggestions');

  @override
  Future<List<dynamic>> getNomesSuggestions(String query) {
    return _$getNomesSuggestionsAsyncAction
        .run(() => super.getNomesSuggestions(query));
  }

  final _$getApresentacaoSuggestionsAsyncAction =
      AsyncAction('_PrescricaoControllerBase.getApresentacaoSuggestions');

  @override
  Future<List<dynamic>> getApresentacaoSuggestions(String query) {
    return _$getApresentacaoSuggestionsAsyncAction
        .run(() => super.getApresentacaoSuggestions(query));
  }

  final _$getApresentacaoAsyncAction =
      AsyncAction('_PrescricaoControllerBase.getApresentacao');

  @override
  Future<dynamic> getApresentacao(String nome, String idade, int classeId) {
    return _$getApresentacaoAsyncAction
        .run(() => super.getApresentacao(nome, idade, classeId));
  }

  final _$getMedicamentosAsyncAction =
      AsyncAction('_PrescricaoControllerBase.getMedicamentos');

  @override
  Future<String> getMedicamentos(String nome, String idade, String apresentacao,
      double peso, int classeId) {
    return _$getMedicamentosAsyncAction.run(
        () => super.getMedicamentos(nome, idade, apresentacao, peso, classeId));
  }

  @override
  String toString() {
    return '''
result: ${result}
    ''';
  }
}
