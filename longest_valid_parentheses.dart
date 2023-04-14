import 'dart:math';

void main(List<String> args) {
  List<String> cases = [
    "(()",
    ")()())",
    "",
    "(",
    "))",
    "((()()",
  ];

  for (final testcase in cases) {
    print(longestValidParentheses(testcase));
  }
}

int longestValidParentheses(String s) {
  if (s.isEmpty) return 0;

  int longest = 0;
  final List<int> stack = [-1];

  for (int i = 0; i < s.length; i++) {
    // Open
    if (s[i] == '(') {
      stack.add(i);
    } else {
      if (stack.isNotEmpty) stack.removeLast();

      if (stack.isNotEmpty) {
        longest = max(longest, i - stack.last);
      } else {
        stack.add(i);
      }
    }
  }

  return longest;
}
