// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ResetController on _ResetControllerBase, Store {
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??= Computed<bool>(() => super.isValid,
          name: '_ResetControllerBase.isValid'))
      .value;

  final _$firebaseAuthAtom = Atom(name: '_ResetControllerBase.firebaseAuth');

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

  final _$emailAtom = Atom(name: '_ResetControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$box1Atom = Atom(name: '_ResetControllerBase.box1');

  @override
  bool get box1 {
    _$box1Atom.reportRead();
    return super.box1;
  }

  @override
  set box1(bool value) {
    _$box1Atom.reportWrite(value, super.box1, () {
      super.box1 = value;
    });
  }

  final _$box2Atom = Atom(name: '_ResetControllerBase.box2');

  @override
  bool get box2 {
    _$box2Atom.reportRead();
    return super.box2;
  }

  @override
  set box2(bool value) {
    _$box2Atom.reportWrite(value, super.box2, () {
      super.box2 = value;
    });
  }

  final _$userAtom = Atom(name: '_ResetControllerBase.user');

  @override
  FirebaseUser get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(FirebaseUser value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$resetAsyncAction = AsyncAction('_ResetControllerBase.reset');

  @override
  Future<FirebaseUser> reset(String email) {
    return _$resetAsyncAction.run(() => super.reset(email));
  }

  final _$_ResetControllerBaseActionController =
      ActionController(name: '_ResetControllerBase');

  @override
  dynamic changeEmail(String newEmail) {
    final _$actionInfo = _$_ResetControllerBaseActionController.startAction(
        name: '_ResetControllerBase.changeEmail');
    try {
      return super.changeEmail(newEmail);
    } finally {
      _$_ResetControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
firebaseAuth: ${firebaseAuth},
email: ${email},
box1: ${box1},
box2: ${box2},
user: ${user},
isValid: ${isValid}
    ''';
  }
}
