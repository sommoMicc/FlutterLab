import 'package:flutter/material.dart';
import './lets_memory_static_card.dart';
import './theme.dart';

class LetsMemoryLogo extends StatelessWidget {
  final LetsMemoryStaticCard lCard = LetsMemoryStaticCard(letter: "L",backgroundColor: Colors.limeAccent, textColor: Colors.black);
  final LetsMemoryStaticCard mCard = LetsMemoryStaticCard(letter: "M",backgroundColor: Colors.orange);
  final LetsMemoryStaticCard eCard = LetsMemoryStaticCard(letter: "E",backgroundColor: Colors.green);
  final LetsMemoryStaticCard m2Card = LetsMemoryStaticCard(letter: "M",backgroundColor: Colors.teal);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      alignment: Alignment.centerLeft,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: LetsMemoryDimensions.standardCard * 0.85, top: LetsMemoryDimensions.standardCard),
          child: lCard,
        ),
        Container(
          margin: EdgeInsets.only(right: LetsMemoryDimensions.standardCard),
          child: mCard,
        ),
        Container(
          margin: EdgeInsets.only(bottom: LetsMemoryDimensions.standardCard, left: LetsMemoryDimensions.standardCard * 0.85),
          child: eCard,
        ),
        Container(
          margin: EdgeInsets.only(left: LetsMemoryDimensions.standardCard * 1.75),
          child: m2Card,
        )
      ],
    );
  }

}