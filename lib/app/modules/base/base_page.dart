import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iomedicamentos/app/modules/home/home_module.dart';
import 'package:iomedicamentos/app/modules/mais/mais_module.dart';
import 'package:iomedicamentos/app/modules/sobre/sobre_module.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'base_controller.dart';

class BasePage extends StatefulWidget {
  final String title;
  const BasePage({Key key, this.title = "Base"}) : super(key: key);

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends ModularState<BasePage, BaseController> {
  //use 'controller' variable to access controller
  List widgetOptions = [MaisModule(), HomeModule(), SobreModule()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        return widgetOptions.elementAt(controller.currentIndex);
      }),
      bottomNavigationBar: bottomNav(),
    );
  }

  Widget bottomNav() {
    return Observer(builder: (_) {
      return BottomNavigationBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          currentIndex: controller.currentIndex,
          onTap: (value) => controller.updateCurrentIndex(value),
          selectedItemColor: Colors.blue,
          items: [
            BottomNavigationBarItem(
                icon: Icon(LineAwesomeIcons.trophy),
                title: Text('Mais pesquisados')),
            BottomNavigationBarItem(
                icon: Icon(LineAwesomeIcons.home), title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(LineAwesomeIcons.paste), title: Text('Sobre'))
          ]);
    });
  }
}
