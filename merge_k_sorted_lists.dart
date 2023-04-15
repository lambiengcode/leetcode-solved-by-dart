import 'helpers/list_node_helper.dart';
import 'models/list_node.dart';

void main(List<String> args) {
  List<List<List<int>>> cases = [
    [
      [1, 4, 5],
      [1, 3, 4],
      [2, 6]
    ],
    [],
    [[]],
  ];

  for (final testcase in cases) {
    print(
      mergeValue(mergeKLists(testcase.map((e) => linkedNodes(e)).toList()), []),
    );
  }
}

ListNode? mergeKLists(List<ListNode?> lists) {
  List<int> merge = [];

  for (final list in lists) {
    merge.addAll(mergeValue(list, []));
  }

  merge.sort();

  return linkedNodes(merge);
}
