import 'package:flutter/material.dart';
import 'package:quiz_poker/f8/presentation/question_detail_screen.dart';

import '../components/constants.dart';

class QuestionItem extends StatelessWidget {
  final List<dynamic> dataRow;
  final double tileWidth;
  final String role;

  const QuestionItem(
      {super.key,
      required this.dataRow,
      required this.tileWidth,
      required this.role});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: tileWidth,
      decoration: BoxDecoration(
          color: kBackColour, borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        onTap: () {
          if (role == 'nav') {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => QuestionDetailScreen(
                        dataRow: dataRow, tileWidth: tileWidth))));
          }
          if (role == 'hint') {}
        },
        leading: const CircleAvatar(
          backgroundImage: NetworkImage(kImgSource),
        ),
        title: const Text(kCategory),
        subtitle: Text(dataRow[0]),
      ),
    );
  }
}
