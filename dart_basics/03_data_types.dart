void main() {
  //* Data types
  print("-=Data Types=-");
  bool boolOutput = false;
  int intOutput = 1;
  double doubleOutput = 1.234567123412341234;
  String stringOutput = 'Hello';
  String joinedOutput = "Boolean: $boolOutput\n" +
      "Integer: $intOutput\n" +
      "Double: $doubleOutput";
  dynamic dynamicVariable = 4.5;

  print(boolOutput);
  print(intOutput);
  print(doubleOutput);
  print(stringOutput);
  print("joinedOutput: \n$joinedOutput");
  print('dynamicVariable: $dynamicVariable');
  dynamicVariable = "now a string!";
  print('dynamicVariable: $dynamicVariable');
  print("");

//* Keywords:
  print("-=Keywords=-");
  late int lateInt;
  lateInt = 1;
  print("lateInt: $lateInt");

  final int finalInt = 2;
  print("finalInt: $finalInt");

  const int constInt = 3;
  print("constInt: $constInt");

  var varOutput = "hello";
  varOutput = "hello there!";
  print('varOutput: $varOutput');
}
