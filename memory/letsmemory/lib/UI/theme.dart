import 'package:flutter/material.dart';

class LetsMemoryColors {
  LetsMemoryColors._(); //Per evitare che la classe venga istanziata

  static const Color primary = Colors.blue;
  static const Color primaryDark = Colors.blueAccent;
  static const Color primaryLight = Colors.lightBlue;

  static const Color textOnPrimary = Colors.white;

  static const Color secondary = Colors.orange;
  static const Color secondaryDark = Colors.orangeAccent;
  static const Color secondaryLight = Colors.deepOrange;
}

class LetsMemoryDimensions {
  static const double bigTitle = 50.0;

  static const double cardFont = 60.0;
  static const double standardCard = cardFont * 1.5;
  static const double cardRadius = standardCard / 3;
  static const double cardBorder = cardFont / 10;
}