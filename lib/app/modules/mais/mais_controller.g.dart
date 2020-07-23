// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mais_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MaisController on _MaisControllerBase, Store {
  final _$listItensAtom = Atom(name: '_MaisControllerBase.listItens');

  @override
  List<MaisModel> get listItens {
    _$listItensAtom.reportRead();
    return super.listItens;
  }

  @override
  set listItens(List<MaisModel> value) {
    _$listItensAtom.reportWrite(value, super.listItens, () {
      super.listItens = value;
    });
  }

  final _$getRankingAsyncAction = AsyncAction('_MaisControllerBase.getRanking');

  @override
  Future<dynamic> getRanking() {
    return _$getRankingAsyncAction.run(() => super.getRanking());
  }

  final _$getRankingDBAsyncAction =
      AsyncAction('_MaisControllerBase.getRankingDB');

  @override
  Future<List<MaisModel>> getRankingDB(String userId) {
    return _$getRankingDBAsyncAction.run(() => super.getRankingDB(userId));
  }

  @override
  String toString() {
    return '''
listItens: ${listItens}
    ''';
  }
}
