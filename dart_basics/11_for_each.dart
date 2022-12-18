void main() {
  List<int> numberList = [3, 4, 2, 3, 5];
  List<int> secondList = [];

  numberList.forEach((element) {
    if (element == 3) {
      secondList.add(element);
    }
  });

  print('Second list: $secondList');
}
