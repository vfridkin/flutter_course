void main() {
  Int number = Int(3);
  print('The result is ${number.pow()}');
}

class Int {
  int value;
  Int(this.value);

  int pow() {
    return (value * value);
  }
}
