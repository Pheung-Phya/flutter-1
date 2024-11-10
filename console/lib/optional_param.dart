import 'dart:io';

void main(List<String> args) {
  List<Map<String, dynamic>> list = [];
  int? id;
  String? name;
  String? gender;
  double? salary;

  do {
    stdout.write(
        '\nChoose an operation:\n1. Create\n2. Read\n3. Search\n4. Update\n5. Sort\n');
    stdout.write('Enter choice : ');
    int op = int.parse(stdin.readLineSync()!);
    switch (op) {
      case 1:
        {
          int? count;
          stdout.write('Enter count : ');
          count = int.parse(stdin.readLineSync()!);
          for (int i = 0; i < count; i++) {
            stdout.write('Enter Id : ');
            id = int.parse(stdin.readLineSync()!);
            stdout.write('Enter Name : ');
            name = stdin.readLineSync()!;
            stdout.write('Enter Gender : ');
            gender = stdin.readLineSync()!;
            stdout.write('Enter Salary : ');
            salary = double.parse(stdin.readLineSync()!);
            list.add(
                {'id': id, 'name': name, 'gender': gender, 'salary': salary});
          }
          break;
        }
      case 2:
        {
          for (var item in list) {
            item.forEach((key, value) => stdout.write('$value\t'));
            stdout.write('\n');
          }
          break;
        }
      case 3:
        {
          String? search;
          stdout.write('Enter name to search : ');
          search = stdin.readLineSync()!;
          for (var item in list) {
            item.forEach((key, value) {
              if (item.containsValue(search)) {
                stdout.write('$value\t');
              }
            });
          }
          break;
        }
      case 4:
        {
          String? update;
          stdout.write('Enter name to update : ');
          update = stdin.readLineSync()!;
          for (var item in list) {
            item.forEach((key, value) {
              if (item.containsValue(update)) {
                stdout.write('Enter Id : ');
                id = int.parse(stdin.readLineSync()!);
                stdout.write('Enter Name : ');
                name = stdin.readLineSync()!;
                stdout.write('Enter Gender : ');
                gender = stdin.readLineSync()!;
                stdout.write('Enter Salary : ');
                salary = double.parse(stdin.readLineSync()!);
                list.remove(item);
                list.add({
                  'id': id,
                  'name': name,
                  'gender': gender,
                  'salary': salary
                });
              }
            });
          }
          break;
        }
      case 5:
        {
          list.sort((key1, key2) => key1['name'].compareTo(key2['name']));
          list.forEach((element) {
            element.forEach((key, value) => stdout.write('$value\t'));
            print('\n');
          });
          break;
        }
    }
  } while (true);
}
