import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:iomedicamentos/app/modules/home/home_controller.dart';
import 'package:iomedicamentos/app/modules/home/home_page.dart';
import 'package:iomedicamentos/app/modules/home/prescricao_controller.dart';
import 'package:iomedicamentos/app/repositories/getApresentacao_repository.dart';
import 'package:iomedicamentos/app/repositories/getMedicamentos_repository.dart';
import 'package:iomedicamentos/app/repositories/getNomes_repository.dart';
import 'package:iomedicamentos/app/utils/customHasuraConnect.dart';

class BaseModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CustomHasuraConnect.getConnect(i.get<FirebaseAuth>())),
        Bind((i) => FirebaseAuth.instance),
        Bind((i) => HomeController()),
        Bind((i) => HomePage(
              prescricaoController: i.get<PrescricaoController>(),
            )),
        Bind((i) => PrescricaoController(
            i.get<GetApresentacaoRepository>(),
            i.get<GetMedicamentosRepository>(),
            i.get<GetNomesRepository>(),
            i.get<HomeController>())),
        Bind((i) => GetApresentacaoRepository(
            CustomHasuraConnect.getConnect(i.get<FirebaseAuth>()),
            i.get<HomeController>())),
        Bind((i) => GetMedicamentosRepository(
            CustomHasuraConnect.getConnect(i.get<FirebaseAuth>()),
            i.get<HomeController>())),
        Bind((i) => GetNomesRepository(
            CustomHasuraConnect.getConnect(i.get<FirebaseAuth>()),
            i.get<HomeController>())),
      ];

  @override
  List<Router> get routers => [];

  static Inject get to => Inject<BaseModule>.of();
}
