void main(List<String> args) {
  List<List<List<int>>> cases = [
    [
      [1, 2, 3, 4, 5],
      [4, 5, 3, 2, 1]
    ],
    [
      [1, 2, 3, 4, 5],
      [4, 3, 5, 1, 2]
    ]
  ];

  for (final testcase in cases) {
    print(validateStackSequences(testcase.first, testcase.last));
  }
}

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
