class Employee {
  final int id;
  final String name;
  final String gender;
  final double salary;

  Employee(
      {required this.id,
      required this.name,
      required this.gender,
      required this.salary});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: int.parse(json['id']),
      name: json['name'],
      gender: json['gender'],
      salary: double.parse(json['salary']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'gender': gender,
      'salary': salary.toString(),
    };
  }
}
