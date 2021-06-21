import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(Quize());

class Quize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SafeArea(
            child: QuizePage(),
          ),
        ),
      ),
    );
  }
}

class QuizePage extends StatefulWidget {
  @override
  _QuizePageState createState() => _QuizePageState();
}

class _QuizePageState extends State<QuizePage> {
  List<Icon> scoreKeeper = [];
  List<String> questions = [
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.',
  ];
  int questionNumber = 0;
  List<bool> answer = [false, true, true];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[questionNumber],
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.green,
              ),
              child: Text(
                'True',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                bool correctAnswer = answer[questionNumber];
                if (correctAnswer == true) {
                  print('User got it right');
                } else {
                  print('User got it wrong');
                }
                setState(() {
                  questionNumber++;
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                bool correctAnswer = answer[questionNumber];
                if (correctAnswer == false) {
                  print('User got it right');
                } else {
                  print('User got it wrong');
                }
                setState(() {
                  questionNumber++;
                });
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
