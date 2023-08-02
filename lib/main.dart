import 'dart:ffi';
import 'questions.dart';
import 'quiz_brain.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
QuizBrain quizBrain=QuizBrain();
void main() {
  runApp(const Quizzler());
}
class Quizzler extends StatelessWidget {
  const Quizzler({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Quizpage(),
          ),
        ),
      ),
    );
  }
}
class Quizpage extends StatefulWidget {
  const Quizpage({super.key});
  @override
  State<Quizpage> createState() => _QuizpageState();
}
class _QuizpageState extends State<Quizpage> {
  List<Icon> scorekeeper=[];
  void checkAnswer(bool userPickedAnswer){
    bool correctAnswer=quizBrain.getQuestionAnswer();
    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();
        quizBrain.reset();
        scorekeeper = [];
      }
      else{
    if(userPickedAnswer==correctAnswer){
     scorekeeper.add(const Icon(Icons.check,color: Colors.green,));
    }
    else{
     scorekeeper.add(const Icon(Icons.close,color: Colors.red,));
    }
      quizBrain.nextQuestion();
    }});
    }
  @override
  Widget build(BuildContext context) {
    return   Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
         Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(quizBrain.getQuestionText(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25.0,
                color: Colors.white,
              )
              ),
            ),
          ),
        ),
    Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.green// Text Color
          ),
          child: const Text('True',
          style: TextStyle(fontSize: 25.0,color: Colors.white),
          ),
          onPressed: () {
           checkAnswer(true);
        },
          ),
        ),
      ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.red// Text Color
              ),
              child: const Text('False',
                style: TextStyle(fontSize: 25.0,color: Colors.white),
              ),
              onPressed: () {
          checkAnswer(false);
              },
            ),
          ),
        ),
         Row(
          children: scorekeeper,
        )
    ],
    );
  }
}

