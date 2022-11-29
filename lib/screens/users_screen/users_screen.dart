import 'package:flutter/material.dart';
import 'package:flutter_hive_example/screens/users_screen/user_widget.dart';
import 'package:flutter_hive_example/services/local_storage_service.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final TextEditingController idController = TextEditingController();

  User? user;

  @override
  Widget build(BuildContext context) {
    final LocalStorageService localStorageService = Provider.of<LocalStorageService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Users Screen'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: idController,
                  decoration: const InputDecoration(labelText: 'Enter User Id'),
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    user = localStorageService.getUser(id: idController.text);
                  });
                },
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    localStorageService.removeUser(id: idController.text);
                    user = null;
                    idController.clear();
                  });
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
          if (user != null) UserWidget(user: user!),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/addUser');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
