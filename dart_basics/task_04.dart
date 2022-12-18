import 'dart:io';
import 'dart:math';

// Guess the number between 1 and 10
void main() {
  String? userInput;
  int? inputInteger;
  int guessCount = 0;
  bool invalidInput;
  bool wrongAnswer;

  final int randomInteger = getRandomNumber();
  print('Guess my number between 1 and 10: ');
  do {
    userInput = stdin.readLineSync();
    inputInteger = int.tryParse(userInput!);
    invalidInput = !validInput(inputInteger);
    invalidInput
        ? print("Input is invalid...")
        : printHint(randomInteger, inputInteger!);

    wrongAnswer = invalidInput || (inputInteger != randomInteger);
    guessCount++;
  } while (wrongAnswer);

  String es = guessCount == 1 ? "" : "es";
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
