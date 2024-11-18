import 'package:flutter/material.dart';

class TesBody extends StatelessWidget {
  const TesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(child: Image.asset("assets/images/monkey1.png")));
  }
}
