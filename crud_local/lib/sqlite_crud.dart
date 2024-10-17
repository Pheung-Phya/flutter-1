import 'package:crud_local/crud_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SQLiteCRUD extends StatelessWidget {
  const SQLiteCRUD({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SQLiteProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('SQLite CRUD with Provider')),
      body: ListView.builder(
        itemCount: provider.records.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(provider.records[index]['name']),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () =>
                      provider.updateData(provider.records[index]['id'], 'Updated Name'),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () =>
                      provider.deleteData(provider.records[index]['id']),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => provider.insertData(' World'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
