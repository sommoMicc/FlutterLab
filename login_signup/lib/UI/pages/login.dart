import 'package:flutter/material.dart';
import 'package:login_signup/UI/view/custom_background.dart';
import 'package:login_signup/UI/view/custom_text_field.dart';
import 'package:login_signup/UI/view/outlined_container.dart';
import 'package:login_signup/model/state/app_state.dart';
import 'package:provider/provider.dart';

import 'package:login_signup/UI/view/logo.dart';

import '../style.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final cs = _Style(appState.size);
    return CustomBackground(
      children: <Widget> [
        AppLogo(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(appState.size.hPadding),
              child: OutlinedContainer(
                child: Column(
                 children: <Widget>[
                   Text("Login",
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 40,
                       color: CustomAppColors.accent
                     ),
                   ),
                   SizedBox(
                     height: cs.inputSpace,
                   ),
                   CustomTextField(
                     inputType: TextInputType.text,
                     hint: "Username",
                   ),
                   SizedBox(
                     height: cs.inputSpace,
                   ),
                   CustomTextField(
                     inputType: TextInputType.text,
                     password: true,
                     hint: "Password",
                   )
                 ]
                  ),
              ),
            )
          ]
        ),
      ]
    );
  }
}

class _Style {
  final CustomAppDimensions size;
  _Style(this.size);

  double get inputSpace => size.scale(15,Measure.height);
}