import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  const FilterButton(
      {super.key, required this.title, required this.isSelected});
  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: MaterialButton(
        color: isSelected ? Colors.green : Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Colors.green)),
        onPressed: () {},
        child: Text(
          title,
          style: TextStyle(color: isSelected ? Colors.white : Colors.green),
        ),
      ),
    );
  }
}
