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
  // TextEditingController so that we can get the text in the User Id TextField anywhere in this widget
  final TextEditingController idController = TextEditingController();
  // The user object to display. It is initially null and also when no user with the id is found in local storage
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
              // TextField so that the user can input the user id to get
              Expanded(
                child: TextField(
                  controller: idController,
                  decoration: const InputDecoration(labelText: 'Enter User Id'),
                ),
              ),
              IconButton(
                onPressed: () {
                  // Set the user to the value gotten from the local storage
                  setState(() {
                    user = localStorageService.getUser(id: idController.text);
                  });
                },
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  // Remove the user from local storage, clear the text field and stop displaying the user
                  setState(() {
                    localStorageService.removeUser(id: idController.text);
                    idController.clear();
                    user = null;
                  });
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
          // If the user is not null, display it
          if (user != null) UserWidget(user: user!),
        ],
      ),
      // Button to go the add user screen
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/addUser');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
