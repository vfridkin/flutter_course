import 'dart:io';
import 'dart:math';

void main() {
  int guessCount = 0;
  bool isCorrect;

  final int correctNumber = getRandomNumber();
  print('Guess my number between 1 and 10: ');
  do {
    final String? userInput = stdin.readLineSync();
    final int? userInteger = int.tryParse(userInput!);
    isCorrect =
        checkIfCorrect(inputNumber: userInteger, correctNumber: correctNumber);
    if (!isCorrect) print("Try again:");
    guessCount++;
  } while (!isCorrect);

  String es = guessCount == 1 ? "" : "es";
  print("You got it in $guessCount guess$es");
}

int getRandomNumber() {
  final seed = DateTime.now().millisecondsSinceEpoch;
  final random = Random(seed);
  final randomInt = random.nextInt(10) + 1;
  return (randomInt);
}

bool validInput(int? x) {
  bool isInteger = x != null;
  return (isInteger && 0 < x && x <= 10);
}

bool checkIfCorrect({required int? inputNumber, required int correctNumber}) {
  final bool isCorrect =
      validInput(inputNumber) && (inputNumber == correctNumber);
  return isCorrect;
}
