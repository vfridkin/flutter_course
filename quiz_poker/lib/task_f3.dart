import 'package:flutter/material.dart';

const String imgAsset = 'assets/images/hip-hop.webp';
const String imgNetwork =
    'https://st.depositphotos.com/2654883/3574/v/950/depositphotos_35743665-stock-illustration-hip-hop-latter-symbol-of.jpg';
const String category = 'Hip Hop';
const String question = 'What was the first rap to hit the Billboard?';

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
    );
  }
}

class QuestionItem extends StatelessWidget {
  const QuestionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 50,
        // backgroundImage: NetworkImage(imgNetwork),
        // backgroundImage: AssetImage(imgAsset),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(45),
          child: Image.asset(imgAsset),
        ),
      ),
      title: const Text(category),
      subtitle: const Text(question),
    );
  }
}
