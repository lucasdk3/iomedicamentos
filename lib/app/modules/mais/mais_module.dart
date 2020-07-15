import 'mais_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';

class MaisModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MaisController()),
      ];

  @override
  List<Router> get routers => [];

  static Inject get to => Inject<MaisModule>.of();
}
