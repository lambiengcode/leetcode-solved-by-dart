import '../models/list_node.dart';

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
