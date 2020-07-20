import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:iomedicamentos/app/modules/login/register/register_page.dart';

class RegisterModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => RegisterPage()),
        Router('/', child: (_, args) => RegisterPage()),
      ];

  static Inject get to => Inject<RegisterModule>.of();
}
