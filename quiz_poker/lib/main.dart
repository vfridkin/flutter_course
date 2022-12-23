import 'package:flutter/material.dart';

const String imgSource =
    'https://st.depositphotos.com/2654883/3574/v/950/depositphotos_35743665-stock-illustration-hip-hop-latter-symbol-of.jpg';
const String category = 'Hip Hop';
const List<String> questions = [
  'What was the first rap to hit the Billboard?',
  'Run-D.M.C. collaborated with rock musicians Steven Tyler and Joe Perry, of Aerosmith, on a rap remake of which of their band’s songs?',
  'The original "four elements" of hip-hop culture consist of rapping, deejaying, break dancing (or "B-boying"), and what else?',
  'Ginuwine’s "Pony," Jay-Z’s "Big Pimpin’," Missy Elliott’s "Work It," and Nelly Furtado’s "Promiscuous" were all produced by whom?',
  'The title of the worldwide hit "Gangnam Style" (2012) refers to a neighborhood in which city?',
  'Sir Mix-A-Lot’s 1992 hit "Baby Got Back" was sampled in a 2014 song by which female rapper?',
  'Which singer has been called the Queen of Hip-Hop Soul?',
  'What was the first rap song to hit number one on the Billboard Hot 100 chart?',
  'Chuck D of Public Enemy famously referred to rap as "the black" what?',
  'What is the birth name of the rapper and actor familiarly known as Ice Cube?',
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ScaffoldPage());
  }
}

class ScaffoldPage extends StatelessWidget {
  const ScaffoldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Quiz Poker'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: const QuestionItemList());
  }
}

class QuestionItemList extends StatelessWidget {
  const QuestionItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: questions
              .map((question) => QuestionItem(questionText: question))
              .toList()),
    );
  }
}

class QuestionItem extends StatelessWidget {
  final String questionText;
  const QuestionItem({super.key, required this.questionText});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green.shade100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: const CircleAvatar(
            backgroundImage: NetworkImage(imgSource),
          ),
          title: const Text(category),
          subtitle: Text(questionText),
        ),
      ),
    );
  }
}
