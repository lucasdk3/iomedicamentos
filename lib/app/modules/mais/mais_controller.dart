import 'package:mobx/mobx.dart';

part 'mais_controller.g.dart';

class MaisController = _MaisControllerBase with _$MaisController;

abstract class _MaisControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
