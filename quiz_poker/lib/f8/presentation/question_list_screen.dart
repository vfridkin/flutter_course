import 'package:flutter/material.dart';
import 'package:quiz_poker/f8/components/constants.dart';
import 'package:quiz_poker/f8/widgets/question_item_list.dart';

class QuestionListScreen extends StatelessWidget {
  const QuestionListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Quiz Poker'),
          centerTitle: true,
          backgroundColor: kMainColour,
        ),
        body: const QuestionItemList());
  }
}
