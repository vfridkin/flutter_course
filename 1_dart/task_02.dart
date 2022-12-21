import 'dart:io';

// Calculate factorial from user input
void main() {
  int? inputInteger;
  bool isValidInput;

  do {
    print("Enter an integer >= 0:");
    final String? userInput = stdin.readLineSync();
    inputInteger = int.tryParse(userInput!);
    isValidInput = validInput(inputInteger);
  } while (!isValidInput);

  final int factorial = calculateFactorial(inputInteger!);
  print("$inputInteger! = $factorial");
}

bool validInput(int? x) {
  bool isInteger = x != null;
  return isInteger && x >= 0;
}

int calculateFactorial(int x) {
  if (x > 1) return x * calculateFactorial(x - 1);
  return 1;
}
