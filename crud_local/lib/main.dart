import 'package:crud_local/crud_provider.dart';
import 'package:crud_local/sqlite_crud.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
 

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SQLiteProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const SQLiteCRUD(),
    );
  }
}








// import 'package:flutter/material.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   MyApp({super.key});
//   final List<String> items = List<String>.generate(100, (i) => "Item ${i + 1}");
//   @override
//   build(BuildContext context) {
//     return MaterialApp(
//         theme: ThemeData.from(
//             colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//             useMaterial3: true),
//         home:const SQLiteCRUD());
//   }
// }


// class SQLiteCRUD extends StatefulWidget {
//   const SQLiteCRUD({super.key});

//   @override
//   _SQLiteCRUDState createState() => _SQLiteCRUDState();
// }

// class _SQLiteCRUDState extends State<SQLiteCRUD> {
//   Database? database;
//   List<Map<String, dynamic>> records = [];

//   @override
//   void initState() {
//     super.initState();
//     _initDatabase();
//   }

//   Future<void> _initDatabase() async {
//     database = await openDatabase(
//       join(await getDatabasesPath(), 'crud_database.db'),
//       onCreate: (db, version) {
//         return db.execute(
//           "CREATE TABLE items(id INTEGER PRIMARY KEY, name TEXT)",
//         );
//       },
//       version: 1,
//     );
//     await _readData();  // Fetch initial data
//   }

//   Future<void> _insertData(String name) async {
//     await database?.insert(
//       'items',
//       {'name': name},
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//     await _readData();  // Refresh data after insert
//   }

//   Future<void> _readData() async {
//     final List<Map<String, dynamic>> result =
//         await database?.query('items') ?? [];
//     setState(() {
//       records = result;
//     });
//   }

//   Future<void> _updateData(int id, String name) async {
//     await database?.update(
//       'items',
//       {'name': name},
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//     await _readData();  // Refresh data after update
//   }

//   Future<void> _deleteData(int id) async {
//     await database?.delete(
//       'items',
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//     await _readData();  // Refresh data after delete
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title:const Text('SQLite CRUD')),
//       body: ListView.builder(
//         itemCount: records.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(records[index]['name']),
//             trailing: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 IconButton(
//                     icon:const Icon(Icons.edit),
//                     onPressed: () =>
//                         _updateData(records[index]['id'], 'Updated Name')),
//                 IconButton(
//                     icon:const Icon(Icons.delete),
//                     onPressed: () => _deleteData(records[index]['id'])),
//               ],
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => _insertData('Hello world'),
//         child:const Icon(Icons.add),
//       ),
//     );
//   }
// }








