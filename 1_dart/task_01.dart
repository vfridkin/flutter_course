import 'dart:io';

void main() {
  stdout.write('Enter a variable: ');
  String? stringInput = stdin.readLineSync();
  print('You entered: $stringInput');
}
