import 'package:flutter_modular/flutter_modular.dart';
import 'package:iomedicamentos/app/modules/termos/termos_page.dart';

class TermosModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => TermosPage()),
      ];

  static Inject get to => Inject<TermosModule>.of();
}
