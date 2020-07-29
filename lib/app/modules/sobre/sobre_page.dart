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
                button1(),
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
        constraints: BoxConstraints(maxWidth: 300),
        child: MaterialButton(
            onPressed: () async {
              var auth = FirebaseAuth.instance;
              auth.signOut();
              Modular.to.popAndPushNamed('/login');
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

  Widget button1() {
    return Container(
        decoration: buttonDecoration,
        constraints: BoxConstraints(maxWidth: 300),
        child: MaterialButton(
            onPressed: () async {
              showAlertDialog1(context);
            },
            highlightColor: Colors.transparent,
            splashColor: Colors.lightBlueAccent,
            //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
              child: Text(
                "Ver Autores",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            )));
  }

  showAlertDialog1(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Modular.to.pop();
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("Autores", style: letraAzul),
      content: Column(
        children: <Widget>[
          Text(
            texto1,
            textAlign: TextAlign.justify,
            style: letraPreta2,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            texto2,
            textAlign: TextAlign.justify,
            style: letraPreta2,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            texto3,
            textAlign: TextAlign.justify,
            style: letraPreta2,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            texto4,
            textAlign: TextAlign.justify,
            style: letraPreta2,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            texto5,
            textAlign: TextAlign.justify,
            style: letraPreta2,
          ),
          SizedBox(
            height: 12,
          ),
        ],
      ),
      actions: [
        okButton,
      ],
    );
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }
}
