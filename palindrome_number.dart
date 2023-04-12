void main(List<String> args) {
  List<int> cases = [
    121,
    -121,
    10,
  ];

  for (final testcase in cases) {
    print(isPalindrome(testcase));
  }
}

bool isPalindrome(int x) {
  final String str = x.toString();
  return str == str.split('').reversed.join().toString();
}
