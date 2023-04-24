import 'dart:math';

void main(List<String> args) {
  List<List> cases = [
    [2.00000, 10],
    [2.10000, 3],
    [2.00000, -2],
  ];

  for (final testcase in cases) {
    print(myPow(testcase.first, testcase.last));
  }
}

double myPow(double x, int n) {
  return pow(x, n).toDouble();
}
