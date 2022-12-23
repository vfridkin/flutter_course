import 'package:flutter/material.dart';

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
      body: const QuestionItem(),
      floatingActionButton: const Fab(),
    );
  }
}

class QuestionItem extends StatelessWidget {
  const QuestionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          color: Colors.green.shade100,
          child: const ListTile(
            leading: Icon(
              Icons.help,
              size: 40,
              color: Colors.green,
            ),
            title: Text('Category: Flutter self awareness'),
            subtitle: Text('What is this listTile doing here all alone?'),
          ),
        ),
      ],
    );
  }
}

class Fab extends StatelessWidget {
  const Fab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (() {
        const snackBar = SnackBar(
          content: Text('Merry Christmas!'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }),
      backgroundColor: Colors.green,
      child: const Icon(
        Icons.horizontal_split,
      ),
    );
  }
}
