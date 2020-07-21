// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserController on _UserControllerBase, Store {
  final _$firebaseAuthAtom = Atom(name: '_UserControllerBase.firebaseAuth');

  @override
  FirebaseAuth get firebaseAuth {
    _$firebaseAuthAtom.reportRead();
    return super.firebaseAuth;
  }

  @override
  set firebaseAuth(FirebaseAuth value) {
    _$firebaseAuthAtom.reportWrite(value, super.firebaseAuth, () {
      super.firebaseAuth = value;
    });
  }

  final _$logadoAtom = Atom(name: '_UserControllerBase.logado');

  @override
  bool get logado {
    _$logadoAtom.reportRead();
    return super.logado;
  }

  @override
  set logado(bool value) {
    _$logadoAtom.reportWrite(value, super.logado, () {
      super.logado = value;
    });
  }

  final _$currentUserAtom = Atom(name: '_UserControllerBase.currentUser');

  @override
  FirebaseUser get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(FirebaseUser value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  final _$uidAtom = Atom(name: '_UserControllerBase.uid');

  @override
  String get uid {
    _$uidAtom.reportRead();
    return super.uid;
  }

  @override
  set uid(String value) {
    _$uidAtom.reportWrite(value, super.uid, () {
      super.uid = value;
    });
  }

  final _$setUserAsyncAction = AsyncAction('_UserControllerBase.setUser');

  @override
  Future<bool> setUser() {
    return _$setUserAsyncAction.run(() => super.setUser());
  }

  final _$setUidAsyncAction = AsyncAction('_UserControllerBase.setUid');

  @override
  Future<String> setUid() {
    return _$setUidAsyncAction.run(() => super.setUid());
  }

  @override
  String toString() {
    return '''
firebaseAuth: ${firebaseAuth},
logado: ${logado},
currentUser: ${currentUser},
uid: ${uid}
    ''';
  }
}
