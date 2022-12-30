// Add an item to display a question
// Question
// • Has a category
// • Has a question text

import 'package:flutter/material.dart';

final kBackColour = Colors.green[50];
const kMainColour = Colors.green;
const kSnackColour = Colors.red;

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
        backgroundColor: kMainColour,
      ),
      body: const QuestionItem(),
      floatingActionButton: const Fab(),
    );
  }
}

class QuestionItem extends StatelessWidget {
  const QuestionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListTile(
        tileColor: kBackColour,
        leading: const Icon(
          Icons.help,
          size: 40,
          color: kMainColour,
        ),
        title: const Text('Category: Flutter self awareness'),
        subtitle: const Text('What is this listTile doing here all alone?'),
      ),
    );
  }
}

class Fab extends StatelessWidget {
  const Fab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: kMainColour,
      onPressed: (() {
        const snackBar = SnackBar(
          content: Text('Merry Christmas!'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: kSnackColour,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }),
      child: const Icon(
        Icons.horizontal_split,
      ),
    );
  }
}
