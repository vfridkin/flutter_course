import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.red[700],
            appBar: AppBar(
              title: const Text('Task F1'),
              centerTitle: true,
            ),
            body: const Center(child: Text(''))));
  }
}
