void main(List<String> args) {
  List<List> cases = [
    [
      [2, 3, 5, 1, 3],
      3
    ],
    [
      [4, 2, 1, 1, 2],
      1
    ],
    [
      [12, 1, 12],
      10
    ],
  ];

  for (final testcase in cases) {
    print(kidsWithCandies(testcase.first, testcase.last));
  }
}

List<bool> kidsWithCandies(List<int> candies, int extraCandies) {
  final List<int> clone = candies.map((e) => e).toList();
  clone.sort((a, b) => b - a);
  int greatest = clone.first;

  final List<bool> result = candies.map((e) {
    return e + extraCandies >= greatest;
  }).toList();

  return result;
}
