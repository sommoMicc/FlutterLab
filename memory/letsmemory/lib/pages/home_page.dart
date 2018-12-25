import 'package:flutter/material.dart';
import './../UI/theme.dart';
import './../UI/logo.dart';


class LetsMemoryHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: LetsMemoryColors.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  LetsMemoryLogo(),
                  Text("Let's Memory!"),
              ])
            ],
          )
        ],
      )
    );
  }
}