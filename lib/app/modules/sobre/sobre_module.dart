import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iomedicamentos/app/modules/login/login_module.dart';
import 'package:iomedicamentos/app/modules/sobre/sobre_page.dart';

class SobreModule extends WidgetModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SobrePage()),
        Router('/', child: (_, args) => SobrePage()),
        Router('/login', module: LoginModule()),
      ];

  static Inject get to => Inject<SobreModule>.of();

  @override
  Widget get view => SobrePage();
}
