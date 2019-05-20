import 'package:flutter/material.dart';
import 'package:login_signup/model/state/app_state.dart';
import 'package:provider/provider.dart';

import '../../style.dart';

class CardFace extends StatelessWidget {
  final String text;
  final Color textColor;
  final Matrix4 rotation;

  final bool pressed, shadow;
  final Color backgroundColor, shadowColor;

  CardFace({
    this.backgroundColor,
    this.shadowColor,
    this.text = "",
    this.textColor = Colors.white,
    this.shadow = true,
    this.rotation,
    this.pressed = false
  });

  @override
  Widget build(BuildContext context) {
    //Così posso fare un override semplice dei colori senza violare la regola
    //che tutti i campi di uno StatelessWidget devono essere final
    //L'espressione "a = b ?? c" equivale a "a = (b == null) ? c : b"
    Color background = this.backgroundColor ?? _Style.defaultBackgroundColor;
    Color shadow = this.shadowColor ?? _Style.defaultShadowColor;

    final CustomAppDimensions d = Provider.of<AppState>(context).size;

    final List<BoxShadow> boxShadow = <BoxShadow> [
      BoxShadow(
        color: shadow,
        offset: Offset(0, 4.0),
        blurRadius: 0.0,
        spreadRadius: 0
      )
    ];


    return Transform(
      alignment: FractionalOffset.center, // set transform origin
      transform: this.rotation == null ? Matrix4.identity() : this.rotation,
      child: Container(
        constraints: new BoxConstraints(
          minHeight: d.cardSide,
          minWidth: d.cardSide,
        ),
        decoration: BoxDecoration(
          color: this.pressed ?
            shadow : background,
          borderRadius: BorderRadius.circular(d.radius),
          boxShadow: this.shadow ? boxShadow : []
          //border: Border.all(color: this.textColor, width: LetsMemoryDimensions.cardBorder)
        ),
        child: Center(
          child: Text(this.text,
            style: TextStyle(
              fontSize: d.cardFont,
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
  static final Color defaultBackgroundColor = Color(0xffffffff);
  static final Color defaultShadowColor = Color(0xffbbbbbb);

}