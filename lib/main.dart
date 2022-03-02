import 'package:flutter/material.dart';
import 'questions.dart';
import 'quizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.shade900,
          body: QuizzPage(),
        ),
      ),
    );
  }
}

class QuizzPage extends StatefulWidget {
  @override
  _QuizzPageState createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  List<Icon> scorekeeper = [];

  void checkAnswer(bool userInput) {
    setState(() {
      if (quizBrain.getQuestionAnswer() == userInput)
        scorekeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      else
        scorekeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      // count++;
      quizBrain.nextQuestion(context);
    });
  }
  // List<String> questions = [
  //   'You can lead a cow downstairs but not upstairs',
  //   'Approximately one quater of human bone are in the feet',
  //   'A slug\'s blood is green',
  // ];
  // List<bool> answers = [
  //   true,
  //   false,
  //   false,
  // ];

  // List<Question> question=[
  //   Question('You can lead a cow down stairs but not up stairs.', false),
  //   Question('Approximately one quarter of human bones are in the feet.', true),
  //   Question('A slug\'s blood is green.', true)
  // ];

  // int count = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: Text(
                quizBrain.getQuestionNumber(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FlatButton(
              padding: EdgeInsets.all(20.0),
              child: Text('Yes'),
              color: Colors.green,
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FlatButton(
              padding: EdgeInsets.all(20.0),
              child: Text('No'),
              color: Colors.red,
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
          Row(
            children: scorekeeper,
          ),
        ],
      ),
    );
  }
}

// 'You can lead a cow downstairs but not upstairs',
// 'Approximately one quater of human bone are in the feet',
// 'A slug\'s blood is green',
