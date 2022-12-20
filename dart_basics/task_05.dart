import 'dart:io';

const Map<String, String> commands = {
  "a": "Add a customer",
  "r": "Remove a customer",
  "v": "View all customers",
  "x": "Exit"
};

// Add, delete, view customers
void main() {
  List<Customer> customers = [];

  print("* * * Welcome to your customer database * * *");
  do {
    customers.length == 0
        ? print("Your customer list is empty.\n")
        : print("Your have ${customers.length} customer(s).\n");
    final String? command = getCommand();
    if (command == "x") break;
    customers = doCommandOnCustomers(command, customers);
  } while (true);
  print("Goodbye...");
}

List<Customer> doCommandOnCustomers(command, customers) {
  switch (command) {
    case "a":
      customers = addCustomer(customers);
      break;
    case "r":
      customers = removeCustomer(customers);
      break;
    case "v":
      viewCustomers(customers);
      break;
  }
  return customers;
}

List<Customer> addCustomer(List<Customer> customers) {
  print("\n-= Add new customer =-");
  stdout.write("Name: ");
  String customerName = stdin.readLineSync() ?? "unknown name";
  Customer newcustomer = Customer(name: customerName);

  stdout.write("Age: ");
  String customerAge = stdin.readLineSync() ?? "unknown age";
  newcustomer.setAge = customerAge;

  customers.add(newcustomer);
  return customers;
}

List<Customer> removeCustomer(List<Customer> customers) {
  String? userInput;
  int? customerIndex;

  do {
    viewCustomers(customers);
    stdout.write("Enter a number to remove the customer or 'x' to exit: ");
    userInput = stdin.readLineSync();
    customerIndex = int.tryParse(userInput!);
    customers = removeCustomerByIndex(customerIndex, customers);
    if (customers.length == 0) print("No customers left... ");
  } while (userInput != "x" && customers.length > 0);
  return customers;
}

List<Customer> removeCustomerByIndex(
    int? customerIndex, List<Customer> customers) {
  if (customerIndex == null) return customers;
  if (0 <= customerIndex && customerIndex < customers.length)
    customers.removeAt(customerIndex);
  return customers;
}

void viewCustomers(List<Customer> customers) {
  print("\n-= Your customers =-");
  customers.asMap().forEach((int index, Customer customer) {
    print("$index: ${customer.details}");
  });
}

class Customer {
  String name;
  String? age = "unknown";

  // Constructor
  Customer({required this.name});

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
