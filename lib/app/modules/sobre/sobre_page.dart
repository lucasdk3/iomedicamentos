import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
