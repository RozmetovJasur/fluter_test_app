import 'package:flutter/material.dart';

import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;
  Map<int, int> answered;

  Quiz({
    @required this.questions,
    @required this.answerQuestion,
    @required this.questionIndex,
    @required this.answered,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['questionText'], questionIndex),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
          return Answer(
              () => answerQuestion(answer['score']), answer['text'], questionIndex, answer['score'], answered);
        }).toList()
      ],
    ); //Column
  }
}
