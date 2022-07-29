import 'package:flutter/services.dart';

import 'constants.dart';
import 'package:flutter/material.dart';

final ThemeData theme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  fontFamily: "Muli",
  appBarTheme: appBarTheme(),
  textTheme: textTheme(),
  inputDecorationTheme: inputDecorationTheme(),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

InputDecorationTheme inputDecorationTheme() {
  final outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: const BorderSide(color: kTextColor),
    gapPadding: 10,
  );

  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

TextTheme textTheme() {
  return const TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    // brightness: Brightness.light,
    systemOverlayStyle:
        SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(color: Color(0xFF8B8B8B), fontSize: 18),
  );
}
