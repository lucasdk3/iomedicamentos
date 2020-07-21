// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??= Computed<bool>(() => super.isValid,
          name: '_LoginControllerBase.isValid'))
      .value;

  final _$firebaseAuthAtom = Atom(name: '_LoginControllerBase.firebaseAuth');

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

  final _$emailControllerAtom =
      Atom(name: '_LoginControllerBase.emailController');

  @override
  TextEditingController get emailController {
    _$emailControllerAtom.reportRead();
    return super.emailController;
  }

  @override
  set emailController(TextEditingController value) {
    _$emailControllerAtom.reportWrite(value, super.emailController, () {
      super.emailController = value;
    });
  }

  final _$senhaControllerAtom =
      Atom(name: '_LoginControllerBase.senhaController');

  @override
  TextEditingController get senhaController {
    _$senhaControllerAtom.reportRead();
    return super.senhaController;
  }

  @override
  set senhaController(TextEditingController value) {
    _$senhaControllerAtom.reportWrite(value, super.senhaController, () {
      super.senhaController = value;
    });
  }

  final _$emailAtom = Atom(name: '_LoginControllerBase.email');

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

  final _$senhaAtom = Atom(name: '_LoginControllerBase.senha');

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  final _$senhaObscureAtom = Atom(name: '_LoginControllerBase.senhaObscure');

  @override
  bool get senhaObscure {
    _$senhaObscureAtom.reportRead();
    return super.senhaObscure;
  }

  @override
  set senhaObscure(bool value) {
    _$senhaObscureAtom.reportWrite(value, super.senhaObscure, () {
      super.senhaObscure = value;
    });
  }

  final _$box1Atom = Atom(name: '_LoginControllerBase.box1');

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

  final _$box2Atom = Atom(name: '_LoginControllerBase.box2');

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

  final _$userAtom = Atom(name: '_LoginControllerBase.user');

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

  final _$logarAsyncAction = AsyncAction('_LoginControllerBase.logar');

  @override
  Future<FirebaseUser> logar(String email, String senha) {
    return _$logarAsyncAction.run(() => super.logar(email, senha));
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  dynamic changeEmail(String newEmail) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.changeEmail');
    try {
      return super.changeEmail(newEmail);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeSenha(String newSenha) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.changeSenha');
    try {
      return super.changeSenha(newSenha);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
firebaseAuth: ${firebaseAuth},
emailController: ${emailController},
senhaController: ${senhaController},
email: ${email},
senha: ${senha},
senhaObscure: ${senhaObscure},
box1: ${box1},
box2: ${box2},
user: ${user},
isValid: ${isValid}
    ''';
  }
}
