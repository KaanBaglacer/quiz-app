import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  final int score;
  final VoidCallback onPressed;

  const Score({Key? key, required this.score, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          "Score is $score",
        ),
      ),
    );
  }
}
