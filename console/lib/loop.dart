

void main(List<String> args) {
  Map<String, dynamic> map = {
    '1': 'apple',
    '2': 'banana',
    '3': 'pineaple',
    '4': 'peach'
  };
  List<Map<String, dynamic>> list = [];
  list.add(map);
 
  for(var item in list){
    item.forEach((key, value) => print('$value'),);
  }

}
