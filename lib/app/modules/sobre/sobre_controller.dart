import 'package:mobx/mobx.dart';

part 'sobre_controller.g.dart';

class SobreController = _SobreControllerBase with _$SobreController;

abstract class _SobreControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
