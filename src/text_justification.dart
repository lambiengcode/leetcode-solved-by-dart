void main(List<String> args) {
  List<List> cases = [
    [
      ["This", "is", "an", "example", "of", "text", "justification."],
      16,
    ],
    [
      ["a", "b", "c", "d", "e"],
      3
    ],
    [
      ["Listen", "to", "many,", "speak", "to", "a", "few."],
      6,
    ],
    [
      [
        "ask",
        "not",
        "what",
        "your",
        "country",
        "can",
        "do",
        "for",
        "you",
        "ask",
        "what",
        "you",
        "can",
        "do",
        "for",
        "your",
        "country"
      ],
      16,
    ],
    [
      [
        "Give",
        "me",
        "my",
        "Romeo;",
        "and,",
        "when",
        "he",
        "shall",
        "die,",
        "Take",
        "him",
        "and",
        "cut",
        "him",
        "out",
        "in",
        "little",
        "stars,",
        "And",
        "he",
        "will",
        "make",
        "the",
        "face",
        "of",
        "heaven",
        "so",
        "fine",
        "That",
        "all",
        "the",
        "world",
        "will",
        "be",
        "in",
        "love",
        "with",
        "night",
        "And",
        "pay",
        "no",
        "worship",
        "to",
        "the",
        "garish",
        "sun."
      ],
      25
    ],
    [
      ["What", "must", "be", "acknowledgment", "shall", "be"],
      16,
    ],
    [
      [
        "Science",
        "is",
        "what",
        "we",
        "understand",
        "well",
        "enough",
        "to",
        "explain",
        "to",
        "a",
        "computer.",
        "Art",
        "is",
        "everything",
        "else",
        "we",
        "do"
      ],
      20,
    ]
  ];

  for (final testcase in cases) {
    print(fullJustify(testcase.first, testcase.last));
  }
}

List<String> fullJustify(List<String> words, int maxWidth) {
  final List<String> result = [];
  String temp = '';

  for (int index = 0; index < words.length; index++) {
    final String word = words[index];

    if (temp.length + word.length + (temp.isEmpty ? 0 : 1) <= maxWidth) {
      temp += '${temp.isEmpty ? '' : ' '}$word';
    } else {
      if (temp.trim().isNotEmpty) {
        result.add(temp.trim());
      }
      temp = word;
    }

    if (index == words.length - 1 && temp.isNotEmpty) {
      result.add(temp.trim());
    }
  }

  return fillSpace(result, maxWidth);
}

List<String> fillSpace(List<String> words, int maxWidth) {
  for (int i = 0; i < words.length; i++) {
    final String word = words[i];
    if (word.length < maxWidth) {
      final List<String> splits = word.split(' ');
      if (splits.length < 2 || i == words.length - 1) {
        words[i] =
            word + List.generate(maxWidth - word.length, (index) => ' ').join();
      } else {
        int leftSpace = maxWidth - word.length + splits.length - 1;
        String temp = '';

        for (int j = 0; j < splits.length; j++) {
          final double div = leftSpace / (splits.length - j);
          int avgSpace = div.round();
          if (leftSpace / avgSpace > 0) {
            avgSpace = div.ceil();
          }

          if (j == 0) {
            temp += splits[j];
          } else if (leftSpace > 0) {
            final int cal = leftSpace < avgSpace ? leftSpace : avgSpace;
            temp += '${List.generate(cal, (index) => ' ').join()}${splits[j]}';
            leftSpace -= cal;
          }
        }

        words[i] = temp;
      }
    }
  }

  return words;
}
