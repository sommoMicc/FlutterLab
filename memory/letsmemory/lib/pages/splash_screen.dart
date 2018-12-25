import 'package:flutter/material.dart';
import './../UI/theme.dart';
import './../UI/logo.dart';

import './home_page.dart';
import 'dart:async';

class SplashscreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  Timer(Duration(milliseconds: 1500), () => 
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext)=>LetsMemoryHomePage()))
  );

    // TODO: implement build
    return Material(
      color: LetsMemoryColors.primary,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LetsMemoryLogo(),
            Padding(padding: EdgeInsets.only(top: LetsMemoryDimensions.bigTitle / 2)),
            Text("Let's Memory!",
              style: TextStyle(
                color: LetsMemoryColors.textOnPrimary,
                fontSize: LetsMemoryDimensions.bigTitle,
                fontWeight: FontWeight.bold
              ),
            ),
            Padding(padding: EdgeInsets.only(top: LetsMemoryDimensions.bigTitle / 2)),
            CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(LetsMemoryColors.textOnPrimary),
            ),
          ]
        )
      )
    );
  }

}