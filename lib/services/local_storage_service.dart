import 'package:hive/hive.dart';

import '../models/user.dart';

class LocalStorageService {
  final Box userBox = Hive.box<User>('users');

  void putUser(User user) {
    userBox.put(user.id, user);
  }

  User? getUser({required String id}) {
    return userBox.get(id);
  }

  void removeUser({required String id}) {
    userBox.delete(id);
  }

  void clearLocalStorage() {
    userBox.clear();
  }
}
