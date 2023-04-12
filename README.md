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