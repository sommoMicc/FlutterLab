import 'package:flutter/cupertino.dart';
import 'package:login_signup/model/pojo/background_card_model.dart';
import 'dart:math' as math;


class BackgroundState with ChangeNotifier {
  List<BackgroundCardModel> backgroundCards;

  BackgroundState({BuildContext context}) :
        backgroundCards = <BackgroundCardModel>[] {

    //final CustomAppDimensions s = Provider.of<AppState>(context).size;


    var random = math.Random();
    for(int i=0;i<60;i++) {
      Color c = Color((random.nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(
          0.9);

      double x = random.nextDouble();
      double y = random.nextDouble();

      String letter = String.fromCharCodes(
          List.generate(1,(index) => random.nextInt(33)+89)
      );

      double rotation = random.nextDouble() * 5/6 * math.pi;

      backgroundCards.add(
        BackgroundCardModel(
          background: c,
          x: x,
          y: y,
          text: letter.toUpperCase(),
          rotation: rotation
        )
      );
    }

  }
}