import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final bool answer;
  final VoidCallback _onTap;

  AnswerButton(this.answer, this._onTap);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: new Material( // True button
        color: this.answer ? Colors.greenAccent : Colors.redAccent,
        child: InkWell(
          onTap: () => _onTap(),
          child: new Center(
            child: new Container(
              child: new Text(answer ? "True" : "False", style: TextStyle(color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
              decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 5.0)),
              padding: EdgeInsets.all(20.0),
            )
          )
        ),
      ),
    );
  }

}

