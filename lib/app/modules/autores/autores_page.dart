import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iomedicamentos/app/utils/constants.dart';
import 'package:iomedicamentos/app/utils/theme.dart';
import 'autores_controller.dart';

class AutoresPage extends StatefulWidget {
  final String title;
  const AutoresPage({Key key, this.title = "Autores"}) : super(key: key);

  @override
  _AutoresPageState createState() => _AutoresPageState();
}

class _AutoresPageState extends ModularState<AutoresPage, AutoresController> {
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
