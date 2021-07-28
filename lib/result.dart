import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

//Remark Logic
  String get resultPhrase {
    String resultText;
    if (resultScore >= 41) {
      resultText = 'Siz testlardan yaxshi o\'tdingiz!';
      print(resultScore);
    } else if (resultScore >= 31) {
      resultText = 'Juda yoqimli!';
      print(resultScore);
    } else if (resultScore >= 21) {
      resultText = 'Siz ko\'proq o\'rganishingiz kerak!';
    } else if (resultScore >= 1) {
      resultText = 'Siz qattiq ishlashingiz kerak!';
    } else {
      resultText = 'Bu juda yomon baho!';
      print(resultScore);
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text
          Text(
            'Sizning to\'plagan balingingiz ' '$resultScore',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text
          FlatButton(
            child: Text(
              'Testni qaytadan boshlash!',
            ), //Text
            textColor: Colors.blue,
            onPressed: resetHandler,
          ), //FlatButton
        ], //<Widget>[]
      ), //Column
    ); //Center
  }
}
