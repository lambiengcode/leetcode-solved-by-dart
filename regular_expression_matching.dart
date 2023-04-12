void main(List<String> args) {
  List<List<String>> cases = [
    ["aa", "a"],
    ["aa", "a*"],
    ["ab", ".*"],
  ];

  for (final testcase in cases) {
    print(isMatch(testcase[0], testcase[1]));
  }
}

bool isMatch(String s, String p) {
  final RegExp regExp = RegExp(p);
  return regExp.stringMatch(s) == s;
}
