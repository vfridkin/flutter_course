// Add a question element
// • If you click on your FAB, add a random question to your View

import 'package:flutter/material.dart';

final kBackColour = Colors.green[50];
const kMainColour = Colors.green;
const kSnackColour = Colors.red;

const String imgAsset = 'assets/images/hip-hop.webp';
const String imgNetwork =
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
  'In which U.S city was the hip hop culture created?',
  'Which actor and rapper is often known as Ice Cube?',
  'The American hip hop star Dr. Dre also has a popular brand of which product with his name?',
  'What is the name of the first album by Jay-Z?',
  'What was the first rap name of Biggie Smalls, also known as The Notorious B.I.G?',
  'Run-D.M.C worked with rock musicians Joe Perry and Steven Tyler to remake which rap song of their band?',
  'Which of the following people was not a member of the hip hop group Fugees?',
  'Which of the following is a magazine that focuses on the world of hip hop?',
  'Chuck D, the leader of the rap group Public Enemy, once called rap “the black …”',
  'The famous rapper Karim Kharbouch, often known as French Montana was born in which country?',
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

class ScaffoldPage extends StatefulWidget {
  const ScaffoldPage({super.key});

  @override
  State<ScaffoldPage> createState() => _ScaffoldPageState();
}

class _ScaffoldPageState extends State<ScaffoldPage> {
  @override
  Widget build(BuildContext context) {
    int index = 0;

    // Create list of question indices that are shuffled to get random non repeating questions
    final List<int> questionIndices = [
      for (var i = 0; i < questions.length; i++) i
    ];
    questionIndices.shuffle();

    void newQuestion() {
      setState(() {
        index++;
      });
    }

    return Scaffold(
      body: QuestionItem(
        category: category,
        question: questions[questionIndices[index]],
      ),
      appBar: AppBar(
        title: const Text('Quiz Poker'),
        centerTitle: true,
        backgroundColor: kMainColour,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kMainColour,
        onPressed: () => newQuestion(),
        child: const Icon(
          Icons.navigate_next_outlined,
        ),
      ),
    );
  }
}

class QuestionItem extends StatelessWidget {
  final String category;
  final String question;
  const QuestionItem(
      {super.key, required this.category, required this.question});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: kBackColour,
        contentPadding: const EdgeInsets.all(8.0),
        title: Text(category),
        subtitle: Text(question),
        leading: const CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(imgNetwork),
          // backgroundImage: AssetImage(imgAsset),
          // child: ClipRRect(
          //   borderRadius: BorderRadius.circular(45),
          //   child: Image.asset(imgAsset),
          // ),
        ),
      ),
    );
  }
}
