import 'package:iomedicamentos/app/modules/home/home_controller.dart';
import 'package:iomedicamentos/app/repositories/getApresentacao_repository.dart';
import 'package:iomedicamentos/app/repositories/getMedicamentos_repository.dart';
import 'package:iomedicamentos/app/repositories/getNomes_repository.dart';
import 'package:iomedicamentos/app/utils/user_controller.dart';
import 'package:mobx/mobx.dart';

part 'prescricao_controller.g.dart';

class PrescricaoController = _PrescricaoControllerBase
    with _$PrescricaoController;

abstract class _PrescricaoControllerBase with Store {
  var userController = UserController();
  var controller = HomeController();
  final GetApresentacaoRepository apresentacaoRepository;
  final GetMedicamentosRepository medicamentosRepository;
  final GetNomesRepository nomesRepository;

  _PrescricaoControllerBase(this.apresentacaoRepository,
      this.medicamentosRepository, this.nomesRepository);

  @action
  Future<bool> getNomes(int classeId) async {
    var resultN = await nomesRepository.getNomes(classeId);
    return resultN;
  }

  @action
  Future<List> getNomesSuggestions(String query) async {
    List<String> nomesSugestao = List();
    nomesSugestao.addAll(controller.listNomes);
    nomesSugestao
        .retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return nomesSugestao;
  }

  @action
  Future<List> getApresentacaoSuggestions(String query) async {
    List<String> apresentacaoSugestao = List();
    apresentacaoSugestao.addAll(controller.listApresentacoes);
    apresentacaoSugestao
        .retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return apresentacaoSugestao;
  }

  @action
  Future<dynamic> getApresentacao(
      String nome, String idade, int classeId) async {
    var resultA =
        await apresentacaoRepository.getApresentacao(nome, idade, classeId);
    return resultA;
  }

  @action
  Future<String> getMedicamentos(String nome, String idade, String apresentacao,
      double peso, int classeId) async {
    var result = await medicamentosRepository.getMedicamento(
        nome, idade, apresentacao, peso, classeId);
    return result;
  }

  @observable
  String result;
}
