import "package:flutter/material.dart";

class ResponsiveLeftBottomLayout extends StatelessWidget {
  var body;
  var secondary;
  Orientation orientation;
  ResponsiveLeftBottomLayout({
    body(Orientation orientation),
    secondary(Orientation orientation)
  }) {
    this.body = body;
    this.secondary = secondary;
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context,orientation) {
        this.orientation = orientation;
        if(useCompactLayout()) {
          //Schermo verticale, ritorno scaffold con bottomNavigation
          return Scaffold(
            body: body(orientation),
            bottomNavigationBar: BottomAppBar(
              child: secondary(orientation)
            ),
          );
        }
        else {
          return Scaffold(
            body: Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: secondary(orientation)
                ),
                Flexible(
                  flex: 3,
                  child: body(orientation)
                )
              ],
            )
          );
        }
      },
    );
  }

  bool useCompactLayout() {
    if(this.orientation == Orientation.portrait)
      return true;
    return false;
  }

}