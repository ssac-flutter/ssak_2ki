import 'dart:async';

import 'package:state_management/stream/counter.dart';

class StreamSampleViewModel {
  final _counter = Counter();

  final _countStreamController = StreamController<int>();

  Stream<int> get countStream => _countStreamController.stream;

  void countIncrement() {
    _counter.count++;
    _countStreamController.add(_counter.count);
  }

  void dispose() {
    _countStreamController.close();
  }
}