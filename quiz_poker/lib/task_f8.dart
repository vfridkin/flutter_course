// Show a question
// • On click on a question go to a question detail page
// • There you see the question
// • After a first action show the first hint
// • After a second action show the second hint
// • After a third action show the solution
// • On click on the FAB button go to a random detail question page
// • On close go back to the questions list

import 'package:flutter/material.dart';
import 'package:quiz_poker/f8/presentation/question_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: QuestionListScreen());
  }
}
