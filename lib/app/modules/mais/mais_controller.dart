import 'package:hasura_connect/hasura_connect.dart';
import 'package:mobx/mobx.dart';

part 'mais_controller.g.dart';

class MaisController = _MaisControllerBase with _$MaisController;

abstract class _MaisControllerBase with Store {
  final HasuraConnect _hasuraConnect;

  _MaisControllerBase(this._hasuraConnect);
}
