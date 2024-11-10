// import 'package:flutter/material.dart';
// import 'package:flutter_php/models/employee.dart';
// import 'services/employee_service.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Employee CRUD',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: EmployeeListScreen(),
//     );
//   }
// }

// class EmployeeListScreen extends StatefulWidget {
//   @override
//   _EmployeeListScreenState createState() => _EmployeeListScreenState();
// }

// class _EmployeeListScreenState extends State<EmployeeListScreen> {
//   final EmployeeService _employeeService = EmployeeService();
//   List<Employee> _employees = [];
//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _fetchEmployees();
//   }

//   Future<void> _fetchEmployees() async {
//     try {
//       final employees = await _employeeService.getEmployees();
//       setState(() {
//         _employees = employees;
//         _isLoading = false;
//       });
//     } catch (e) {
//       print('Failed to load employees: $e');
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   void _showEmployeeForm([Employee? employee]) async {
//     final result = await showDialog(
//       context: context,
//       builder: (context) {
//         return EmployeeFormDialog(employee: employee);
//       },
//     );

//     if (result == 'refresh') {
//       _fetchEmployees();
//     }
//   }

//   Future<void> _deleteEmployee(int id) async {
//     await _employeeService.deleteEmployee(id);
//     _fetchEmployees();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Employee CRUD'),
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               itemCount: _employees.length,
//               itemBuilder: (context, index) {
//                 final employee = _employees[index];
//                 return ListTile(
//                   title: Text(employee.name),
//                   subtitle: Text('${employee.gender}, \$${employee.salary}'),
//                   trailing: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       IconButton(
//                         icon: Icon(Icons.edit),
//                         onPressed: () => _showEmployeeForm(employee),
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.delete),
//                         onPressed: () => _deleteEmployee(employee.id),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => _showEmployeeForm(),
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

// class EmployeeFormDialog extends StatefulWidget {
//   final Employee? employee;

//   EmployeeFormDialog({this.employee});

//   @override
//   _EmployeeFormDialogState createState() => _EmployeeFormDialogState();
// }

// class _EmployeeFormDialogState extends State<EmployeeFormDialog> {
//   final _formKey = GlobalKey<FormState>();
//   final EmployeeService _employeeService = EmployeeService();
//   late TextEditingController _nameController;
//   late TextEditingController _genderController;
//   late TextEditingController _salaryController;

//   @override
//   void initState() {
//     super.initState();
//     _nameController = TextEditingController(text: widget.employee?.name ?? '');
//     _genderController =
//         TextEditingController(text: widget.employee?.gender ?? 'Male');
//     _salaryController =
//         TextEditingController(text: widget.employee?.salary.toString() ?? '');
//   }

//   Future<void> _saveEmployee() async {
//     if (_formKey.currentState!.validate()) {
//       final name = _nameController.text;
//       final gender = _genderController.text;
//       final salary = double.tryParse(_salaryController.text) ?? 0.0;
//       final employee =
//           Employee(id: 0, name: name, gender: gender, salary: salary);

//       if (widget.employee == null) {
//         await _employeeService.createEmployee(employee);
//       } else {
//         await _employeeService.updateEmployee(employee);
//       }
//       Navigator.of(context).pop('refresh');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text(widget.employee == null ? 'Add Employee' : 'Edit Employee'),
//       content: Form(
//         key: _formKey,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextFormField(
//               controller: _nameController,
//               decoration: InputDecoration(labelText: 'Name'),
//               validator: (value) =>
//                   value!.isEmpty ? 'Please enter a name' : null,
//             ),
//             TextFormField(
//               controller: _genderController,
//               decoration: InputDecoration(labelText: 'Gender (Male/Female)'),
//               validator: (value) => (value != 'Male' && value != 'Female')
//                   ? 'Please enter Male or Female'
//                   : null,
//             ),
//             TextFormField(
//               controller: _salaryController,
//               decoration: InputDecoration(labelText: 'Salary'),
//               keyboardType: TextInputType.number,
//               validator: (value) =>
//                   value!.isEmpty ? 'Please enter a salary' : null,
//             ),
//           ],
//         ),
//       ),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.of(context).pop(),
//           child: Text('Cancel'),
//         ),
//         ElevatedButton(
//           onPressed: () => _saveEmployee,
//           child: Text('Save'),
//         ),
//       ],
//     );
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;

