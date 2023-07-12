void main(List<String> args) {
  List<String> cases = ["23", "", "2", "9"];

  for (final testcase in cases) {
    print(letterCombinations(testcase));
  }
}

const Map<int, List<String>> chars = {
  2: ['a', 'b', 'c'],
  3: ['d', 'e', 'f'],
  4: ['g', 'h', 'i'],
  5: ['k', 'j', 'l'],
  6: ['m', 'n', 'o'],
  7: ['p', 'q', 'r', 's'],
  8: ['t', 'u', 'v'],
  9: ['w', 'x', 'y', 'z'],
};

List<String> letterCombinations(String digits) {
  if (digits.isEmpty) return [];

  final List<String> result = [];

  lookupChar(0, "", digits.length, digits, result);

  return result;
}

void lookupChar(
  int index,
  String res,
  int length,
  String digits,
  List<String> result,
) {
  if (index == digits.length)
    result.add(res);
  else {
    final List<String> letters = chars[int.parse(digits[index])]!;
    for (int i = 0; i < letters.length; i++) {
      lookupChar(index + 1, res + letters[i], length, digits, result);
    }
  }
}
