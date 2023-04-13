class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

void main(List<String> args) {
  List<int> vals = [1, 2, 3, 4, 5];

  print(mergeValue(reverseKGroup(linkedNodes(vals), 2), []));
}

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
