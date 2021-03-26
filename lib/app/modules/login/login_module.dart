import 'package:firebase_auth/firebase_auth.dart';
import 'package:iomedicamentos/app/modules/base/base_module.dart';
import 'package:iomedicamentos/app/modules/login/login_page.dart';
import 'package:iomedicamentos/app/modules/login/register/register_module.dart';
import 'package:iomedicamentos/app/modules/login/reset/reset_module.dart';
import 'package:iomedicamentos/app/modules/termos/termos_module.dart';

import 'reset/reset_controller.dart';
import 'register/register_controller.dart';
import 'login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => FirebaseAuth.instance),
        Bind((i) => ResetController()),
        Bind((i) => RegisterController()),
        Bind((i) => LoginController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => LoginPage()),
        ModularRouter('/', child: (_, args) => LoginPage()),
        ModularRouter('/base', module: BaseModule()),
        ModularRouter('/register', module: RegisterModule()),
        ModularRouter('/reset', module: ResetModule()),
        ModularRouter('/termos', module: TermosModule()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
