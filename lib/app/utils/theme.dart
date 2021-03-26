import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primary = Color(0xff751d11);
TextStyle appBarText = GoogleFonts.poppins(fontSize: 24, color: primary);
TextStyle listTitleDefaultTextStyle =
    TextStyle(color: Colors.white, fontSize: 16.0);
TextStyle listTitleSelectedTextStyle =
    TextStyle(color: Colors.white, fontSize: 16.0);

TextStyle letraBranca =
    GoogleFonts.poppins(fontSize: 16.0, color: Colors.white);
TextStyle letraAzul = GoogleFonts.poppins(fontSize: 16.0, color: primary);
TextStyle letraAzul2 = GoogleFonts.poppins(fontSize: 24.0, color: primary);
TextStyle letraPreta = GoogleFonts.poppins(fontSize: 16.0, color: Colors.black);
TextStyle letraPreta2 = GoogleFonts.poppins(
    fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.bold);
TextStyle letraPreta3 = GoogleFonts.poppins(
    fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.w400);
TextStyle letraPreta4 = GoogleFonts.poppins(
    fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.w400);
Color selectedColor = Colors.white;
Color drawerBackgroundColor = Colors.white10;

BoxDecoration buttonDecoration = new BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(5.0)),
  boxShadow: <BoxShadow>[
    BoxShadow(
      color: primary,
      offset: Offset(1.0, 6.0),
      blurRadius: 20.0,
    ),
    BoxShadow(
      color: primary,
      offset: Offset(1.0, 6.0),
      blurRadius: 20.0,
    ),
  ],
  gradient: new LinearGradient(
      colors: [primary, primary],
      begin: const FractionalOffset(0.2, 0.2),
      end: const FractionalOffset(1.0, 1.0),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp),
);

ThemeData buildDarkTheme() {
  final ThemeData base = ThemeData();
  return base.copyWith(
    primaryColor: Color(0xff751d11),
    textTheme: GoogleFonts.poppinsTextTheme(),
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
    ),
    iconTheme: IconThemeData(color: Colors.white),
    accentColor: Colors.teal[500],
    buttonColor: Colors.teal[500],
    hintColor: Colors.white,
  );
}

ThemeData buildLightTheme() {
  final ThemeData base = ThemeData();
  return base.copyWith(
    primaryColor: Color(0xff751d11),
    textTheme: GoogleFonts.poppinsTextTheme(),
    iconTheme: IconThemeData(color: Colors.white),
    accentColor: Color(0xff751d11),
    buttonColor: Color(0xff751d11),
    hintColor: Colors.black,
  );
}
