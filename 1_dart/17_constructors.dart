void main() {
  Car car1 = Car(colour: "red", engine: "V6");
  Car car2 = Car(colour: "blue", engine: "V8");

  car1.whichColour();
  car2.whichColour();

  car1.drive();

  print(car1.colour);
  print(car2.colour);
}

class Car {
//! attributes
  final String colour;
  final String engine;

//! constructor
  Car({required this.colour, required this.engine});

// //! setter - set attributes
//   set setColour(String colour) {
//     // validate input here
//     this._colour = colour;
//   }

// //! getter - get attributes
//   String get colour => this.colour;
//   String get engine => this.engine;

//! methods
  void drive() {
    print("$colour is moving");
  }

  void whichColour() {
    print("car colour: $colour");
  }
}
