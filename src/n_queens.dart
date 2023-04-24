void main(List<String> args) {
  List<int> cases = [
    4,
    1,
    5,
  ];

  for (final testcase in cases) {
    print(solveNQueens(testcase));
  }
}

List<List<String>> solveNQueens(int n) {
  final List<List<String>> result = [];
  final List<List<String>> board = List.generate(
    n,
    (index) => List.generate(n, (index) => "."),
  );

  place(0, 0, 0, 0, board, result);

  return result;
}

void place(
  int i,
  int vert,
  int ldiag,
  int rdiag,
  List<List<String>> board,
  List<List<String>> result,
) {
  if (i == board.length) {
    List<String> res = [];
    for (final row in board) res.add(row.join());
    result.add(res);
    return;
  }

  for (int j = 0; j < board.length; j++) {
    int verticalMask = 1 << j,
        leftMask = 1 << (i + j),
        rightMask = 1 << (board.length - i - 1 + j);
    if ((vert & verticalMask) + (ldiag & leftMask) + (rdiag & rightMask) > 0) continue;
    board[i][j] = 'Q';
    place(i + 1, vert | verticalMask, ldiag | leftMask, rdiag | rightMask, board, result);
    board[i][j] = '.';
  }
}
