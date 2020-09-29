import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iomedicamentos/app/utils/theme.dart';
import 'login_controller.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              logo(),
              SizedBox(
                height: 40,
              ),
              Stack(
                children: [
                  forms(),
                  buttons(),
                ],
              ),
              buttons2(),
            ],
          ),
        ));
  }

  Widget logo() {
    return Column(
      children: [
        Container(
            height: 150,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Text('P',
                        style: TextStyle(fontSize: 142, color: Colors.black)),
                    Padding(
                      padding: const EdgeInsets.only(left: 46.0, top: 100),
                      child: Text('osolo ',
                          style: TextStyle(fontSize: 40, color: Colors.blue)),
                    ),
                  ],
                ),
                Text('G', style: TextStyle(fontSize: 142, color: Colors.black)),
                Text('uia', style: TextStyle(fontSize: 40, color: Colors.blue)),
              ],
            )),
        SizedBox(
          height: 20,
        ),
        Container(
            height: 50,
            child: Text('Odonto',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                    fontWeight: FontWeight.w700))),
      ],
    );
  }

  Widget textForm(
      {BuildContext context,
      String hint,
      TextInputType tipo,
      bool obscure,
      IconData icon,
      IconData iconObscure,
      Widget iconButton,
      onChanged}) {
    return TextField(
      keyboardType: tipo,
      style: letraPreta,
      onChanged: onChanged,
      obscureText: obscure,
      decoration: InputDecoration(
        border: InputBorder.none,
        icon: Icon(
          icon,
          color: Colors.black,
          size: 17.0,
        ),
        hintText: hint,
        suffixIcon: iconButton,
        hintStyle: TextStyle(fontFamily: "WorkSansSemiBold", fontSize: 16.0),
      ),
    );
  }

  Widget forms() {
    return Center(
        child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 5.0,
                child: Container(
                    alignment: Alignment.center,
                    constraints: BoxConstraints(
                      maxWidth: 400,
                      minWidth: 200,
                      maxHeight: 160,
                      minHeight: 100,
                    ),
                    color: Colors.white,
                    child: Center(
                        child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20, top: 26),
                            child: Column(children: <Widget>[
                              textForm(
                                context: context,
                                icon: LineAwesomeIcons.envelope,
                                obscure: false,
                                tipo: TextInputType.emailAddress,
                                hint: 'Email',
                                onChanged: controller.changeEmail,
                              ),
                              Container(
                                width: 250.0,
                                height: 1.0,
                                color: Colors.grey[400],
                              ),
                              Observer(builder: (_) {
                                return textForm(
                                    context: context,
                                    tipo: TextInputType.visiblePassword,
                                    hint: 'Senha',
                                    obscure: controller.senhaObscure,
                                    icon: LineAwesomeIcons.lock,
                                    iconButton: IconButton(
                                        icon: Icon(controller.senhaObscure
                                            ? LineAwesomeIcons.eye_slash
                                            : LineAwesomeIcons.eye),
                                        onPressed: () {
                                          controller.senhaObscure =
                                              !controller.senhaObscure;
                                        }),
                                    onChanged: controller.changeSenha);
                              }),
                            ])))))));
  }

  Widget buttons() {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 140,
          ),
          Observer(builder: (_) {
            return Stack(
              children: [
                Visibility(visible: true, child: button()),
                Visibility(
                    visible: controller.box2,
                    child: CircularProgressIndicator()),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget buttons2() {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
              child: FlatButton(
            onPressed: () {
              Modular.to.pushNamed('/login/reset');
            },
            child: Text('Esqueceu a senha?', style: letraPreta),
          )),
          SizedBox(
            height: 20,
          ),
          Container(
              child: FlatButton(
            onPressed: () {
              Modular.to.pushNamed('/login/register');
            },
            child: RichText(
              text: TextSpan(
                  text: 'Ainda não tem uma Conta?',
                  style: letraPreta,
                  children: <TextSpan>[
                    TextSpan(text: ' Clique aqui', style: letraAzul)
                  ]),
            ),
          )),
        ],
      ),
    );
  }

  Widget button() {
    return Observer(builder: (_) {
      return Container(
        decoration: buttonDecoration,
        child: MaterialButton(
          onPressed: controller.isValid
              ? () {
                  controller.logar(controller.email, controller.senha);
                }
              : () {
                  Fluttertoast.showToast(msg: controller.validate());
                },
          highlightColor: Colors.transparent,
          splashColor: Colors.lightBlueAccent,
          //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
            child: Text(
              "Entrar",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
              ),
            ),
          ),
        ),
      );
    });
  }
}
