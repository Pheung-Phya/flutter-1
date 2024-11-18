import 'package:flutter/material.dart';

class ListV extends StatelessWidget {
  const ListV({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: 30,
            itemBuilder: (context, index) {
              return showCard(index);
            }));
  }

  Widget showCard(int item) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text('$item'),
        ),
        title: const Text('King monkey'),
        subtitle: const Text('king of monkey'),
        trailing: const Icon(Icons.delete),
      ),
    );
  }
}
