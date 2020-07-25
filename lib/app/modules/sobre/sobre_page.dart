import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iomedicamentos/app/utils/constants.dart';
import 'package:iomedicamentos/app/utils/theme.dart';
import 'sobre_controller.dart';

class SobrePage extends StatefulWidget {
  final String title;
  const SobrePage({Key key, this.title = "Sobre"}) : super(key: key);

  @override
  _SobrePageState createState() => _SobrePageState();
}

class _SobrePageState extends ModularState<SobrePage, SobreController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: appBarText),
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.8,
              maxWidth: 800,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  textSobre,
                  textAlign: TextAlign.justify,
                  style: letraPreta2,
                ),
                SizedBox(
                  height: 24,
                ),
                button(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget button() {
    return Container(
        decoration: buttonDecoration,
        child: MaterialButton(
            onPressed: () async {
              var auth = FirebaseAuth.instance;
              auth.signOut();
              Modular.to.pushNamed('/splash');
            },
            highlightColor: Colors.transparent,
            splashColor: Colors.lightBlueAccent,
            //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
              child: Text(
                "Deslogar",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            )));
  }
}