class Employee {
  final int? id;
  final String name;
  final String gender;
  final double salary;

  Employee(
      {this.id,
      required this.name,
      required this.gender,
      required this.salary});

  // Factory method to create an Employee from JSON
  // Factory method to create an Employee from JSON
  // Factory method to create an Employee from JSON
  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'] != null
          ? int.tryParse(json['id'].toString())
          : null, // Convert to int
      name: json['name'],
      gender: json['gender'],
      salary: json['salary'] is String
          ? double.parse(json['salary'])
          : json['salary'].toDouble(), // Convert to double
    );
  }

  // Method to convert Employee to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'gender': gender,
      'salary': salary,
    };
  }
}

class EmployeeService {
  static const String apiUrl =
      "http://localhost:8081/flutter_with_pho/employee_api.php";
  // Fetch all employees
  // Fetch all employees
  Future<List<Employee>> getEmployees() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Employee.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load employees');
    }
  }

  // Create a new employee
  Future<void> createEmployee(Employee employee) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode(employee.toJson()),
    );

    print("Response Status: ${response.statusCode}");
    print("Response Body: ${response.body}");

    if (response.statusCode != 200) {
      throw Exception('Failed to create employee');
    }
  }

  // Update an existing employee
  // Future<void> updateEmployee(Employee employee) async {
  //   final response = await http.put(
  //     Uri.parse(apiUrl),
  //     headers: {"Content-Type": "application/json"},
  //     body: json.encode(employee.toJson()),
  //   );
  //   if (response.statusCode != 200) {
  //     throw Exception('Failed to update employee');
  //   }
  // }

  Future<void> updateEmployee(Employee employee) async {
    if (employee.id == null) {
      throw Exception("Employee ID is required for update");
    }

    final response = await http.put(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode(employee.toJson()),
    );

    if (response.statusCode == 200) {
      print("Employee updated successfully: ${response.body}");
    } else {
      print("Failed to update employee: ${response.statusCode}");
      print("Error: ${response.body}");
      throw Exception('Failed to update employee');
    }
  }

  // Delete an employee
  // Future<void> deleteEmployee(int id) async {
  //   final response = await http.delete(
  //     Uri.parse("$apiUrl?id=$id"),
  //     headers: {"Content-Type": "application/json"},
  //   );
  //   if (response.statusCode != 200) {
  //     throw Exception('Failed to delete employee');
  //   }
  // }

  Future<void> deleteEmployee(int id) async {
    final response = await http.delete(
      Uri.parse(
          "http://localhost:8081/flutter_with_pho/employee_api.php?id=$id"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      print("Employee deleted successfully");
    } else {
      print("Failed to delete employee: ${response.body}");
    }
  }
}

void main() async {
  EmployeeService service = EmployeeService();

  // Create a new employee
  // Employee newEmployee =
  //     Employee(name: "John Doe", gender: "Male", salary: 5000.0);
  // await service.createEmployee(newEmployee);

  // // Fetch all employees
  // List<Employee> employees = await service.getEmployees();
  // print("Employees: ${employees.map((e) => e.name).toList()}");

  // // Update an employee
  // Employee updatedEmployee =
  //     Employee(id: 3, name: "Jane Dog", gender: "Female", salary: 5500.0);
  // await service.updateEmployee(updatedEmployee);

  // Delete an employee
  // await service.deleteEmployee(2);

  List<Employee> employees = await service.getEmployees();
  print('${employees.map((e) => e.name).toList()}');
  print("All Employees: ${employees.map((e) => e.toJson()).toList()}");
  for (var employee in employees) {
    print("ID: ${employee.id}");
    print("Name: ${employee.name}");
    print("Gender: ${employee.gender}");
    print("Salary: \$${employee.salary}");
    print("---------------");
  }
}
