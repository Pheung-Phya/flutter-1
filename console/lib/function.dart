void main(List<String> args) {
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
    item.forEach((key, value)=>print('$key : $value'),);
  }
}
