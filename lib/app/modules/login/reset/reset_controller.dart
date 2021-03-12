import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';

import '../../../utils/theme.dart';

part 'reset_controller.g.dart';

class ResetController = _ResetControllerBase with _$ResetController;

abstract class _ResetControllerBase with Store {
  @observable
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @observable
  String email;

  @action
  changeEmail(String newEmail) => email = newEmail;

  @observable
  bool box1 = true;

  @observable
  bool box2 = false;

  String validate() {
    if (email == null || !email.contains('@')) {
      return 'Email inválido';
    }
  }

  @computed
  bool get isValid {
    return validate() == null;
  }

  @observable
  FirebaseUser user;

  @action
  Future<FirebaseUser> reset(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);

      Fluttertoast.showToast(
          msg: 'Senha resetada com sucesso, verifique seu e-mail');
      Modular.to.pop();
    } catch (e) {
      Fluttertoast.showToast(msg: 'Email inválido', backgroundColor: primary);
      print(e);
      Fluttertoast.showToast(msg: e);
    }
    return user;
  }
}
