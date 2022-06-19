import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback answerFunction;
  final Map<String, Object> answer;

  const Answer({
    Key? key,
    required this.answer,
    required this.answerFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: ElevatedButton(
        onPressed: answerFunction,
        child: Text(
          "${answer['text']}",
        ),
      ),
    );
  }
}
