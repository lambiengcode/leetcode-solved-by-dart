## :lion: Leetcode

### String to Int - Atoi

```dart
int myAtoi(String s) {
  // Base condition
  if (s.length < 1) {
    return 0;
  }
  // MAX and MIN values for integers
  final int max = 2147483647;
  final int min = -2147483648;

  s = s.trim();

  // Counter
  int i = 0;
  // Flag to indicate if the number is negative
  bool isNegative = s.startsWith("-");
  // Flag to indicate if the number is positive
  bool isPositive = s.startsWith("+");

  if (isNegative) {
    i++;
  } else if (isPositive) {
    i++;
  }

  // This will store the converted number
  double number = 0;
  // Loop for each numeric character in the sing iff numeric characters are leading
  // characters in the sing
  while (i < s.length &&
      s[i].codeUnitAt(0) >= '0'.codeUnitAt(0) &&
      s[i].codeUnitAt(0) <= '9'.codeUnitAt(0)) {
    number = number * 10 + (s[i].codeUnitAt(0) - '0'.codeUnitAt(0));
    i++;
  }
  // Give back the sign to the converted number
  number = isNegative ? -number : number;
  if (number < min) {
    return min;
  }
  if (number > max) {
    return max;
  }
  return number.round();
}
```

### Is Palindrome

```dart
bool isPalindrome(int x) {
  final String str = x.toString();
  return str == str.split('').reversed.join().toString();
}

```

### Regular Expression Matching

```dart
bool isMatch(String s, String p) {
  final RegExp regExp = RegExp(p);
  return regExp.stringMatch(s) == s;
}
```

### Container with most water

```dart
int maxArea(List<int> height) {
  int max = 0;

  int left = 0;
  int right = height.length - 1;

  while (left < right) {
    final res = min(height[left], height[right]) * (right - left);

    if (res > max) max = res;

    if (height[left] < height[right]) {
      left++;
    } else {
      right--;
    }
  }

  return max;
}
```

### Integer to Roman

```dart
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
```

### Validate Stack Sequences

```dart
bool validateStackSequences(List<int> pushed, List<int> popped) {
  List<int> current = [];
  int indexPush = 0;
  int indexPop = 0;

  while (indexPush < pushed.length - 1 || indexPop < popped.length - 1) {
    if (current.contains(popped[indexPop])) {
      if (current.last == popped[indexPop]) {
        current.removeLast();
        indexPop++;
      } else {
        return false;
      }
    } else {
      current.add(pushed[indexPush]);
      indexPush++;
    }
  }

  return true;
}
```