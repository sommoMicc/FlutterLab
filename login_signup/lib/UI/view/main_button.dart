import 'package:flutter/material.dart';
import 'package:login_signup/model/state/app_state.dart';
import 'package:provider/provider.dart';
import 'package:tinycolor/tinycolor.dart';
import 'dart:math' as math;

import '../style.dart';

class MainButton extends StatefulWidget {
  static final double leftRotation = - math.pi / 180;
  static final double rightRotation = 2 * math.pi - MainButton.leftRotation;

  final Color backgroundColor;

  final Widget child;
  final String text;

  const MainButton({
    this.backgroundColor,
    this.child,
    this.text
  });

  @override
  State<StatefulWidget> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  _Style s;

  @override
  Widget build(BuildContext context) {

    s = _Style(Provider.of<AppState>(context).size);

    List<Color> backgroundGradientColors = [
      TinyColor(widget.backgroundColor).spin(-10).darken(15).color,
      widget.backgroundColor,
      TinyColor(widget.backgroundColor).lighten(30).color,
    ];

    List<Color> shadowGradientColors = [
      TinyColor(widget.backgroundColor).lighten(30).color,
      TinyColor(widget.backgroundColor).spin(-10).darken(15).color,
    ];

    Widget child = widget.child;
    if(child == null)
      child = Text(widget.text, style: s.getTextStyle(color: Colors.white));

    return Stack(
      children: <Widget> [
        Transform(
          alignment: FractionalOffset.center, // set transform origin
          transform: Matrix4.rotationZ(MainButton.rightRotation),
          child: buildContainer(
              gradient: LinearGradient(
                colors: shadowGradientColors,
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                // Add one stop for each color. Stops should increase from 0 to 1
                stops: [0.1, 0.9],
              ),
              child: Opacity(
                  opacity: 0,
                  child: child
              )
          ),
        ),
        Transform(
          alignment: FractionalOffset.center, // set transform origin
          transform: Matrix4.rotationZ(MainButton.leftRotation),
          child: buildContainer(
            gradient: LinearGradient(
              colors: backgroundGradientColors,
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              // Add one stop for each color. Stops should increase from 0 to 1
              stops: [0.1, 0.5, 0.9],
            ),
            child: child
          ),
        ),
      ]
    );
  }

  Container buildContainer({Gradient gradient, Widget child}) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.all(Radius.circular(s.size.radius))
      ),
      child: Padding(
        padding: EdgeInsets.all(s.size.hPadding),
        child: child
      )
    );
  }
}

class _Style {
  final CustomAppDimensions size;
  _Style(this.size);

  Color get defaultBackground => Color(0xffff0000);
  TextStyle getTextStyle({Color color}) => TextStyle(
    fontWeight: FontWeight.bold,
    color: color,
    fontSize: size.scale(85, size.minSide)
  );
}