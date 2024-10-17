import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String Title;
  final double? height;
  const BasicAppButton(
      {super.key, required this.onPressed, required this.Title, this.height});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            minimumSize: Size.fromHeight(height ?? 50)),
        child: Text(
          Title,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        ));
  }
  
}
