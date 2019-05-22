import 'package:flutter/material.dart';
import 'package:login_signup/model/state/app_state.dart';
import 'package:login_signup/model/state/background_state.dart';
import 'package:provider/provider.dart';

import 'game_card/card_face.dart';

class CustomBackground extends StatelessWidget {
  final List<Widget> children;
  CustomBackground({this.children = const <Widget>[]});

  @override
  Widget build(BuildContext context) {
    List<Widget> backgroundArts = <Widget>[
      Container(
        // Add box decoration
        decoration: BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.1, 0.9],
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              Color(0xff1A1562),
              Color(0xff6B00F9),
            ],
          ),
        ),
      )
    ];

    backgroundArts.forEach((art) => this.children.insert(0, art));

    return Stack(children: this.children);
  }
}
