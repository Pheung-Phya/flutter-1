import 'dart:convert';
import 'package:flutter_php/models/employee.dart';
import 'package:http/http.dart' as http;

class EmployeeService {
  static const String apiUrl = "http://localhost:8081/flutter_with_php/employee_api.php";

  Future<List<Employee>> getEmployees() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((e) => Employee.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load employees');
    }
  }

  Future<void> createEmployee(Employee employee) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode(employee.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to create employee');
    }
  }

  Future<void> updateEmployee(Employee employee) async {
    final response = await http.put(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode(employee.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update employee');
    }
  }

  Future<void> deleteEmployee(int id) async {
    final response = await http.delete(
      Uri.parse("$apiUrl?id=$id"),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to delete employee');
    }
  }
}
