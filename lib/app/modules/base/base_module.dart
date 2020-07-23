import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iomedicamentos/app/modules/base/base_controller.dart';
import 'package:iomedicamentos/app/modules/base/base_page.dart';
import 'package:iomedicamentos/app/modules/home/home_controller.dart';
import 'package:iomedicamentos/app/modules/mais/mais_controller.dart';
import 'package:iomedicamentos/app/utils/customHasuraConnect.dart';

class BaseModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => BaseController()),
        Bind((i) => CustomHasuraConnect.getConnect(i.get<FirebaseAuth>())),
        Bind((i) => FirebaseAuth.instance),
        Bind((i) => HomeController(
            CustomHasuraConnect.getConnect(i.get<FirebaseAuth>()),
            i.get<FirebaseAuth>())),
        Bind((i) => MaisController(
              CustomHasuraConnect.getConnect(i.get<FirebaseAuth>()),
              i.get<FirebaseAuth>(),
            )),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => BasePage()),
        Router('/', child: (_, args) => BasePage()),
      ];

  static Inject get to => Inject<BaseModule>.of();
}
