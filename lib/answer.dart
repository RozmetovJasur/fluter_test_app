import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;
  final int questionIndex;
  final int score;
  Map<int, int> answered;

  Answer(this.selectHandler, this.answerText, this.questionIndex, this.score, this.answered);

  @override
  Widget build(BuildContext context) {
    int color = 0xFFBF116B;

    if (answered.containsKey(questionIndex)) {
      if (answered[questionIndex] == 10 && score == 10)
        color = 0xFF00E676;
      else if (answered[questionIndex] == score) color = 0xFF1650A8;
    }
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Color(color),
        textColor: Colors.white,
        child: Text(answerText),
        onPressed: selectHandler,
      ), //RaisedButton
    ); //Container
  }
}
