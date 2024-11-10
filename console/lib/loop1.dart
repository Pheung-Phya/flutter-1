import 'dart:io';

void main(List<String> args) {
  double totalSum = sum1() + sum()!;

  stdout.write('${sum()} + ${sum1()} = $totalSum');
}

double? sum() => 10 + 20;

double sum1() => 30 + 40;

double sum2() {
  return 2;
}
