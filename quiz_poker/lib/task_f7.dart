// // Use a List View Builder
// // • Use a ListView to display your questions

// import 'package:csv/csv.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// final kBackColour = Colors.green[50];
// const kMainColour = Colors.green;
// const kSnackColour = Colors.red;

// const String imgAsset = 'assets/images/hip-hop.webp';
// const String imgSource =
//     'https://st.depositphotos.com/2654883/3574/v/950/depositphotos_35743665-stock-illustration-hip-hop-latter-symbol-of.jpg';
// const String dataAsset = 'assets/data/quiz.csv';
// const String category = 'Hip Hop';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(home: ScaffoldPage());
//   }
// }

// class ScaffoldPage extends StatelessWidget {
//   const ScaffoldPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Quiz Poker'),
//           centerTitle: true,
//           backgroundColor: kMainColour,
//         ),
//         body: const QuestionItemList());
//   }
// }

// class QuestionItemList extends StatefulWidget {
//   const QuestionItemList({super.key});

//   @override
//   State<QuestionItemList> createState() => _QuestionItemListState();
// }

// class _QuestionItemListState extends State<QuestionItemList> {
//   List<String> questions = [];

//   DataService dataService = DataService();

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<List<String>>>(
//       future: dataService.getCsvDataFromLocal(),
//       child: LayoutBuilder(
//           builder: (BuildContext context, BoxConstraints constraints) {
//         final maxTiles = constraints.maxWidth ~/ 300;
//         final tileWidth = constraints.maxWidth / maxTiles;

//         return ListView.separated(
//           itemCount: questions.length,
//           scrollDirection:
//               constraints.maxWidth > 600 ? Axis.horizontal : Axis.vertical,
//           separatorBuilder: (context, index) => constraints.maxWidth > 600
//               ? const SizedBox(width: 10)
//               : const SizedBox(height: 10),
//           itemBuilder: (context, index) => QuestionItem(
//             questionText: questions[index],
//             tileWidth: tileWidth,
//           ),
//         );
//       }),
//     );
//   }
// }

// class QuestionItem extends StatelessWidget {
//   final String questionText;
//   final double tileWidth;

//   const QuestionItem(
//       {super.key, required this.questionText, required this.tileWidth});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: tileWidth,
//       decoration: BoxDecoration(
//           color: kBackColour, borderRadius: BorderRadius.circular(10)),
//       child: ListTile(
//         leading: const CircleAvatar(
//           backgroundImage: NetworkImage(imgSource),
//         ),
//         title: const Text(category),
//         subtitle: Text(questionText),
//       ),
//     );
//   }
// }

// class DataService {
//   Future<List<List<String>>> getCsvDataFromLocal() async {
//     var csvFile = await rootBundle.loadString(dataAsset);
//     return const CsvToListConverter().convert(csvFile);
//   }
// }
