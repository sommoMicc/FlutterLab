import 'package:flutter/material.dart';
import 'layout/responsive_left_bottom.dart';

class HomePageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLeftBottomLayout(
      body: (Orientation o) {
        return Column(
          children: <Widget>[
            Text("Ciao sono A"),
            Text("Ciao sono B")
          ],
        );
      },
      secondary: (Orientation orientation) {
        MediaQueryData mediaQueryData = MediaQuery.of(context);
        const double radius = 3;
        return Container(
          constraints: BoxConstraints(
            minHeight: orientation == Orientation.portrait ? 0 :
                mediaQueryData.size.height * 2 / 3,
            minWidth: orientation == Orientation.portrait ? 0 :
            mediaQueryData.size.height * 2 / 3,
          ),
          decoration: BoxDecoration(
            color: Colors.deepOrange,
            borderRadius: orientation == Orientation.portrait ?
              BorderRadius.only(
                  topLeft: const Radius.circular(radius),
                  topRight: const Radius.circular(radius)
              )
              :
              BorderRadius.all(const Radius.circular(radius))
          ),
          child: Row(
            children: <Widget>[
              Text("Ciao"),
              Text("Come va")
            ],
          ),
        );
      }
    );
  }

}