
import 'package:flutter/material.dart';

class BasicAppBar extends StatelessWidget {
  const BasicAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 123, 119, 119),
          leading: const Icon(Icons.menu),
          centerTitle: true,
          title: const Text(
            'My First App',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),
          ),
          actions: const [
            Icon(
              Icons.settings,
              size: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.exit_to_app,
              size: 30,
            ),
            SizedBox(
              width: 10,
            )
          ],
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(50), child: Text('')),
        ),
      );
  }
}
