import 'package:flutter/material.dart';
import 'package:quiz_poker/f8/data/data_service.dart';
import 'package:quiz_poker/f8/widgets/question_item.dart';

class QuestionHintList extends StatefulWidget {
  const QuestionHintList({super.key});

  @override
  State<QuestionHintList> createState() => _QuestionHintListState();
}

class _QuestionHintListState extends State<QuestionHintList> {
  DataService dataService = DataService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<List<dynamic>>>(
      future: dataService.loadCSV(),
      builder: (context, AsyncSnapshot<List<List<dynamic>>> snapshot) {
        if (snapshot.hasData) {
          return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            final maxTiles = constraints.maxWidth ~/ 300;
            final tileWidth = constraints.maxWidth / maxTiles;

            List<List<dynamic>>? data = snapshot.data!;

            return ListView.separated(
              itemCount: data.length,
              scrollDirection:
                  constraints.maxWidth > 600 ? Axis.horizontal : Axis.vertical,
              separatorBuilder: (context, index) => constraints.maxWidth > 600
                  ? const SizedBox(width: 10)
                  : const SizedBox(height: 10),
              itemBuilder: ((context, index) {
                if (index == 0) return const SizedBox(height: 0, width: 0);
                return QuestionItem(
                  dataRow: data[index],
                  tileWidth: tileWidth,
                  role: 'nav',
                );
              }),
            );
          });
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
