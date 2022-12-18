import 'dart:io';

const Map<String, String> commands = {
  "a": "Add a contact",
  "r": "Remove a contact",
  "v": "View all contacts",
  "x": "Exit"
};

// Add, delete, view contacts
void main() {
  String? command;
  List<Contact> contacts = [];

  print("-= Welcome to your contact list =-");
  do {
    command = getCommand();
    switch (command) {
      case "a":
        contacts = addContact(contacts);
        break;
      case "r":
        contacts = removeContact(contacts);
        break;
      case "v":
        viewContacts(contacts);
        break;
    }
    print("\n");
  } while (command != "x");
  print("Goodbye...");
}

List<Contact> addContact(List<Contact> contacts) {
  print("\n-= Add new contact =-");
  stdout.write("Name: ");
  String contactName = stdin.readLineSync() ?? "unknown name";
  Contact newContact = Contact(name: contactName);

  stdout.write("Age: ");
  String contactAge = stdin.readLineSync() ?? "unknown age";
  newContact.setAge = contactAge;

  contacts.add(newContact);
  return contacts;
}

List<Contact> removeContact(List<Contact> contacts) {
  String? userInput;
  int? contactIndex;

  do {
    viewContacts(contacts);
    stdout.write("Enter a number to remove the contact or 'x' to exit: ");
    userInput = stdin.readLineSync();
    contactIndex = int.tryParse(userInput!);
    contacts = removeContactByIndex(contactIndex, contacts);
    if (contacts.length == 0) print("No contacts left... ");
  } while (userInput != "x" && contacts.length > 0);
  return contacts;
}

List<Contact> removeContactByIndex(int? contactIndex, List<Contact> contacts) {
  if (contactIndex == null) return contacts;
  if (0 <= contactIndex && contactIndex < contacts.length)
    contacts.removeAt(contactIndex);
  return contacts;
}

void viewContacts(List<Contact> contacts) {
  print("\n-= Your contacts =-");
  contacts.asMap().forEach((int index, Contact contact) {
    print("$index: ${contact.details}");
  });
}

class Contact {
  String name;
  String? age = "unknown";

  // Constructor
  Contact({required this.name});

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
