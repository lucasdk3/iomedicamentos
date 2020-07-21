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
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title, style: appBarText),
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [],
          ),
        ));
  }

  Widget textForm(
      {BuildContext context,
      TextEditingController controller,
      String validator,
      String hint,
      onChanged}) {
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
        border: OutlineInputBorder(),
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
                  padding: const EdgeInsets.all(16.0),
                  child: Observer(builder: (_) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: DropdownButton(
                        isExpanded: true,
                        underline: SizedBox(),
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
                        hint: Text('Escolha uma classe'),
                        value: controller.classe,
                      ),
                    );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Observer(builder: (_) {
                    return textForm(
                      context: context,
                      controller: controller.idadeController,
                      validator: 'Por favor, informe a idade do Paciente',
                      hint: 'Idade',
                      onChanged: controller.setIdade,
                    );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Observer(builder: (_) {
                    return textForm(
                      context: context,
                      controller: controller.pesoController,
                      validator: 'Por favor, informe o peso do Paciente',
                      hint: 'Peso',
                      onChanged: controller.setPeso,
                    );
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
                        border: OutlineInputBorder(),
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
                        border: OutlineInputBorder(),
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
    return Center(
      child: Stack(
        children: [
          Container(
            decoration: buttonDecoration,
            child: Visibility(
              visible: true,
              child: MaterialButton(
                onPressed: () async {
                  var resultado = await pesquisar();
                },
                highlightColor: Colors.transparent,
                splashColor: Colors.lightBlueAccent,
                //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 42.0),
                  child: Text(
                    "Agendar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<String> pesquisar() async {
    String resultado = await widget.prescricaoController.getMedicamentos(
        controller.nomeSelecionado,
        controller.idadeString,
        controller.apresentacaoSelecionada,
        controller.peso,
        controller.classeId);
    return resultado;
  }
}
