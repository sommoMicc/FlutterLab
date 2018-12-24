import 'package:flutter/material.dart';

import './../utils/question.dart';
import './../utils/quiz.dart';

import './../UI/answer_button.dart';
import './../UI/question_text.dart';
import './../UI/correct_wrong_overlay.dart';

class QuizPage extends StatefulWidget {
  
  @override
  State createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  Question currentQuestion;
  Quiz quiz = Quiz([
    Question("Io sono il sommo?",true),
    Question("Il tacchino è salutare?",true),
    Question("Flutter è per nabbi?",false),
  ]);

  String questionText;
  int questionNumber;
  bool isCorrect;

  bool overlayShouldBeVisibile = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Column(
          //This is our main page
          children: <Widget>[
            AnswerButton(true,() => handleAnswer(true)),
            QuestionText(questionText,questionNumber),
            AnswerButton(false, () => handleAnswer(false))
          ],
        ),
        overlayShouldBeVisibile ? CorrectWrongOverlay(
          isCorrect,
          () {
            currentQuestion = quiz.nextQuestion;
            this.setState(() {
              overlayShouldBeVisibile = false;
              questionText = currentQuestion.question;
              questionNumber = quiz.questionNumber;
            });
          }
        ) : new Container()
      ],
    );
  }

  void handleAnswer(bool userAnswer) {
    isCorrect = (currentQuestion.answer == userAnswer);
    quiz.answer(isCorrect);
    this.setState(() {
      overlayShouldBeVisibile = true;
    });
  }
}