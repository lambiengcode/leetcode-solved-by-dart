void main(List<String> args) {
  List<List<String>> cases = [
    ["aa", "a"],
    ["aa", "*"],
    ["cb", "?=a"],
    ["acdcb", "a*c?b"],
    ["adceb", "*a*b"]
  ];

  for (final testcase in cases) {
    print(isMatch(testcase[0], testcase[1]));
  }
}

bool isMatch(String s, String p) {
  final RegExp regExp = RegExp(p.replaceAll('*', '^g\.*').replaceAll('?', '^g\.?'));
  print(regExp.stringMatch(s));
  return regExp.stringMatch(s) == s;
}
