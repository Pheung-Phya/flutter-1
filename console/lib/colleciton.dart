import 'dart:io';

void main(List<String> args) {
  Map<String, dynamic> map = {};
  List<Map<String, dynamic>> list = [];
  late int id;
  late String name;
  late String gender;
  late double salary;
  for (int i = 0; i < 2; i++) {
    stdout.write('Enter ID     : ');
    id = int.parse(stdin.readLineSync()!);
    stdout.write('Enter Name   : ');
    name = stdin.readLineSync()!;
    stdout.write('Enter Gender : ');
    gender = stdin.readLineSync()!;
    stdout.write('Enter Salary : ');
    salary = double.parse(stdin.readLineSync()!);
    list.add({'id': id, 'name': name, 'gende': gender, 'salary': salary});
  }

  for (map in list) {
    map.forEach(
      (key, value) {
        stdout.write('$value\t');
      },
    );
    print('');
  }
}
