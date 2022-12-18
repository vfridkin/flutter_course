import 'dart:convert';
import 'dart:io';
import 'dart:math';

void main() {
  String? userInput;
  int? inputInteger;
  int guessCount = 0;
  bool wrongAnswer;

  final int randomInteger = getRandomNumber();
  print('Guess my number between 1 and 10: ');
  do {
    userInput = stdin.readLineSync(encoding: utf8);
    inputInteger = int.tryParse(userInput!);
    wrongAnswer = !validInput(inputInteger) || (inputInteger != randomInteger);
    if (wrongAnswer) print("Try again:");
    guessCount++;
  } while (wrongAnswer);

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
