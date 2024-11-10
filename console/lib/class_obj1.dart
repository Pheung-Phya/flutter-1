Future fetchData(int second, String msg) {
  Duration duration = Duration(seconds: second);
  return Future.delayed(duration).then((value) => msg);
}

void main() async {
  print('hello world');

  await fetchData(2, 'how are you').then(
    (value) => print(value),
  );
  print('hi');
}
