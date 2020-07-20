import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:iomedicamentos/app/modules/login/reset/reset_page.dart';

class ResetModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ResetPage()),
        Router('/', child: (_, args) => ResetPage()),
      ];

  static Inject get to => Inject<ResetModule>.of();
}
