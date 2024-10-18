import 'package:flutter/material.dart';

class BasicTextInputField extends StatelessWidget {
  const BasicTextInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 58, 55, 55),
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search',
            prefixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            prefixIconColor: Colors.white,
            hintStyle: TextStyle(color: Colors.white)),
      ),
    );
  }
}
