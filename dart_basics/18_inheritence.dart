import 'dart:math';

void main() {
  Student student1 = Student();
  student1.setSemester = 2;
}

class Person {
  late String _name;
  late int _age;

  String get getName => this._name;
  int get getAge => this._age;

  //* Setters
  set setName(String name) {
    this._name = name;
  }

  set setAge(int age) {
    this._age = age;
  }

  //* Methods
  void run() {
    print("$_name is running!");
  }
}

class Student extends Person {
  late int _semester;

  int get getSemester => this._semester;

  //* Setters
  set setSemester(int semester) {
    this._semester = semester;
  }

  //* Methods
  void party() {
    print("$_name is partying!");
  }
}
