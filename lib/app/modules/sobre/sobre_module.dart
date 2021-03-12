import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iomedicamentos/app/modules/login/login_module.dart';
import 'package:iomedicamentos/app/modules/sobre/sobre_page.dart';

class SobreModule extends WidgetModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => SobrePage()),
        ModularRouter('/', child: (_, args) => SobrePage()),
        ModularRouter('/login', module: LoginModule()),
      ];

  static Inject get to => Inject<SobreModule>.of();

  @override
  Widget get view => SobrePage();
}
