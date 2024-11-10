void main(List<String> args) {
  fetchData();
  Map<String, dynamic> map = {
    'id': 10,
    'name': 'Taka',
    'gender': 'Male',
    'salary': 900
  };

  List<Map<String, dynamic>> list = [
    {'id': 11, 'name': "Sasa", 'gender': 'Female', 'salary': 550}
  ];
  list.add(map);

  for (var item in list) {
    item.forEach(
      (key, value) => print('$key : $value'),
    );
  }
}

Future<void> fetchData() async {
  print('Fetching data...');
  await Future.delayed(Duration(seconds: 2)); // Simulate a delay
  print('Data fetched');
}
