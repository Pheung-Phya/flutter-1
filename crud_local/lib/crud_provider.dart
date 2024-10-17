import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLiteProvider with ChangeNotifier {
  Database? _database;
  List<Map<String, dynamic>> _records = [];

  List<Map<String, dynamic>> get records => _records;

  SQLiteProvider() {
    _initDatabase();
  }

  Future<void> _initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'crud_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE items(id INTEGER PRIMARY KEY, name TEXT)",
        );
      },
      version: 1,
    );
    await _readData();
  }

  Future<void> _readData() async {
    final List<Map<String, dynamic>> result = await _database?.query('items') ?? [];
    _records = result;
    notifyListeners();  // Notify UI of changes
  }

  Future<void> insertData(String name) async {
    await _database?.insert(
      'items',
      {'name': name},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    await _readData();
  }

  Future<void> updateData(int id, String name) async {
    await _database?.update(
      'items',
      {'name': name},
      where: 'id = ?',
      whereArgs: [id],
    );
    await _readData();
  }

  Future<void> deleteData(int id) async {
    await _database?.delete(
      'items',
      where: 'id = ?',
      whereArgs: [id],
    );
    await _readData();
  }
}
