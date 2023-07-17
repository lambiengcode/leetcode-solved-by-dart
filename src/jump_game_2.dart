import 'dart:math';

void main(List<String> args) {
  List<List<int>> cases = [
    [2, 3, 1, 1, 4],
    [2, 3, 0, 1, 4]
  ];

  for (final testcase in cases) {
    print(jump(testcase));
  }
}

int jump(List<int> nums) {
  if (nums.isEmpty) return 0;

  int result = 0;
  int maxNumber = 0;
  int cur = 0;

  for (var i = 0; i < nums.length - 1; i++) {
    maxNumber = max(maxNumber, i + nums[i]);
    if (i == cur) {
      result++;
      cur = maxNumber;
    }
  }

  return result;
}
