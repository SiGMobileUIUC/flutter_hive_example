import 'package:hive/hive.dart';

import '../models/user.dart';

class LocalStorageService {
  // Get a reference to the user box
  final Box userBox = Hive.box<User>('users');

  // Function to put a user in the box
  void putUser(User user) {
    userBox.put(user.id, user);
  }

  // Function to get a user from the box
  User? getUser({required String id}) {
    return userBox.get(id);
  }

  // Function to remove a user from the box
  void removeUser({required String id}) {
    userBox.delete(id);
  }

  // Function to remove all users from the box
  void clearLocalStorage() {
    userBox.clear();
  }
}
