void main(List<String> args) {
  List<List<List<String>>> cases = [
    [
      ["5", "3", ".", ".", "7", ".", ".", ".", "."],
      ["6", ".", ".", "1", "9", "5", ".", ".", "."],
      [".", "9", "8", ".", ".", ".", ".", "6", "."],
      ["8", ".", ".", ".", "6", ".", ".", ".", "3"],
      ["4", ".", ".", "8", ".", "3", ".", ".", "1"],
      ["7", ".", ".", ".", "2", ".", ".", ".", "6"],
      [".", "6", ".", ".", ".", ".", "2", "8", "."],
      [".", ".", ".", "4", "1", "9", ".", ".", "5"],
      [".", ".", ".", ".", "8", ".", ".", "7", "9"]
    ],
  ];

  for (final testcase in cases) {
    solveSudoku(testcase);
  }
}

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
