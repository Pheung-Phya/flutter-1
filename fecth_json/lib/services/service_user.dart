import 'dart:io';
import 'dart:convert';
import 'package:fecth_json/repository/users.dart';
import 'package:flutter/services.dart' show rootBundle;

class UserService {
  // Future<String> get _localPath async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   print(directory.path);
  //   return directory.path;
  // }
  Future<String> get _localPath async {
    return 'D:phya_flutter/fetch_json/assets/';
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/users.json');
  }

  // Copy asset file to local storage if not present
  Future<void> initializeLocalData() async {
    final file = await _localFile;
    if (!(await file.exists())) {
      final data = await rootBundle.loadString('assets/users.json');
      await file.writeAsString(data);
    }
  }

  // Future<List<Users>> fetchUsers() async {
  //   final file = await _localFile;
  //   final data = json.decode(await file.readAsString());
  //   return (data as List).map((json) => Users.fromJson(json)).toList();
  // }

  Future<List<Users>> fetchUsers() async {
    final String response = await rootBundle.loadString('assets/users.json');
    final List<dynamic> data = json.decode(response);

    return data.map((json) => Users.fromJson(json)).toList();
  }

  Future<void> addUser(Users user) async {
    final file = await _localFile;
    final data = json.decode(await file.readAsString()) as List;
    data.add(user.toJson());
    await file.writeAsString(json.encode(data));
  }

  Future<void> updateUser(Users updatedUser) async {
    final file = await _localFile;
    final data = json.decode(await file.readAsString()) as List;
    final index = data.indexWhere((user) => user['id'] == updatedUser.id);
    if (index != -1) {
      data[index] = updatedUser.toJson();
      await file.writeAsString(json.encode(data));
    }
  }

  Future<void> deleteUser(int id) async {
    final file = await _localFile;
    final data = json.decode(await file.readAsString()) as List;
    data.removeWhere((user) => user['id'] == id);
    await file.writeAsString(json.encode(data));
  }
}
