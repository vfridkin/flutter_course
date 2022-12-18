void main() {
  Car car1 = Car();
  car1.setColour = "red";

  Car car2 = Car();
  car2.setColour = "blue";

  car1.whichColour();
  car2.whichColour();

  car1.drive();

  print(car1.colour);
  print(car2.colour);
}

class Car {
//! attributes
  late String _colour;

//! setter - set attributes
  set setColour(String colour) {
    // validate input here
    this._colour = colour;
  }

//! getter - get attributes
  String get colour => this._colour;

//! methods
  void drive() {
    print("$_colour is moving");
  }

  void whichColour() {
    print("car colour: $_colour");
  }
}
