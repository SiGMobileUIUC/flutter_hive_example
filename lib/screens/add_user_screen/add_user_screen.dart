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
  final TextEditingController idController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final LocalStorageService localStorageService = Provider.of<LocalStorageService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
      ),
      body: Column(
        children: [
          TextField(
            controller: idController,
            decoration: const InputDecoration(labelText: 'User Id'),
          ),
          TextField(
            controller: firstNameController,
            decoration: const InputDecoration(labelText: 'First Name'),
          ),
          TextField(
            controller: lastNameController,
            decoration: const InputDecoration(labelText: 'Last Name'),
          ),
          OutlinedButton(
            onPressed: () {
              localStorageService.putUser(
                User(
                  id: idController.text,
                  firstName: firstNameController.text,
                  lastName: lastNameController.text,
                ),
              );
              Navigator.of(context).pop();
            },
            child: const Text('Add User'),
          ),
        ],
      ),
    );
  }
}
