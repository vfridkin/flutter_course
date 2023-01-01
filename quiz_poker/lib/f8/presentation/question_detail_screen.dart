import 'package:flutter/material.dart';
import 'package:quiz_poker/f8/components/constants.dart';

import '../widgets/question_item.dart';

class QuestionDetailScreen extends StatelessWidget {
  final List<dynamic> dataRow;
  final double tileWidth;
  const QuestionDetailScreen(
      {super.key, required this.dataRow, required this.tileWidth});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question details'),
        centerTitle: true,
        backgroundColor: kMainColour,
      ),
      body: QuestionItem(dataRow: dataRow, tileWidth: tileWidth, role: 'hint'),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
    );
  }
}
