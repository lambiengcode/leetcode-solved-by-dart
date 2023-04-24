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
  if (p.replaceAll("*", "").length > s.length) return false;

  List<bool> flags = List.generate(s.length + 1, (index) => false);
  flags.first = true;
  for (int i = 1; i < s.length; ++i) {
    flags[i] = false;
  }

  for (int i = 1; i <= p.length; ++i) {
    String char = p[i - 1];
    if (char == '*') {
      for (int j = 1; j <= s.length; ++j) {
        flags[j] = flags[j - 1] || flags[j];
      }
    } else {
      for (int j = s.length; j >= 1; --j) {
        flags[j] = flags[j - 1] && (char == '?' || char == s[j - 1]);
      }
    }
    flags[0] = flags[0] && char == '*';
  }
  return flags[s.length];
}
