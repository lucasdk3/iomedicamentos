// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterController on _RegisterControllerBase, Store {
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??= Computed<bool>(() => super.isValid,
          name: '_RegisterControllerBase.isValid'))
      .value;

  final _$firebaseAuthAtom = Atom(name: '_RegisterControllerBase.firebaseAuth');

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
      Atom(name: '_RegisterControllerBase.emailController');

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
      Atom(name: '_RegisterControllerBase.senhaController');

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

  final _$nomeControllerAtom =
      Atom(name: '_RegisterControllerBase.nomeController');

  @override
  TextEditingController get nomeController {
    _$nomeControllerAtom.reportRead();
    return super.nomeController;
  }

  @override
  set nomeController(TextEditingController value) {
    _$nomeControllerAtom.reportWrite(value, super.nomeController, () {
      super.nomeController = value;
    });
  }

  final _$emailAtom = Atom(name: '_RegisterControllerBase.email');

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

  final _$senhaAtom = Atom(name: '_RegisterControllerBase.senha');

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

  final _$nomeAtom = Atom(name: '_RegisterControllerBase.nome');

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

  final _$senhaObscureAtom = Atom(name: '_RegisterControllerBase.senhaObscure');

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

  final _$box1Atom = Atom(name: '_RegisterControllerBase.box1');

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

  final _$box2Atom = Atom(name: '_RegisterControllerBase.box2');

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

  final _$userAtom = Atom(name: '_RegisterControllerBase.user');

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

  final _$registerAsyncAction = AsyncAction('_RegisterControllerBase.register');

  @override
  Future<FirebaseUser> register(String nome, String email, String senha) {
    return _$registerAsyncAction.run(() => super.register(nome, email, senha));
  }

  final _$setUserAsyncAction = AsyncAction('_RegisterControllerBase.setUser');

  @override
  Future<dynamic> setUser(String email, String nome, String id) {
    return _$setUserAsyncAction.run(() => super.setUser(email, nome, id));
  }

  final _$_RegisterControllerBaseActionController =
      ActionController(name: '_RegisterControllerBase');

  @override
  dynamic changeEmail(String newEmail) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.changeEmail');
    try {
      return super.changeEmail(newEmail);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeNome(String newNome) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.changeNome');
    try {
      return super.changeNome(newNome);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeSenha(String newSenha) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.changeSenha');
    try {
      return super.changeSenha(newSenha);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
firebaseAuth: ${firebaseAuth},
emailController: ${emailController},
senhaController: ${senhaController},
nomeController: ${nomeController},
email: ${email},
senha: ${senha},
nome: ${nome},
senhaObscure: ${senhaObscure},
box1: ${box1},
box2: ${box2},
user: ${user},
isValid: ${isValid}
    ''';
  }
}
