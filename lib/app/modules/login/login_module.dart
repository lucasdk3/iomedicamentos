import 'package:firebase_auth/firebase_auth.dart';
import 'package:iomedicamentos/app/modules/base/base_module.dart';
import 'package:iomedicamentos/app/modules/login/login_page.dart';
import 'package:iomedicamentos/app/modules/login/register/register_module.dart';
import 'package:iomedicamentos/app/modules/login/reset/reset_module.dart';
import 'package:iomedicamentos/app/utils/customHasuraConnect.dart';

import 'reset/reset_controller.dart';
import 'register/register_controller.dart';
import 'login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => FirebaseAuth.instance),
        Bind((i) => CustomHasuraConnect.getConnect(i.get<FirebaseAuth>())),
        Bind((i) => ResetController()),
        Bind((i) => RegisterController(
            CustomHasuraConnect.getConnect(i.get<FirebaseAuth>()))),
        Bind((i) => LoginController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => LoginPage()),
        Router('/', child: (_, args) => LoginPage()),
        Router('/base', module: BaseModule()),
        Router('/register', module: RegisterModule()),
        Router('/reset', module: ResetModule()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
