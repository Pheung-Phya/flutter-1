import 'package:flutter/material.dart';
import 'package:time_7_8/app_bar1.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BasicAppBar1()
    );
  }
}
