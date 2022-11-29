import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  final String id;
  @HiveField(1, defaultValue: "John")
  final String firstName;
  @HiveField(2, defaultValue: "Doe")
  final String lastName;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  @override
  String toString() {
    return "User(id: $id, firstName: $firstName, lastName: $lastName)";
  }
}
