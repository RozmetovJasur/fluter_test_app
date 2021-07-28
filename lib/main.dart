import 'package:flutter/material.dart';

import 'test.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Q1. Who created Flutter?',
      'answers': [
        {'text': 'Facebook', 'score': 1},
        {'text': 'Adobe', 'score': 2},
        {'text': 'Google', 'score': 10},
        {'text': 'Microsoft', 'score': 4},
      ],
    },
    {
      'questionText': 'Q2. What is Flutter?',
      'answers': [
        {'text': 'Android Development Kit', 'score': 1},
        {'text': 'IOS Development Kit', 'score': 2},
        {'text': 'Web Development Kit', 'score': 3},
        {'text': 'SDK to build beautiful IOS, Android, Web & Desktop Native Apps', 'score': 10},
      ],
    },
    {
      'questionText': ' Q3. Which programing language is used by Flutter',
      'answers': [
        {'text': 'Ruby', 'score': 1},
        {'text': 'Dart', 'score': 10},
        {'text': 'C++', 'score': 3},
        {'text': 'Kotlin', 'score': 4},
      ],
    },
    {
      'questionText': 'Q4. Who created Dart programing language?',
      'answers': [
        {'text': 'Lars Bak and Kasper Lund', 'score': 10},
        {'text': 'Brendan Eich', 'score': 2},
        {'text': 'Bjarne Stroustrup', 'score': 3},
        {'text': 'Jeremy Ashkenas', 'score': 4},
      ],
    },
    {
      'questionText': 'Q5. Is Flutter for Web and Desktop available in stable version?',
      'answers': [
        {
          'text': 'Yes',
          'score': 1,
        },
        {'text': 'No', 'score': 10},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;
  Map<int, int> answered = {};

  int color = 0xFF00E676;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      answered = {};
    });
  }

  _answerQuestion(int score) {
    setState(() {
      _totalScore += score;
      if (score == 10)
        color = 0xFF00E676;
      else
        color = 0xFFB61414;
      if (answered.containsKey(_questionIndex)) {
        answered.remove(_questionIndex);
        answered.putIfAbsent(_questionIndex, () => score);
      } else
        answered.putIfAbsent(_questionIndex, () => score);
      print(answered);
      if (_questionIndex < _questions.length) {
        print('We have more questions!');
      } else {
        print('No more questions!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test app'),
          backgroundColor: Color(0xFF00E676),
        ),
        body: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text("Jami testlar soni : " + _questions.length.toString())),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: _questionIndex < _questions.length
                  ? Quiz(
                      answerQuestion: _answerQuestion,
                      questionIndex: _questionIndex,
                      questions: _questions,
                      answered: answered,
                    ) //Quiz
                  : Result(_totalScore, _resetQuiz),
            ),
            _questionIndex < _questions.length
                ? Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TextButton(
                          child: Text('<<= Oldingi'),
                          onPressed: () {
                            setState(() {
                              setState(() {
                                if (_questionIndex > 0) {
                                  _questionIndex = _questionIndex - 1;
                                }
                              });
                            });
                          },
                        ),
                        SizedBox(width: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                            child: Text('Keyingi =>>'),
                            onPressed: () {
                              setState(() {
                                _questionIndex = _questionIndex + 1;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  )
                : Container(),
          ],
        ), //Padding
      ), //Scaffold
      debugShowCheckedModeBanner: false,
    ); //MaterialApp
  }
}
