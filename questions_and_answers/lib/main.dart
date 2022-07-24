import 'package:questions_and_answers/quiz.dart';
import 'package:flutter/material.dart';
import 'package:questions_and_answers/result.dart';

void main() {
  runApp(const QuestionsApp());
}

class QuestionsApp extends StatefulWidget {
  const QuestionsApp({Key? key}) : super(key: key);

  @override
  State<QuestionsApp> createState() => _QuestionsAppState();
}

class _QuestionsAppState extends State<QuestionsApp> {
  final List<Map<String, Object>> _questions = const [
    {
      'text': 'What is your favorite color?',
      'answers': [
        {'text': 'Black', 'points': 1},
        {'text': 'Red', 'points': 2},
        {'text': 'Blue', 'points': 3},
        {'text': 'Green', 'points': 4},
      ],
    },
    {
      'text': 'What is your favorite animal?',
      'answers': [
        {'text': 'Dog', 'points': 1},
        {'text': 'Cat', 'points': 2},
        {'text': 'Lion', 'points': 3},
        {'text': 'Elephant', 'points': 4},
      ],
    },
    {
      'text': 'What is your favorite teacher?',
      'answers': [
        {'text': 'Maria', 'points': 1},
        {'text': 'João', 'points': 2},
        {'text': 'Carlos', 'points': 3},
        {'text': 'Amanda', 'points': 4},
      ],
    },
  ];
  var _selectedQuestion = 0;
  var _totalPoints = 0;

  void _answer(int points) {
    setState(() {
      if (existSelectedQuestion) {
        _selectedQuestion++;
        _totalPoints += points;
      }
    });
  }

  void _restart() {
    setState(() {
      _selectedQuestion = 0;
      _totalPoints = 0;
    });
  }

  bool get existSelectedQuestion {
    return _selectedQuestion < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Questions and answers')),
        ),
        body: existSelectedQuestion
            ? Quiz(
                questions: _questions,
                selectedQuestion: _selectedQuestion,
                answer: _answer,
              )
            : Result(
                points: _totalPoints,
                restart: _restart,
              ),
      ),
    );
  }
}
