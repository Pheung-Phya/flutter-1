import 'package:flutter/material.dart';

class AppNavigator {
  static void pushReplacement(BuildContext context, Widget widget) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (conext) => widget));
  }

  static void push(BuildContext context, Widget widget) {
    Navigator.push(
        context, MaterialPageRoute(builder: (conext) => widget));
  }
}
