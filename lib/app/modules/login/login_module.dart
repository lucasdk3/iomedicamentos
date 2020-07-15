import 'splash/splash_controller.dart';
import 'reset/reset_controller.dart';
import 'register/register_controller.dart';
import 'login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SplashController()),
        Bind((i) => ResetController()),
        Bind((i) => RegisterController()),
        Bind((i) => LoginController()),
      ];

  @override
  List<Router> get routers => [];

  static Inject get to => Inject<LoginModule>.of();
}
