import 'package:flutter/src/widgets/framework.dart';
import 'package:iomedicamentos/app/modules/home/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends WidgetModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
        Router('/', child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();

  @override
  Widget get view => HomePage();
}
