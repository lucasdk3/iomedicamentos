import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iomedicamentos/app/utils/user_controller.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, UserController>
    with AfterLayoutMixin<SplashPage> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: screen(context));
  }

  void afterFirstLayout(BuildContext context) {
    bool logado = controller.logado;
    Future.delayed(Duration(seconds: 1)).then((_) {
      if (logado) {
        Modular.to.pushNamed('/base');
      } else {
        Modular.to.pushNamed('/login');
      }
    });
  }

  Widget screen(BuildContext context) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: new BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 200,
                  child: Image.asset('assets/logo.png'),
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Container(
                    child: Text(
                      'Seja bem vindo!',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                CircularProgressIndicator()
              ],
            ),
          )
        ]));
  }
}
