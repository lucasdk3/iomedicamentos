import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iomedicamentos/app/utils/theme.dart';
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
        title: Text(widget.title, style: appBarText),
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(itemBuilder: null)),
    );
  }
}
