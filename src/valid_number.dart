void main(List<String> args) {
  List<String> cases = [
    "2",
    "0089",
    "-0.1",
    "+3.14",
    "4.",
    "-.9",
    "2e10",
    "-90E3",
    "3e+7",
    "+6e-1",
    "53.5e93",
    "-123.456e789",
  ];

  for (final testcase in cases) {
    print(isNumber(testcase));
  }
}

bool isNumber(String s) {
  if (s == "Infinity" || s == "-Infinity" || s == "+Infinity") return false;

  return num.tryParse(s) != null;
}
