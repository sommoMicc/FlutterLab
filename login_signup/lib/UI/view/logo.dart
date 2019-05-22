import 'package:flutter/material.dart';

import 'package:tinycolor/tinycolor.dart';
import 'package:provider/provider.dart';
import 'dart:math';

import 'package:login_signup/model/state/app_state.dart';

import '../style.dart';
import 'game_card/card_face.dart';

class AppLogo extends StatefulWidget {

  static final double LEFT_ROTATION_VALUE = -0.174533;
  static final double RIGHT_ROTATION_VALUE = LEFT_ROTATION_VALUE * -1;

  final Matrix4 leftRotation = Matrix4.rotationZ(LEFT_ROTATION_VALUE);
  final Matrix4 rightRotation = Matrix4.rotationZ(RIGHT_ROTATION_VALUE);
  final Color yellow = const Color(0xFFFFC107);

  @override
  State<StatefulWidget> createState() {
    return AppLogoState();
  }
}

class AppLogoState extends State<AppLogo>  with SingleTickerProviderStateMixin {
  
  bool pressed;

  Animation<double> animation;
  AnimationController controller;

  bool reverseAnimation;

  double leftRotationValue;
  double rightRotationValue;

  double _cardSize, _fontSize;

  CurvedAnimation curve;
  void initState() {
    super.initState();
    reverseAnimation = false;

    leftRotationValue = AppLogo.LEFT_ROTATION_VALUE;
    rightRotationValue = AppLogo.RIGHT_ROTATION_VALUE;

    controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this
    );

    curve = CurvedAnimation(parent: controller, curve: Curves.bounceIn);

    animation = Tween(begin: -2*pi, end: 0.0)
      .animate(curve)
      ..addListener(() {
        setState(() {
          leftRotationValue = AppLogo.LEFT_ROTATION_VALUE + animation.value;
          rightRotationValue = -1*leftRotationValue;
        });
      });

    pressed = false;
  }

  void _onTapDown(TapDownDetails details) {
    setState(()  {
      pressed = true;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      pressed = false;
    });
  }

  void _onTapCancel() {
    this._onTapUp(null);
  }

  void _onTap() {
    if(!controller.isAnimating) {
      reverseAnimation ? controller.reverse() : controller.forward();
      reverseAnimation = !reverseAnimation;
    }
  }

  @override
  Widget build(BuildContext context) {
    final _Style s = _Style(Provider.of<AppState>(context).size);

    _cardSize = s.cardSide;
    _fontSize = s.fontSize;

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: _onTap,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _generateCard("L",Colors.red,leftRotationValue),
              _generateCard("E",Colors.orange,rightRotationValue),
              _generateCard("T",Colors.yellow,leftRotationValue),
              _generateCard("'",Colors.green,rightRotationValue),
              Padding(padding: EdgeInsets.only(left: _cardSize * 1 / 2)),
              _generateCard("S",Colors.indigo,leftRotationValue),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: s.d.scale(5,Measure.height))),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _generateCard("M",Colors.red,leftRotationValue),
              _generateCard("E",Colors.orange,rightRotationValue),
              _generateCard("M",Colors.yellow,leftRotationValue),
              _generateCard("O",Colors.green,rightRotationValue),
              _generateCard("R",Colors.indigo,leftRotationValue),
              _generateCard("Y",Colors.deepPurple,rightRotationValue),
            ],
          )
        ],
      )
    );
  }

  CardFace _generateCard(String letter, Color color, double rotationValue) {
    return CardFace(
      size: this._cardSize,
      fontSize: this._fontSize,
      text: letter,
      backgroundColor: color,
      textColor: Colors.white,
      rotation: Matrix4.rotationZ(rotationValue),
      pressed: pressed
    );
  }
}

class _Style {
  final CustomAppDimensions d;
  _Style(this.d);

  double get cardSide => d.percentage(100/7, d.minSide);
  double get fontSize => cardSide - d.scale(15, d.minSide);
}