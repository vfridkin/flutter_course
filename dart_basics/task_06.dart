import 'dart:io';
import 'dart:math';
import 'dart:async';

const words = [
  "stumble",
  "heat",
  "tension",
  "packet",
  "of",
  "wheat",
  "ritual",
  "movement",
  "trace",
  "mask"
];

// Hang man
void main() {
  final String randomWord = getRandomWord();
  bool _solved = false;
  bool playing = true;
  int lives = 10;

  print("* * * Let's play hangman * * *");

  Stream letterStream =
      LetterGuesser(randomWord: randomWord).getStream.asBroadcastStream();

  StreamSubscription thisGame = letterStream.listen((event) {
    print(event);
  }, onDone: () {
    print("Thanks for playing, bye!");
  });
}

String getRandomWord() {
  final seed = DateTime.now().millisecondsSinceEpoch;
  final random = Random(seed);
  final randomInt = random.nextInt(10);
  return words[randomInt];
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
  final String randomWord;
  bool playing = true;

  StreamController<String> _controller = StreamController<String>();
  Stream<String> get getStream => _controller.stream;

  LetterGuesser({required this.randomWord}) {
    do {
      final letter = getLetter();
      final guessState = randomWord;
      _controller.sink.add(letter);
    } while (playing);
  }
}
