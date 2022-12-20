import 'dart:async';
import 'dart:io';

void main() {
  final letterGuesser = LetterGuesser();
  Stream letterStream = letterGuesser.getStream.asBroadcastStream();
  StreamSubscription listener = letterStream.listen((event) {
    print(event); // <- this isn't running
  });
  letterGuesser.getUserInput();
}

String getLetter() {
  bool validLetter;
  String userInput;

  do {
    stdout.write("Enter a letter: ");
    userInput = stdin.readLineSync() ?? "";
    userInput = userInput.toLowerCase();
    validLetter = RegExp(r'^[a-z]$').hasMatch(userInput);
    if (!validLetter) print("Please pick a letter from a to z.");
  } while (!validLetter);

  return userInput;
}

class LetterGuesser {
  StreamController<String> _controller = StreamController<String>(sync: true);
  Stream<String> get getStream => _controller.stream;

  void getUserInput() {
    do {
      final letter = getLetter();
      _controller.sink.add(letter);
    } while (true);
  }
}
