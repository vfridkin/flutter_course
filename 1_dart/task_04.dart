import 'dart:io';
import 'dart:math';

// Guess the number between 1 and 10 with hints
void main() {
  int guessCount = 0;
  bool isCorrect;
  final int correctNumber = getRandomNumber();

  print('Guess my number between 1 and 10: ');
  do {
    final String? userInput = stdin.readLineSync();
    final int? userInteger = int.tryParse(userInput!);
    final bool isValid = validInput(userInteger);
    if (!isValid) {
      print("Try entering a value between 1 and 10:");
      isCorrect = false;
      continue;
    }
    isCorrect =
        checkIfCorrect(inputNumber: userInteger!, correctNumber: correctNumber);
    if (!isCorrect)
      printHint(inputNumber: userInteger, correctNumber: correctNumber);
    guessCount++;
  } while (!isCorrect);

  final String es = guessCount == 1 ? "" : "es";
  print("You got it in $guessCount guess$es");
}

int getRandomNumber() {
  final seed = DateTime.now().millisecondsSinceEpoch;
  final random = Random(seed);
  final randomInt = random.nextInt(10) + 1;
  return randomInt;
}

bool validInput(int? x) {
  bool isInteger = x != null;
  return isInteger && 0 < x && x <= 10;
}

void printHint({required int inputNumber, required int correctNumber}) {
  if (inputNumber > correctNumber) print("Too high, try again..");
  if (inputNumber < correctNumber) print("Too low, try again..");
}

bool checkIfCorrect({required int inputNumber, required int correctNumber}) {
  final bool isCorrect = (inputNumber == correctNumber);
  return isCorrect;
}
