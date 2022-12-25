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
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
              child: Text(
            'Hello!',
            style: TextStyle(fontSize: 40, color: Colors.white),
          )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
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
      ),
    );
  }
}
