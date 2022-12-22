import 'dart:async';

void main() {
  Stream numberStream = NumberGenerator().getStream.asBroadcastStream();
  //* Broadcast can handle multiple subscriptions

  StreamSubscription sub1 =
      numberStream.takeWhile((element) => element < 8).listen((event) {
    print(event);
    if (event == 5) print("Hello!");
  }, onDone: () {
    print("Listener 1 done..");
  });

  Future.delayed(Duration(seconds: 4)).then((_) {
    StreamSubscription sub2 =
        numberStream.takeWhile((element) => element != 10).listen((event) {
      print(event);
    }, onDone: () {
      print("Listener 2 done..");
    });
    sub2.onDone(() {
      print("sub2 done");
    });
  });

  sub1.onDone(() {
    print("sub1 done");
  });
}

class NumberGenerator {
  int _counter = 0;

  StreamController<int> _controller = StreamController<int>();

  Stream<int> get getStream => _controller.stream;

  NumberGenerator() {
    final timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _controller.sink.add(_counter);
      _counter++;
    });

    Future.delayed(Duration(seconds: 10), () {
      timer.cancel();
      _controller.close();
    });
  }
}
