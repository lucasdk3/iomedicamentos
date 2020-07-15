import 'package:mobx/mobx.dart';

part 'reset_controller.g.dart';

class ResetController = _ResetControllerBase with _$ResetController;

abstract class _ResetControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
