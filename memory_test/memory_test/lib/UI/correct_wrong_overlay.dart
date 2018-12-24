import 'package:flutter/material.dart';
import 'dart:math';


class CorrectWrongOverlay extends StatefulWidget{
  final bool _isCorrect;
  final VoidCallback _onTap;

  CorrectWrongOverlay(this._isCorrect, this._onTap);

  @override
  State createState() => CorrectWrongOverlayState();
}

class CorrectWrongOverlayState extends State<CorrectWrongOverlay> with SingleTickerProviderStateMixin {
  Animation _iconAnimation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: Duration(seconds: 2), vsync: this);
    _iconAnimation = CurvedAnimation(parent: _animationController, curve: Curves.elasticOut);
    _iconAnimation.addListener(() => this.setState(()=>{}));
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) => 
    Material(
      color: Colors.black54, //Black with 54% opacity
      child: InkWell(
        onTap: () => widget._onTap(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              child: Transform.rotate(
                angle: _iconAnimation.value * 2 * pi,
                child: Icon(widget._isCorrect ? Icons.done : Icons.clear, size: 80.0 * _iconAnimation.value),
              ),
              decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            ),
            Padding(padding: EdgeInsets.only(bottom: 20.0)),
            new Text(widget._isCorrect ? "Correct" : "Wrong", style: TextStyle(color: Colors.white, fontSize: 30.0))
          ],
        ),
      )
    );
}