import 'dart:async';

import 'package:provider_sample/data/counter.dart';

class HomeViewModel {
  final counter = Counter();

  final _streamController = StreamController<int>();

  int get count => counter.count;

  Stream<int> get countStream => _streamController.stream;

  void increase() {
    counter.increase();
    _streamController.add(counter.count);
  }
}