import 'package:flutter/material.dart';

class ListAndCard extends StatelessWidget {
  const ListAndCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Text('1'),
              ),
              title: Text('King monkey'),
              subtitle: Text('king of monkey'),
              trailing: Icon(Icons.delete),
            ),
          ),
          Card(
            child: ListTile(
              minTileHeight: 100,
              leading: const CircleAvatar(
                child: Text('2'),
              ),
              title: const Text('King monkey'),
              subtitle: const Text('king of monkey'),
              trailing: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                      image: AssetImage('assets/images/monkey1.png'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          const ListTile(
            leading: CircleAvatar(
              child: Text('3'),
            ),
            title: Text('King monkey'),
            subtitle: Text('king of monkey'),
            trailing: Icon(Icons.delete),
          )
        ],
      ),
    );
  }
}
