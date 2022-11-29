import 'package:flutter/material.dart';

import '../../models/user.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'First Name: ${user.firstName}',
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            'Last Name: ${user.lastName}',
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
