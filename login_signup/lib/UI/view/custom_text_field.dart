import 'package:flutter/material.dart';
import 'package:login_signup/model/state/app_state.dart';
import 'package:provider/provider.dart';

import '../style.dart';

class CustomTextField extends StatelessWidget {

  final TextInputType inputType;
  final String hint;
  final bool password;

  CustomTextField({this.inputType,this.password = false,this.hint});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    final s = appState.size;
    final cs = _Style(s.orientation);
    return TextField(
      keyboardType: this.inputType,
      style: TextStyle(color: CustomAppColors.fontColor),
      autofocus: false,
      obscureText: this.password,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(
          cs.padding[0],
          cs.padding[1],
          cs.padding[0],
          cs.padding[1]
        ),
        fillColor: CustomAppColors.background,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: CustomAppColors.border
          ),
          borderRadius:BorderRadius.circular(s.radius)
        ),
        hintText: this.hint,
        hintStyle: TextStyle(color: CustomAppColors.secondaryFontColor)
      ),
    );
  }
}

class _Style {
  Orientation o;
  _Style(this.o);

  List<double> get padding => o == Orientation.portrait ?
      [30,10]:
      [35,15];

}