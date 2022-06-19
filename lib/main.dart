import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/score.dart';

import 'answer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Quiz App demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, Object>> _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
      ],
    },
  ];
  int _questionIndex = 0;
  int _score = 0;
  bool _scoreVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child:
            !_scoreVisibility ? questionField : Score(score: _score, onPressed: setVisibilityFalse),
      ),
    );
  }

  Widget get questionField {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Question(
          question: "${_questions[_questionIndex % _questions.length]['questionText']}",
        ),
        ...answers,
      ],
    );
  }

  Iterable<Widget> get answers {
    return (_questions[_questionIndex % _questions.length]['answers'] as List<Map<String, Object>>)
        .map(
      (Map<String, Object> answer) {
        return Answer(
          answer: answer,
          answerFunction: () => answerFunction(answer),
        );
      },
    );
  }

  answerFunction(Map<String, Object> answer) {
    setState(() {
      _questionIndex = (_questionIndex + 1);
      _score = _score + (answer['score']! as int);
      bool visibilityStatus = _questionIndex != 0 && (_questionIndex % _questions.length == 0);
      if (visibilityStatus) {
        _scoreVisibility = true;
      }
    });
  }

  setVisibilityFalse() {
    setState(() => _scoreVisibility = false);
  }
}
