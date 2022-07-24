import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({Key? key, required this.points, required this.restart})
      : super(key: key);

  final int points;
  final void Function() restart;

  String get phraseResult {
    if (points > 5) {
      return 'Congratulatins!';
    } else {
      return 'Not good...';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            phraseResult,
            style: const TextStyle(fontSize: 28),
          ),
          Text(
            "Your score was: $points",
            style: const TextStyle(fontSize: 28),
          ),
          TextButton(
            onPressed: restart,
            child: const Text(
              "Restart",
            ),
          )
        ],
      ),
    );
  }
}
