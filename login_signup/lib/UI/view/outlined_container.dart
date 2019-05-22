import 'package:flutter/cupertino.dart';
import 'package:login_signup/model/state/app_state.dart';
import 'package:provider/provider.dart';

import '../style.dart';

class OutlinedContainer extends StatelessWidget {
  final Widget child;
  final Color backgroundColor, borderColor;

  OutlinedContainer({
    this.child,
    this.backgroundColor,
    this.borderColor
  });

  @override
  Widget build(BuildContext context) {
    final CustomAppDimensions d = Provider.of<AppState>(context).size;
    final cs = _Style(d);



    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(d.radius)),
        color: backgroundColor ?? CustomAppColors.darkBackground,
        boxShadow: [
          BoxShadow(
            color: Color(0xff000000),
            blurRadius: 10.0, // has the effect of softening the shadow
            spreadRadius: 5.0, // has the effect of extending the shadow
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(cs.externalPadding),
        child: Container(
          padding: EdgeInsets.all(d.hPadding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(d.radius)),
            border: Border.all(
              color: borderColor ?? CustomAppColors.accent.withOpacity(.3),
              style: BorderStyle.solid
            )
          ),
          child: child,
        ),
      )
    );
  }
}

class _Style {
  CustomAppDimensions size;
  _Style(this.size);

  double get externalPadding => size.hPadding * 1;
}