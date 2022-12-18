import 'dart:io';
import 'dart:math';

// Guess the number between 1 and 10
void main() {
  int guessCount = 0;
  bool wrongAnswer;
  final int randomInteger = getRandomNumber();

  print('Guess my number between 1 and 10: ');
  do {
    final String? userInput = stdin.readLineSync();
    final int? inputInteger = int.tryParse(userInput!);
    final bool isValidInput = validInput(inputInteger);
    isValidInput
        ? printHint(randomInteger, inputInteger!)
        : print("Try entering a value between 1 and 10:");

    wrongAnswer = !isValidInput || (inputInteger != randomInteger);
    guessCount++;
  } while (wrongAnswer);

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

void printHint(int randomInteger, int inputInteger) {
  if (inputInteger > randomInteger) print("Too high, try again..");
  if (inputInteger < randomInteger) print("Too low, try again..");
}
