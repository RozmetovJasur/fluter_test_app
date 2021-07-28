import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;
  final int questionNumber;

  Question(this.questionText, this.questionNumber);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        (questionNumber + 1).toString() + ". " + questionText,
        style: TextStyle(fontSize: 28),
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
    ); //Container
  }
}
