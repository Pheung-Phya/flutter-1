import 'package:flutter/material.dart';
import 'package:time_7_8/home_page.dart';
import 'package:time_7_8/lesson/grid_g.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: Scaffold(body: GridG()));
  }
}
