import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:iomedicamentos/app/modules/base/base_module.dart';
import 'package:iomedicamentos/app/modules/login/login_module.dart';
import 'package:iomedicamentos/app/modules/login/register/register_module.dart';
import 'package:iomedicamentos/app/modules/login/reset/reset_module.dart';
import 'package:iomedicamentos/app/modules/login/splash/splash_page.dart';
import 'package:iomedicamentos/app/utils/user_controller.dart';

class SplashModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => UserController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => SplashPage()),
        Router('/base', module: BaseModule()),
        Router('/login', module: LoginModule()),
        Router('/register', module: RegisterModule()),
        Router('/reset', module: ResetModule()),
      ];

  static Inject get to => Inject<SplashModule>.of();
}
