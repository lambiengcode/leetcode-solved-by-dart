Duration stopwatch(Function execute) {
  DateTime startTime = DateTime.now();
  execute();
  return DateTime.now().difference(startTime);
}
