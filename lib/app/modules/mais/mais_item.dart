import 'package:flutter/material.dart';
import 'package:iomedicamentos/app/modules/base/base_controller.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:provider/provider.dart';

class MaisItem extends StatelessWidget {
  final String nome;
  final int quantidade;
  final String apresentacao;
  final int classeId;

  const MaisItem(
      {Key key,
      @required this.nome,
      @required this.quantidade,
      @required this.apresentacao,
      @required this.classeId})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<BaseController>(context);
    return Card(
      elevation: 2.0,
      child: ListTile(
        leading: CircleAvatar(
          radius: 24,
          backgroundColor: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '$quantidade',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              Text(
                'vezes',
                style: TextStyle(fontSize: 10, color: Colors.white),
              ),
            ],
          ),
        ),
        title: Text(nome),
        subtitle: Text(apresentacao),
        trailing: Row(
          mainAxisSize: MainAxisSize.min, // space between two icons
          children: <Widget>[
            Text(
              'usar',
              textAlign: TextAlign.center,
            ), // icon-1
            IconButton(
                icon: Icon(LineAwesomeIcons.arrow_circle_o_right),
                onPressed: () {
                  controller.currentIndex = 1;
                  controller.nome = nome;
                  controller.apresentacao = apresentacao;
                  controller.getClasse(classeId);
                }), // icon-2
          ],
        ),
      ),
    );
  }
}
