import 'dart:math';

void main(List<String> args) {
  List<List<int>> cases = [
    [0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1],
    [4, 2, 0, 3, 2, 5],
    [9, 6, 8, 8, 5, 6, 3],
  ];

  for (final testcase in cases) {
    print(trap(testcase));
  }
}

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
