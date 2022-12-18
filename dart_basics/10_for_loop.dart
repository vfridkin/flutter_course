void main() {
  List<int> numberList = [3, 4, 2, 3, 5];
  List<int> secondList = [];

  for (int i = 0; i < numberList.length; i++) {
    if (numberList[i] == 3) {
      secondList.add(numberList[i]);
    }
  }

  print('Second list: $secondList');

  for (int x in numberList) {
    print(x);
  }
}
