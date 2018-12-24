import 'package:flutter/material.dart';

import './theme.dart';

class LetsMemoryStaticCard extends StatelessWidget {
  final String letter;
  final Color backgroundColor;
  final Color textColor;
  
  LetsMemoryStaticCard({this.letter, this.backgroundColor, this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: LetsMemoryDimensions.standardCard,
      width: LetsMemoryDimensions.standardCard,
      decoration: BoxDecoration(
        color: this.backgroundColor,
        borderRadius: BorderRadius.circular(LetsMemoryDimensions.cardRadius),
        border: Border.all(color: this.textColor, width: LetsMemoryDimensions.cardBorder)
      ),
      child: Center(
        child: Text(this.letter,
          style: TextStyle(
            fontSize: LetsMemoryDimensions.cardFont,
            fontWeight: FontWeight.bold,
            color: this.textColor
          )
        ),
      )
    );
  }

}