import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:iomedicamentos/app/modules/sobre/sobre_page.dart';

class SobreModule extends WidgetModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SobrePage()),
        Router('/', child: (_, args) => SobrePage()),
      ];

  static Inject get to => Inject<SobreModule>.of();

  @override
  Widget get view => SobrePage();
}
