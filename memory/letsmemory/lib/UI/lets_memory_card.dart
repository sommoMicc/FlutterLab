import 'package:flutter/material.dart';

import './theme.dart';

class LetsMemoryCard extends StatefulWidget {
  final String letter;
  final Color backgroundColor;
  final Color textColor;
  
  final VoidCallback onTapCallback;

  LetsMemoryCard({this.letter, this.backgroundColor, this.textColor = Colors.white, this.onTapCallback});

  @override
  State<StatefulWidget> createState() {
    return LetsMemoryCardState();
  }
}

class LetsMemoryCardState extends State<LetsMemoryCard> {
  bool covered;
  bool tapable;

  @override
  void initState() {
    this.covered = true;
    this.tapable = false;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: LetsMemoryDimensions.standardCard,
      width: LetsMemoryDimensions.standardCard,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(LetsMemoryDimensions.cardRadius),
        border: Border.all(color: widget.textColor, width: LetsMemoryDimensions.cardBorder)
      ),
      child: Center(
        child: Text(widget.letter,
          style: TextStyle(
            fontSize: LetsMemoryDimensions.cardFont,
            fontWeight: FontWeight.bold,
            color: widget.textColor
          )
        ),
      )
    );
  }
}
