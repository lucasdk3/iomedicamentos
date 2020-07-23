import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'user_controller.g.dart';

class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {
  @observable
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @observable
  bool logado = false;

  @observable
  FirebaseUser currentUser;

  @observable
  String uid;

  @action
  Future<bool> setUser() async {
    try {
      currentUser = await firebaseAuth.currentUser();
      if (currentUser == null) {
        logado = false;
      } else {
        logado = true;
      }
    } catch (e) {
      print(e);
    }
    return logado;
  }

  @action
  Future<String> setUid() async {
    try {
      currentUser = await firebaseAuth.currentUser();
      if (currentUser == null) {
        uid = currentUser.uid.toString();
      } else {
        uid = 'null';
      }
    } catch (e) {
      print(e);
    }
    return uid;
  }
}
