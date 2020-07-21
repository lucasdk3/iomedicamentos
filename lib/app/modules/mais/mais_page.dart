import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iomedicamentos/app/utils/theme.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
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
          child: ListView.builder(itemBuilder: (_, index) {
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                elevation: 2.0,
                child: Container(
                  height: 40,
                  child: ListTile(
                    title: Text('nome', style: letraPreta),
                    leading: Center(
                      child: CircleAvatar(
                        radius: 24,
                        child: Column(
                          children: <Widget>[
                            Text(
                              'quantidade',
                              style: TextStyle(fontSize: 24),
                            ),
                            Text('vezes', style: TextStyle(fontSize: 10)),
                          ],
                        ),
                      ),
                    ),
                    subtitle: Text('apresentação', style: letraPreta),
                    trailing: Container(
                      height: 38,
                      child: Row(
                        children: <Widget>[
                          Text('usar'),
                          IconButton(
                              icon: Icon(LineAwesomeIcons.arrow_circle_o_right),
                              onPressed: () {})
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          })),
    );
  }
}
