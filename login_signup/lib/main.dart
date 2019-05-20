import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:login_signup/model/state/app_state.dart';

import 'package:login_signup/UI/app_frame.dart';
void main() => runApp(LoginSignupApp());

class LoginSignupApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login Signup test",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: ChangeNotifierProvider<AppState>(
        builder: (_) => AppState(),
        child: AppFrame()
      )
    );
  }
}
