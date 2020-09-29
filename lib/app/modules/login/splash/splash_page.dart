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
                logo(),
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
}
