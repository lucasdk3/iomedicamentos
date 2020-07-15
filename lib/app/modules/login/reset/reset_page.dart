import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'reset_controller.dart';

class ResetPage extends StatefulWidget {
  final String title;
  const ResetPage({Key key, this.title = "Reset"}) : super(key: key);

  @override
  _ResetPageState createState() => _ResetPageState();
}

class _ResetPageState extends ModularState<ResetPage, ResetController> {
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
