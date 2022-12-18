import 'dart:io';

// Calculate factorial from user input
void main() {
  String? userInput;
  int? inputInteger;
  bool invalidInput;
  int factorial;

  do {
    print("Enter an integer >= 0:");
    userInput = stdin.readLineSync();
    inputInteger = int.tryParse(userInput!);
    invalidInput = !validInput(inputInteger);
  } while (invalidInput);

  factorial = calculateFactorial(inputInteger!);
  print("$inputInteger! = $factorial");
}

bool validInput(int? x) {
  bool isInteger = x != null;
  bool isNonNegative = isInteger && x >= 0;
  return isInteger && isNonNegative;
}

int calculateFactorial(int x) {
  if (x > 1) return x * calculateFactorial(x - 1);
  return 1;
}
