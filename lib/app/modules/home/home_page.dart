import 'package:combos/combos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iomedicamentos/app/modules/home/prescricao_controller.dart';
import 'package:iomedicamentos/app/utils/theme.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  final PrescricaoController prescricaoController;
  const HomePage({Key key, this.title = "Home", this.prescricaoController})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  GlobalKey _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title, style: appBarText),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
          children: [
            forms(),
            button(),
          ],
        ),
      ),
    );
  }

  Widget textForm(BuildContext context, TextEditingController controller,
      String validator, String hint, onChanged) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: (input) {
        if (input.isEmpty) {
          return validator;
        }
      },
      style: letraPreta,
      decoration: InputDecoration(
        hintText: hint,
      ),
    );
  }

  List<String> classes = [
    'Anestésico',
    'Profilaxia antibiótica',
    'Medicamentos'
  ];
  Widget forms() {
    return Form(
        key: _key,
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.7,
              maxWidth: 800),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Observer(builder: (_) {
                    return DropdownButton(
                      items: classes.map((String dropDowmStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDowmStringItem,
                          child: Text(dropDowmStringItem),
                        );
                      }).toList(),
                      onChanged: (String classeSelecionada) {
                        controller.classe = classeSelecionada;
                        controller.setClasse(classeSelecionada);
                        widget.prescricaoController
                            .getNomes(controller.classeId);
                      },
                      value: controller.classe,
                    );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Observer(builder: (_) {
                    return textForm(
                        context,
                        controller.idadeController,
                        'Por favor, informe a idade do Paciente',
                        'Idade', () async {
                      controller.setIdade(controller.idadeController.text);
                    });
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Observer(builder: (_) {
                    return textForm(
                        context,
                        controller.pesoController,
                        'Por favor, informe o peso do Paciente',
                        'Peso', () async {
                      controller.setPeso(controller.pesoController.text);
                    });
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Observer(builder: (_) {
                    return TypeaheadCombo<String>(
                      selected: controller.nomeSelecionado,
                      getList: (text) async {
                        return await controller.getNomesSuggestions(text);
                      },
                      itemBuilder:
                          (context, parameters, item, selected, text) =>
                              ListTile(title: Text(item ?? '<Empty>')),
                      onSelectedChanged: (item) async {
                        setState(() {
                          controller.nomeSelecionado = item;
                          widget.prescricaoController.getApresentacao(
                              controller.nomeSelecionado,
                              controller.idadeString,
                              controller.classeId);
                        });
                      },
                      getItemText: (item) => item,
                      decoration: const InputDecoration(
                        hintText: 'Medicamento',
                      ),
                    );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Observer(builder: (_) {
                    return TypeaheadCombo<String>(
                      selected: controller.apresentacaoSelecionada,
                      getList: (text) async {
                        return await controller
                            .getApresentacaoSuggestions(text);
                      },
                      itemBuilder:
                          (context, parameters, item, selected, text) =>
                              ListTile(title: Text(item ?? '<Empty>')),
                      onSelectedChanged: (item) async {
                        setState(() {
                          controller.apresentacaoSelecionada = item;
                        });
                      },
                      getItemText: (item) => item,
                      decoration: const InputDecoration(
                        hintText: 'Apresentação',
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
        ));
  }

  Widget button() {
    return MaterialButton(
      onPressed: () async {
        var resultado = await pesquisar();
      },
      highlightColor: Colors.transparent,
      splashColor: Colors.lightBlueAccent,
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
        child: Text(
          "Agendar",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }

  Future<String> pesquisar() async {
    await widget.prescricaoController.getMedicamentos(
        controller.nomeSelecionado,
        controller.idadeString,
        controller.apresentacaoSelecionada,
        controller.peso,
        controller.classeId);
  }
}
