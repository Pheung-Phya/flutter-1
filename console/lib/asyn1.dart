import 'dart:io';

class Person {
  late int id;
  late String name;
  late String gender;
  late double salary;

  Person.newInstance() ;
  Person(
      {required this.id,
      required this.name,
      required this.gender,
      required this.salary});
  

  void output() {
    stdout.write('$id $name $gender $salary');
  }
}

void main(List<String> args) {
  
  Person p = Person(gender: 'male', id: 10, name: 'taka', salary: 1000);
  p.output();
}
