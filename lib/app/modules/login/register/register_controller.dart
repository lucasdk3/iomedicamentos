import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:mobx/mobx.dart';

import '../../../utils/theme.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  HasuraConnect connect =
      HasuraConnect('https://iomedicamentos.herokuapp.com/v1/graphql');

  @observable
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @observable
  TextEditingController emailController = TextEditingController();

  @observable
  TextEditingController senhaController = TextEditingController();

  @observable
  TextEditingController nomeController = TextEditingController();

  @observable
  String email;

  @action
  changeEmail(String newEmail) => email = newEmail;

  @observable
  String senha;

  @observable
  String nome;

  @action
  changeNome(String newNome) => nome = newNome;

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
    } else if (nome == null) {
      return 'Nome inválido';
    }
  }

  @computed
  bool get isValid {
    return validate() == null;
  }

  @observable
  FirebaseUser user;

  @action
  Future<FirebaseUser> register(String nome, String email, String senha) async {
    try {
      user = (await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: senha))
          .user;

      Fluttertoast.showToast(msg: 'Registrado com sucesso');
      setUser(email, nome, user.uid);
      Modular.to.pop();
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'Email ou senha inválidos', backgroundColor: primary);
      print(e);
      Fluttertoast.showToast(msg: e);
    }
    return user;
  }

  @action
  Future<dynamic> setUser(String email, String nome, String id) async {
    var query = """
      mutation setRanking(\$email:String!,\$nome:String!,\$id:String!){
        insert_users(objects: {email: \$email, nome: \$nome, id: \$id}) {
          returning {
            created_at
          }
        }
      }
    """;
    var doc = await connect.mutation(query, variables: {
      "email": email,
      "nome": nome,
      "id": id,
    });
    return doc;
  }
}
