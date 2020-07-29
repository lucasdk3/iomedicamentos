import 'package:mobx/mobx.dart';

part 'autores_controller.g.dart';

class AutoresController = _AutoresControllerBase with _$AutoresController;

abstract class _AutoresControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
