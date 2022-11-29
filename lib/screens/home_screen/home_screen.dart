import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Hive Example'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ValueListenableBuilder<Box>(
              valueListenable: Hive.box('settings').listenable(),
              builder: (context, box, widget) {
                return Switch(
                  value: box.get('darkMode', defaultValue: false),
                  onChanged: (val) {
                    box.put('darkMode', val);
                  },
                );
              },
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/users');
              },
              child: const Text('Users'),
            ),
          ],
        ),
      ),
    );
  }
}
