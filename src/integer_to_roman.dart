void main(List<String> args) {
  List<int> cases = [
    3,
    58,
    1994,
    19,
  ];

  for (final testcase in cases) {
    print(intToRoman(testcase));
  }
}

String intToRoman(int num) {
  // Define roman values and symbols
  final List<int> values = [1000, 500, 100, 50, 10, 5, 1];
  final List<String> romanSymbols = ['M', 'D', 'C', 'L', 'X', 'V', 'I'];

  List<String> result = [];

  for (int index = 0; index < values.length; index++) {
    final int romanValue = values[index];
    final int div = (num / romanValue).floor();

    if (div > 0) {
      num -= div * romanValue;
      result.addAll(
        List.generate(
          div,
          (i) => romanSymbols[index],
        ),
      );
    }

    if (index < values.length - 1) {
      for (int j = index + 1; j < values.length; j++) {
        if (values[j].toString()[0] == '1') {
          final int nextValue = values[j];
          final int combine2Symbols = romanValue - nextValue;
          if (num >= combine2Symbols && num % combine2Symbols <= nextValue) {
            num -= combine2Symbols;
            result.add(romanSymbols[j]);
            result.add(romanSymbols[index]);
          }
        }
      }
    }
  }

  return result.join();
}
