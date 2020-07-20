import 'package:mobx/mobx.dart';

part 'base_controller.g.dart';

class BaseController = _BaseControllerBase with _$BaseController;

abstract class _BaseControllerBase with Store {
  @observable
  int currentIndex = 0;

  @action
  void updateCurrentIndex(int index) => this.currentIndex = index;
}
