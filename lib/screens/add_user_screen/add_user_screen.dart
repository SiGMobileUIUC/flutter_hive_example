import 'package:flutter/material.dart';
import 'package:flutter_hive_example/services/local_storage_service.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  // TextEditingControllers for each TextField so that the value in the TextFields can be accessed from anywhere in the
  // widget
  final TextEditingController idController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Get the instance of the LocalStorageService class so that we call Hive functions
    final LocalStorageService localStorageService = Provider.of<LocalStorageService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
      ),
      body: Column(
        children: [
          // TextField for getting user id
          TextField(
            controller: idController,
            decoration: const InputDecoration(labelText: 'User Id'),
          ),
          // TextField for getting user's first name
          TextField(
            controller: firstNameController,
            decoration: const InputDecoration(labelText: 'First Name'),
          ),
          // TextField for getting user's last name
          TextField(
            controller: lastNameController,
            decoration: const InputDecoration(labelText: 'Last Name'),
          ),
          // Button to add the user to local storage (Hive box)
          OutlinedButton(
            onPressed: () {
              localStorageService.putUser(
                User(
                  // Getting the current text in the TextFields
                  id: idController.text,
                  firstName: firstNameController.text,
                  lastName: lastNameController.text,
                ),
              );
              // Go back to the previous screen after adding the user
              Navigator.of(context).pop();
            },
            child: const Text('Add User'),
          ),
        ],
      ),
    );
  }
}
