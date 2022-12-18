void main(List<String> args) {
  const startValue = -1;
  var int = startValue;
  print('-=While loop=-');
  while (int >= 0) {
    print(int);
    int--;
  }

  print('-=Do While loop=-');
  int = startValue;
  do {
    print(int);
    int--;
  } while (int >= 0);
}
