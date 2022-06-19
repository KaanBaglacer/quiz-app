import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String question;

  const Question({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(question),
    );
  }
}
