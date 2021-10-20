import 'dart:async';

class Counter {
  final _countStreamController = StreamController<int>()..add(0);

  Stream<int> get countStream => _countStreamController.stream;

  int _count = 0;

  // Stream에서 필요 없는 놈
  int count = 0;

  void increment() {
    _count++;
    _countStreamController.add(_count);
  }
}
