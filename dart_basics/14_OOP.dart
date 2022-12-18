void main() {
  Car car1 = Car();
  car1.colour = "red";

  Car car2 = Car();
  car2.colour = "blue";

  car1.whichColour();
  car2.whichColour();

  car1.drive();
}

class Car {
// attributes
  late String colour;

// methods
  void drive() {
    print("$colour is moving");
  }

  void whichColour() {
    print("car colour: $colour");
  }
}
