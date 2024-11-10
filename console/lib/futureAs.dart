import 'dart:io';

class Info {
  int? id;
  String? name;
  String? gender;
  Info.newInstance();
  Info({required this.id, required this.name, required this.gender});
  void input() {
    stdout.write('Enter Id     : ');
    id = int.parse(stdin.readLineSync()!);
    stdout.write('Enter Name   : ');
    name = stdin.readLineSync()!;
    stdout.write('Enter Gender : ');
    gender = stdin.readLineSync()!;
  }
}

class Person extends Info {
  double? salary;
  Person.newInstance() : super.newInstance();
  Person(
      {required this.salary,
      required super.id,
      required super.name,
      required super.gender});
  @override
  void input() {
    super.input();
    stdout.write('Enter Salary : ');
    salary = double.parse(stdin.readLineSync()!);
  }

  void output() {
    
  }
}

void main(List<String> args) {
  Person p = Person(salary: 10, id: 101, name: "tak", gender: "male");
  p.output();
}
