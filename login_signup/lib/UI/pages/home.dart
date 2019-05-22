import'package:flutter/material.dart';
import 'package:login_signup/UI/view/custom_background_alt.dart';
import 'package:login_signup/UI/view/custom_text_field.dart';
import 'package:login_signup/UI/view/main_button.dart';
import 'package:login_signup/UI/view/outlined_container.dart';
import 'package:login_signup/model/state/app_state.dart';
import 'package:provider/provider.dart';

import 'package:login_signup/UI/view/logo.dart';

import '../style.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final cs = _Style(appState.size);
    return CustomBackground(
      children: <Widget> [
        Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: cs.logoTopPadding,
                bottom: cs.logoBottomPadding
              ),
              child: AppLogo(),
            ),
            MainButton(
              text: "Singleplayer",
              backgroundColor: Colors.red
            )
          ],
        )
      ]
    );
  }
}

class _Style {
  final CustomAppDimensions size;
  _Style(this.size);

  double get inputSpace => size.scale(15,Measure.height);

  double get logoTopPadding => size.scale(50,Measure.height);
  double get logoBottomPadding => size.scale(70,Measure.height);
}