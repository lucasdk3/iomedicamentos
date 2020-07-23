import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iomedicamentos/app/modules/mais/mais_item.dart';
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
      body: Observer(builder: (_) {
        return ListView.builder(
            itemCount: controller.listItens.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaisItem(
                  nome: controller.listItens[index].medicamento.nome,
                  apresentacao:
                      controller.listItens[index].medicamento.apresentacao,
                  classeId: controller.listItens[index].medicamento.classeId,
                  quantidade: controller.listItens[index].quantidade,
                ),
              );
            });
      }),
    );
  }
}
