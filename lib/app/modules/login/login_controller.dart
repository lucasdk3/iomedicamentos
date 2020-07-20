import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @observable
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @observable
  TextEditingController emailController = TextEditingController();

  @observable
  TextEditingController senhaController = TextEditingController();

  @observable
  String email;

  @action
  changeEmail(String newEmail) => email = newEmail;

  @observable
  String senha;

  @observable
  bool senhaObscure = true;

  @observable
  bool box1 = true;

  @observable
  bool box2 = false;

  @action
  changeSenha(String newSenha) => senha = newSenha;

  String validate() {
    if (email == null || !email.contains('@')) {
      return 'Email inválido';
    } else if (senha == null) {
      return 'Senha inválida';
    } else if (email == null && senha == null) {
      return 'Email e senha inválidos';
    } else if (senha.length < 6) {
      return 'A senha deve conter mais que 6 digitos';
    }
  }

  @computed
  bool get isValid {
    return validate() == null;
  }

  @action
  void logar(String email, String senha) async {
    try {
      FirebaseUser user = (await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: senha))
          .user;
      Fluttertoast.showToast(msg: 'Logado com sucesso');
      Modular.to.pushReplacementNamed('/login/base');
    } catch (e) {
      print(e);
      Fluttertoast.showToast(msg: e);
    }
  }
}
