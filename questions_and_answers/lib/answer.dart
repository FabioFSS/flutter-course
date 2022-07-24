import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer({Key? key, required this.text, required this.onSelection})
      : super(key: key);

  final String text;
  final void Function() onSelection;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onSelection,
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          onPrimary: Colors.white,
        ),
        child: Text(text),
      ),
    );
  }
}
