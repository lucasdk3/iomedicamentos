import 'package:flutter/material.dart';
import 'package:iomedicamentos/app/modules/home/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends WidgetModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
        ModularRouter('/', child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();

  @override
  Widget get view => HomePage();
}
