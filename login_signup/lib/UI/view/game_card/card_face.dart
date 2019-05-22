import 'package:flutter/material.dart';
import 'package:login_signup/model/state/app_state.dart';
import 'package:provider/provider.dart';
import 'package:tinycolor/tinycolor.dart';

import '../../style.dart';

class CardFace extends StatelessWidget {
  final String text;
  final Color textColor;
  final Matrix4 rotation;

  final bool pressed, shadow;
  final Color backgroundColor, shadowColor;

  final double size, fontSize;

  CardFace({
    this.backgroundColor,
    this.shadowColor,
    this.text = "",
    this.textColor = Colors.white,
    this.shadow = true,
    this.rotation,
    this.pressed = false,
    this.size = 0,
    this.fontSize = 0
  });

  @override
  Widget build(BuildContext context) {
    Color background = this.backgroundColor ?? _Style.defaultBackgroundColor;

    Color gradientStart = TinyColor(background).spin(-10).darken(15).color;
    Color gradientEnd = TinyColor(background).lighten(30).color;

    Color shadow = this.shadowColor ?? TinyColor(gradientEnd).setAlpha(100).color;

    final CustomAppDimensions d = Provider.of<AppState>(context).size;
    //final _Style s = _Style(context);

    final List<BoxShadow> boxShadow = <BoxShadow> [
      BoxShadow(
        color: shadow,
        offset: Offset(0, 4.0),
        blurRadius: 0.0,
        spreadRadius: 0
      )
    ];

    final double actualSize = (size != 0) ? size : d.cardSide;
    return Transform(
      alignment: FractionalOffset.center, // set transform origin
      transform: this.rotation == null ? Matrix4.identity() : this.rotation,
      child: Container(
        constraints: BoxConstraints(
          minHeight: actualSize,
          minWidth: actualSize,
          maxHeight: actualSize,
          maxWidth: actualSize
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(d.radius),
          boxShadow: this.shadow ? boxShadow : [],
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.1, 0.5, 0.9],
            colors: [
              this.pressed ? shadow : gradientStart,
              this.pressed ? shadow : background,
              this.pressed ? shadow : gradientEnd
            ],
          ),
          //border: Border.all(color: this.textColor, width: LetsMemoryDimensions.cardBorder)
        ),
        child: Center(
          child: Text(this.text,
            style: TextStyle(
              fontSize: fontSize != 0 ? fontSize : d.cardFont,
              fontWeight: FontWeight.bold,
              color: this.textColor
            )
          ),
        )
      ),
    );
  }
}

class _Style {
  double cardSide;
  _Style(BuildContext context) {
    cardSide = MediaQuery.of(context).size.width / 4 - 10;
  }
  static final Color defaultBackgroundColor = Color(0xffffffff);
  static final Color defaultShadowColor = Color(0xffbbbbbb);

}