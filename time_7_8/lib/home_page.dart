import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      drawer: Drawer(),
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return Container(
            width: 50,
            height: 50,
            child: Image.asset('assets/images/monkey.png'),
          );
        }),
        title: Text('hello'),
      ),
    );
  }
}
