import 'constants.dart';
import 'package:flutter/material.dart';

final ThemeData theme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  fontFamily: "Muli",
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
