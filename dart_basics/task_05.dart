import 'dart:io';

const Map<String, String> commands = {
  "a": "Add a customer",
  "r": "Remove a customer",
  "v": "View all customers",
  "x": "Exit"
};

// Add, delete, view customers
void main() {
  String? command;
  List<customer> customers = [];

  print("* * * Welcome to your customer database * * *");
  do {
    customers.length == 0
        ? print("Your customer list is empty.")
        : print("Your have ${customers.length} customer(s).");
    command = getCommand();
    switch (command) {
      case "a":
        customers = addcustomer(customers);
        break;
      case "r":
        customers = removecustomer(customers);
        break;
      case "v":
        viewcustomers(customers);
        break;
    }
    print("\n");
  } while (command != "x");
  print("Goodbye...");
}

List<customer> addcustomer(List<customer> customers) {
  print("\n-= Add new customer =-");
  stdout.write("Name: ");
  String customerName = stdin.readLineSync() ?? "unknown name";
  customer newcustomer = customer(name: customerName);

  stdout.write("Age: ");
  String customerAge = stdin.readLineSync() ?? "unknown age";
  newcustomer.setAge = customerAge;

  customers.add(newcustomer);
  return customers;
}

List<customer> removecustomer(List<customer> customers) {
  String? userInput;
  int? customerIndex;

  do {
    viewcustomers(customers);
    stdout.write("Enter a number to remove the customer or 'x' to exit: ");
    userInput = stdin.readLineSync();
    customerIndex = int.tryParse(userInput!);
    customers = removecustomerByIndex(customerIndex, customers);
    if (customers.length == 0) print("No customers left... ");
  } while (userInput != "x" && customers.length > 0);
  return customers;
}

List<customer> removecustomerByIndex(
    int? customerIndex, List<customer> customers) {
  if (customerIndex == null) return customers;
  if (0 <= customerIndex && customerIndex < customers.length)
    customers.removeAt(customerIndex);
  return customers;
}

void viewcustomers(List<customer> customers) {
  print("\n-= Your customers =-");
  customers.asMap().forEach((int index, customer customer) {
    print("$index: ${customer.details}");
  });
}

class customer {
  String name;
  String? age = "unknown";

  // Constructor
  customer({required this.name});

  // Setters
  void set setAge(String age) {
    int? inputInteger = int.tryParse(age);
    bool isValid = validAge(inputInteger);
    if (isValid) this.age = age;
  }

  // Getters
  String get details {
    return "${name} age: ${age}";
  }

  // Methods
  bool validAge(int? x) {
    bool isInteger = x != null;
    return isInteger && 0 <= x;
  }
}

String? getCommand() {
  String? userInput;
  bool invalidCommand;

  do {
    print("Enter a command:");
    commands.forEach((key, value) {
      print("$key: $value");
    });
    userInput = stdin.readLineSync();
    invalidCommand = !commands.keys.contains(userInput);
    if (invalidCommand) print("Please pick a valid command...\n");
  } while (invalidCommand);

  return userInput;
}
