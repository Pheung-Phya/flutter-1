void main(List<String> args) {
  var total = Sum1()! + sum2(12, 13);
  print('Total = $total');
  show();
}

int? Sum1() {
  int x = 10, y = 30;
  return x + y + sum2(10, 20);
}

int sum2(int x, int y) {
  return x + y;
}

void show() => print('how are today');
