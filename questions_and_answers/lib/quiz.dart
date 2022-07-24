import 'package:questions_and_answers/question.dart';
import 'package:questions_and_answers/answer.dart';
import "package:flutter/material.dart";

class Quiz extends StatelessWidget {
  const Quiz(
      {Key? key,
      required this.questions,
      required this.answer,
      required this.selectedQuestion})
      : super(key: key);

  final List<Map<String, Object>> questions;
  final int selectedQuestion;
  final void Function(int) answer;

  bool get existSelectedQuestion {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answersString = existSelectedQuestion
        ? questions[selectedQuestion].cast()['answers']
        : [];

    return Column(children: [
      Question(
        text: questions[selectedQuestion]['text'].toString(),
      ),
      ...answersString
          .map(
            (ans) => Answer(
              text: ans['text'].toString(),
              onSelection: () => answer(
                int.parse(ans['points'].toString()),
              ),
            ),
          )
          .toList(),
    ]);
  }
}
