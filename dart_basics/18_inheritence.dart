void main() {
  Student student1 = Student();
  student1
    ..setSemester = 2
    ..setAge = 21
    ..setName = "Dick";

  Student2 student2 = Student2();
  student2
    ..setSemester = 1
    ..setAge = 22
    ..setName = "Dicky";

  Person person1 = Person();
  person1
    ..setName = "Harry"
    ..setAge = 46;

  int semester = student1.getSemester;
  print(semester);

  student1
    ..jump()
    ..run();

  student2
    ..jump()
    ..study()
    ..run();
}

mixin Learner on Student {
  void study() {
    print("${this.getName} is studying...");
  }
}

mixin Jumper {
  void jump() {
    print('I can jump!');
  }
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

class Student extends Person with Jumper {
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

class Student2 extends Student with Learner {}
