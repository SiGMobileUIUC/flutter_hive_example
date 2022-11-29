import 'package:flutter/material.dart';
import 'package:flutter_hive_example/screens/add_user_screen/add_user_screen.dart';
import 'package:flutter_hive_example/screens/home_screen/home_screen.dart';
import 'package:flutter_hive_example/screens/users_screen/users_screen.dart';
import 'package:flutter_hive_example/services/local_storage_service.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

void main() async {
  // Initialize Hive for Flutter
  await Hive.initFlutter();
  // Register the UserAdapter so that Hive can read and write User objects
  Hive.registerAdapter(UserAdapter());

  // Open the settings box
  await Hive.openBox('settings');
  // Open the users box that can only hold User objects
  await Hive.openBox<User>('users');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      // Create a Provider that provides an instance of the LocalStorageService class to the whole app
      create: (_) => LocalStorageService(),
      child: MaterialApp(
        title: 'Flutter Hive Example',
        routes: {
          '/': (_) => const HomeScreen(),
          '/users': (_) => const UsersScreen(),
          '/addUser': (_) => const AddUserScreen(),
        },
        initialRoute: '/',
      ),
    );
  }
}
