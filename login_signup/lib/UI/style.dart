import 'package:flutter/cupertino.dart';
import 'package:vector_math/vector_math_64.dart';

enum Measure {
  height,
  width
}

class CustomAppDimensions {
  static final double referenceHeight = 683;
  static final double referenceWidth = 683;

  Orientation orientation;
  List<double> sizes;

  CustomAppDimensions({this.orientation,this.sizes});

  Measure get minSide {
    return orientation == Orientation.portrait ?
    Measure.width : Measure.height;
  }

  double get radius => scale(10,Measure.height);
  double get hPadding => orientation == Orientation.portrait ?
    scale(15,Measure.height) : scale(40,Measure.width);

  double get cardSide {
    //21% del lato minore
    return percentage(21,minSide);
  }
  double get cardFont => cardSide - scale(10,minSide);


  double scale(double n, Measure m) {
    if(sizes == null)
      return n;

    if(orientation == Orientation.portrait) {
      return (m == Measure.height) ?
        n * sizes[0] / referenceHeight :
        n * sizes[1] / referenceWidth;
    }

    return (m == Measure.height) ?
      n * sizes[1] / referenceWidth :
      n * sizes[0] / referenceHeight;
  }

  double percentage(double x, Measure m) {
    if(sizes == null)
      return x;

    return x * sizes[m.index] / 100.0;
  }
}

class CustomAppColors {
  static final Color background = Color(0xff002a6d); //Blu scuro
  static final Color darkBackground = Color(0xff001942);

  static final Color fontColor = Color(0xffffffff);
  static final Color secondaryFontColor = Color(0xffbbbbbb);

  static final Color border = Color(0xffffffff); //Grigetto
}