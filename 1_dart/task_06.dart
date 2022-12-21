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
  int lives = 10;
  bool isPlaying = true;
  final String correctWord = getRandomWord();
  List<String> guessWordList = List.filled(correctWord.length, "_");
  String guessWord = guessWordList.join();

  print("* * * Let's play hangman * * *");

  // Set up letter guesser for user input
  final letterGuesser = LetterGuesser(correctWord: correctWord);

  // Set up stream and listener to process user guesses
  Stream letterStream = letterGuesser.getStream.asBroadcastStream();
  letterStream.listen((letter) {
    // Check if correct guess
    final bool isCorrectGuess = correctWord.contains(letter);

    // Update guess word list with letter
    if (isCorrectGuess) {
      correctWord.split('').asMap().forEach((index, value) {
        if (value == letter) guessWordList[index] = letter;
      });
      guessWord = guessWordList.join();
      print(guessWord);
    }

    // Reduce lives
    if (!isCorrectGuess) {
      lives--;
      print("Wrong guess - you have $lives lives left.");
    }

    // Check if won
    final bool hasWon = guessWord == correctWord;

    // Check if still playing
    isPlaying = lives > 0 && !hasWon;
    if (!isPlaying) {
      hasWon ? print("Congratulations, you won! 😊") : print("You lost 🥲");
      print("Game Over");
      exit(0);
    }
  });

  letterGuesser.getUserInput();
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
      _controller.sink.add(letter);
    } while (playing);
  }
}
