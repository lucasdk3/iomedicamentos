import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iomedicamentos/app/utils/theme.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'reset_controller.dart';

class ResetPage extends StatefulWidget {
  final String title;
  const ResetPage({Key key, this.title = "Reset"}) : super(key: key);

  @override
  _ResetPageState createState() => _ResetPageState();
}

class _ResetPageState extends ModularState<ResetPage, ResetController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              logo(),
              SizedBox(
                height: 40,
              ),
              Stack(
                children: [
                  forms(),
                  buttons(),
                ],
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ));
  }

  Widget logo() {
    return Container(
      height: 200,
      child: Image.asset('assets/logo.png'),
    );
  }

  Widget textForm(
      {BuildContext context,
      String hint,
      TextInputType tipo,
      bool obscure,
      IconData icon,
      IconData iconObscure,
      Widget iconButton,
      onChanged}) {
    return TextField(
      keyboardType: tipo,
      style: letraPreta,
      onChanged: onChanged,
      obscureText: obscure,
      decoration: InputDecoration(
        border: InputBorder.none,
        icon: Icon(
          icon,
          color: Colors.black,
          size: 17.0,
        ),
        hintText: hint,
        suffixIcon: iconButton,
        hintStyle: TextStyle(fontFamily: "WorkSansSemiBold", fontSize: 16.0),
      ),
    );
  }

  Widget forms() {
    return Center(
        child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 5.0,
                child: Container(
                    alignment: Alignment.center,
                    constraints: BoxConstraints(
                      maxWidth: 400,
                      minWidth: 200,
                      maxHeight: 120,
                      minHeight: 120,
                    ),
                    color: Colors.white,
                    child: Center(
                        child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20, top: 26),
                            child: Column(children: <Widget>[
                              Text('Informe seu Email'),
                              textForm(
                                context: context,
                                icon: LineAwesomeIcons.envelope,
                                obscure: false,
                                tipo: TextInputType.emailAddress,
                                hint: 'Email',
                                onChanged: controller.changeEmail,
                              ),
                            ])))))));
  }

  Widget buttons() {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Observer(builder: (_) {
            return Stack(
              children: [
                Visibility(visible: true, child: button()),
                Visibility(
                    visible: controller.box2,
                    child: CircularProgressIndicator()),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget button() {
    return Observer(builder: (_) {
      return Container(
        decoration: buttonDecoration,
        child: MaterialButton(
          onPressed: controller.isValid
              ? () {
                  controller.reset(controller.email);
                }
              : () {
                  Fluttertoast.showToast(msg: controller.validate());
                },
          highlightColor: Colors.transparent,
          splashColor: Colors.lightBlueAccent,
          //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
            child: Text(
              "Resetar",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
              ),
            ),
          ),
        ),
      );
    });
  }
}
