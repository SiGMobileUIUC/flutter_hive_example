import 'package:flutter/material.dart';
import 'package:flutter_hive_example/screens/add_user_screen/add_user_screen.dart';
import 'package:flutter_hive_example/screens/home_screen/home_screen.dart';
import 'package:flutter_hive_example/screens/users_screen/users_screen.dart';
import 'package:flutter_hive_example/services/local_storage_service.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(UserAdapter());

  await Hive.openBox('settings');
  await Hive.openBox<User>('users');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => LocalStorageService(),
      child: MaterialApp(
        title: 'Demo Settings',
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
