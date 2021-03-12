import 'package:iomedicamentos/app/modules/login/splash/splash_module.dart';
import 'package:iomedicamentos/app/utils/user_controller.dart';
import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:iomedicamentos/app/app_widget.dart';
import 'modules/base/base_controller.dart';
import 'modules/sobre/sobre_controller.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => UserController()),
        Bind((i) => SobreController()),
        Bind((i) => BaseController()),
        Bind((i) => AppController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: SplashModule()),
        ModularRouter('/', module: SplashModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
