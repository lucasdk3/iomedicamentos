import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'mais_controller.dart';

class MaisPage extends StatefulWidget {
  final String title;
  const MaisPage({Key key, this.title = "Mais"}) : super(key: key);

  @override
  _MaisPageState createState() => _MaisPageState();
}

class _MaisPageState extends ModularState<MaisPage, MaisController> {
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
