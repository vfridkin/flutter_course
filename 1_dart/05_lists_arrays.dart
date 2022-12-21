void main() {
  print("-=Lists=-");
  List<int> exampleList = [1, 2, 3, 4, 5, 6, 7];
  print('exampleList: $exampleList');
  print('length: ${exampleList.length}');
  print('isEmpty: ${exampleList.isEmpty}');
  print('isNotEmpty: ${exampleList.isNotEmpty}');

  exampleList.add(8);
  print('after add - exampleList: $exampleList');

  print("\n-=Maps=-");
  Map<int, String> exampleMap = {1: "hello", 2: "there"};
  print('exampleMap: $exampleMap');
  print('keys: ${exampleMap.keys}');
}
