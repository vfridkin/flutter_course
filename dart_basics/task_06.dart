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
  int lives = 2;
  bool isPlaying = true;
  final String correctWord = getRandomWord();
  String guessWord = "_" * correctWord.length;

  print("* * * Let's play hangman * * *");

  // Set up letter guesser for user input
  final letterGuesser = LetterGuesser(correctWord: correctWord);

  // Set up stream and listener to process user guesses
  Stream letterStream = letterGuesser.getStream.asBroadcastStream();
  StreamSubscription thisGame = letterStream.listen((letter) {
    print(correctWord);
    final List<String> guessWordList = guessWord.split('');
    List<int> indices = [];
    correctWord.split('').asMap().forEach((index, value) {
      if (value == letter) guessWordList[index] = letter;
    });
    final bool isLetterInWord = correctWord.contains(letter);
    isLetterInWord ? guessWord = guessWordList.join() : lives--;
    print(guessWord);
    print("You have $lives lives left.");
    final bool hasWon = guessWord == correctWord;
    isPlaying = lives > 0 && !hasWon;
    if (!isPlaying) {
      hasWon ? print("Congratulations, you won! 😊") : print("You lose 🥲");
      print("Game Over");
      exit(0);
    }
  }, onDone: () {
    isPlaying = false;
    print("Game Over");
    exit(0);
  });

  letterGuesser.getUserInput();
  if (!isPlaying) {
    thisGame.cancel();
  }
}

String replaceBlankWithLetter(letter, guessWord, correctWord) {
  return guessWord;
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
  final String correctWord;
  bool playing = true;

  StreamController<String> _controller = StreamController<String>(sync: true);
  Stream<String> get getStream => _controller.stream;

  //* Constructor
  LetterGuesser({required this.correctWord});

  //* Method
  void getUserInput() {
    do {
      final letter = getLetter();
      final guessState = correctWord;
      _controller.sink.add(letter);
    } while (playing);
  }
}
