import 'package:flutter/material.dart';

Color primary = Colors.blue;
TextStyle appBarText = TextStyle(fontSize: 24, color: primary);
TextStyle listTitleDefaultTextStyle =
    TextStyle(color: Colors.white, fontSize: 16.0);
TextStyle listTitleSelectedTextStyle =
    TextStyle(color: Colors.white, fontSize: 16.0);
TextStyle letraBranca = TextStyle(
    fontFamily: "WorkSansSemiBold", fontSize: 16.0, color: Colors.white);
TextStyle letraAzul = TextStyle(
    fontFamily: "WorkSansSemiBold", fontSize: 16.0, color: Colors.blue);
TextStyle letraPreta = TextStyle(
    fontFamily: "WorkSansSemiBold", fontSize: 16.0, color: Colors.black);
Color selectedColor = Colors.white;
Color drawerBackgroundColor = Colors.white10;
BoxDecoration buttonDecoration = new BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(5.0)),
  boxShadow: <BoxShadow>[
    BoxShadow(
      color: Colors.lightBlueAccent,
      offset: Offset(1.0, 6.0),
      blurRadius: 20.0,
    ),
    BoxShadow(
      color: Colors.blue,
      offset: Offset(1.0, 6.0),
      blurRadius: 20.0,
    ),
  ],
  gradient: new LinearGradient(
      colors: [Colors.lightBlueAccent, Colors.blue],
      begin: const FractionalOffset(0.2, 0.2),
      end: const FractionalOffset(1.0, 1.0),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp),
);
