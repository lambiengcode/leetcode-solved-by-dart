## :lion: Leetcode :seedling:

<img src="https://github.com/lambiengcode/leetcode-solved-by-dart/blob/master/img/leetcode-dart.png?raw=true" width="100%" height="auto"/>

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

### Reverse Nodes in k-Group

```dart
ListNode? reverseKGroup(ListNode? head, int k) {
  final List<int> values = mergeValue(head, []);
  final List<List<int>> chunks = [];

  for (int i = 0; i < values.length; i += k) {
    var end = (i + k < values.length) ? i + k : values.length;
    chunks.add(values.sublist(i, end));
  }

  final List<int> result = [];

  chunks.forEach((e) {
    if (e.length == k)
      result.addAll(e.reversed);
    else
      result.addAll(e);
  });

  return linkedNodes(result);
}

List<int> mergeValue(ListNode? head, List<int> result) {
  if (head == null) return result;

  return mergeValue(head.next, [...result, head.val]);
}

ListNode linkedNodes(List<int> values) {
  List<ListNode> nodes = values.map((e) => ListNode(e)).toList();

  for (int i = 0; i < nodes.length - 1; i++) {
    nodes[i].next = nodes[i + 1];
  }

  return nodes.first;
}
```

### Substring with Concatenation of All Words
```dart
List<int> findSubstring(String s, List<String> words) {
  if (words.isEmpty || s.isEmpty || words.first.isEmpty) return [];

  final List<int> startIndexs = [];

  final int k = words.first.length;
  final int lengthOfMatchWords = words.length * k;
  final listCloned = words.map((e) => e).toList();

  listCloned.sort();

  if (s.length < lengthOfMatchWords) return [];

  for (final word in words.toSet().toList()) {
    final RegExp regExp = RegExp('(?=($word))');
    final Iterable<Match> matches = regExp.allMatches(s);

    if (matches.isEmpty) break;

    for (final match in matches) {
      if (match.start + lengthOfMatchWords <= s.length) {
        final String subString = s.substring(
          match.start,
          match.start + lengthOfMatchWords,
        );

        final List<String> chunks = [];

        for (int i = 0; i < subString.length; i += k) {
          var end = (i + k < subString.length) ? i + k : subString.length;
          chunks.add(subString.substring(i, end));
        }

        chunks.sort();

        // Check match with requiments
        if (chunks.join() == listCloned.join() &&
            !startIndexs.contains(match.start)) {
          startIndexs.add(match.start);
        }
      }
    }
  }

  startIndexs.sort();

  return startIndexs;
}
```

### Longest Valid Parentheses

```dart
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
```

### Merge k Sorted Lists

```dart
ListNode? mergeKLists(List<ListNode?> lists) {
  List<int> merge = [];

  for (final list in lists) {
    merge.addAll(mergeValue(list, []));
  }

  merge.sort();

  return linkedNodes(merge);
}

// Utils
List<int> mergeValue(ListNode? head, List<int> result) {
  if (head == null) return result;

  return mergeValue(head.next, [...result, head.val]);
}

ListNode? linkedNodes(List<int> values) {
  if (values.isEmpty) return null;

  List<ListNode> nodes = values.map((e) => ListNode(e)).toList();

  for (int i = 0; i < nodes.length - 1; i++) {
    nodes[i].next = nodes[i + 1];
  }

  return nodes.first;
}
```

### Kids With the Greatest Number of Candies

```dart
List<bool> kidsWithCandies(List<int> candies, int extraCandies) {
  final List<int> clone = candies.map((e) => e).toList();
  clone.sort((a, b) => b - a);
  int greatest = clone.first;

  final List<bool> result = candies.map((e) {
    return e + extraCandies >= greatest;
  }).toList();

  return result;
}
```

### Sudoku Solver

```dart
void solveSudoku(List<List<String>> board) {
  _solver(board);
}

bool _solver(List<List<String>> board) {
  for (int i = 0; i < board.length; i++) {
    for (int j = 0; j < board.length; j++) {
      if (board[i][j] == '.') {
        for (int k = 1; k <= 9; k++) {
          if (_isValid(board, i, j, k)) {
            board[i][j] = '$k';

            if (_solver(board)) return true;
          }
        }

        board[i][j] = '.';
        return false;
      }
    }
  }

  print(board);

  return true;
}

bool _isValid(List<List<String>> board, int row, int col, int k) {
  for (int i = 0; i < 9; i++) {
    if (board[row][i] == '$k' || board[i][col] == '$k') {
      return false;
    }
  }

  final m = (col / 3).floor() * 3;
  final n = (row / 3).floor() * 3;

  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (board[n + i][m + j] == '$k') {
        return false;
      }
    }
  }

  return true;
}
```

### First Missing Positive

```dart
int firstMissingPositive(List<int> nums) {
  nums = nums.where((e) => e > 0).toSet().toList();
  nums.sort();

  if (nums.isEmpty || nums.first != 1) return 1;

  for (int index = 1; index < nums.length; index++) {
    if (nums[index] - nums[index - 1] != 1) {
      return nums[index - 1] + 1;
    }
  }

  return nums.last + 1;
}
```

### Trapping rain water

```dart
int trap(List<int> height) {
  if (height.length < 2) return 0;

  List<int> left = List.generate(height.length, (index) => 0);

  List<int> right = List.generate(height.length, (index) => 0);

  int result = 0;

  left.first = height.first;
  for (int i = 1; i < height.length; i++) {
    left[i] = max(left[i - 1], height[i]);
  }

  right.last = height.last;
  for (int i = height.length - 2; i >= 0; i--) {
    right[i] = max(right[i + 1], height[i]);
  }

  for (int i = 0; i < height.length; i++) {
    result += min(left[i], right[i]) - height[i];
  }

  return result;
}
```

### Wildcard Matching

```dart
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
```
