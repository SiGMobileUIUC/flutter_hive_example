import 'package:hive/hive.dart';

// This part statement tells Dart that the 'user.g.dart' file is a part of this file ('user.dart')
part 'user.g.dart';

// Tells Hive that this is class that I want to store objects of
@HiveType(typeId: 0)
class User {
  // Tells hive to include this field in the storage. Index identifies this field
  @HiveField(0)
  final String id;
  // Tells hive to include this field in the storage. Index identifies this field
  @HiveField(1, defaultValue: "John")
  final String firstName;
  // Tells hive to include this field in the storage. Index identifies this field
  @HiveField(2, defaultValue: "Doe")
  final String lastName;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  // Returns a String representation of a User object for better printing and debugging
  @override
  String toString() {
    return "User(id: $id, firstName: $firstName, lastName: $lastName)";
  }
}
