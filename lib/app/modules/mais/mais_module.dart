import 'package:flutter/src/widgets/framework.dart';
import 'package:iomedicamentos/app/modules/mais/mais_page.dart';
import 'mais_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MaisModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MaisController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => MaisPage()),
        Router('/', child: (_, args) => MaisPage()),
      ];

  static Inject get to => Inject<MaisModule>.of();

  @override
  Widget get view => MaisPage();
}
