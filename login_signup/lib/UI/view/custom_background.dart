import 'package:flutter/material.dart';
import 'package:login_signup/model/state/app_state.dart';
import 'package:login_signup/model/state/background_state.dart';
import 'package:provider/provider.dart';

import 'game_card/card_face.dart';

class CustomBackground extends StatelessWidget {

  final List<Widget> children;
  CustomBackground({this.children = const <Widget> []});

  @override
  Widget build(BuildContext context) {
    final s = Provider.of<AppState>(context).size;
    final BackgroundState bs = Provider.of<BackgroundState>(context);

    List<Widget> backgroundArts = <Widget>[];
    bs.backgroundCards.forEach((model) {
      backgroundArts.add(
        Positioned(
          child: CardFace(
            shadow: false,
            text: model.text,
            backgroundColor: model.background,
            textColor: Color(0x33ffffff),
            rotation: Matrix4.rotationZ(model.rotation),
          ),
          top: model.x * s.sizes[0] - s.cardSide * 0.5,
          left: model.y * s.sizes[1] - s.cardSide * 0.5,
        )
      );
    });



    backgroundArts.forEach((art)=> this.children.insert(0,art));

    return Material(
        color: Color(0xff002a6d),
        child: Stack(
            children: this.children
        )
    );
  }
}