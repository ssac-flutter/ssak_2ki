import 'package:provider_sample/data/counter_repository.dart';

class Counter implements CounterRepository {
  int _count = 0;

  @override
  int get count => _count;

  @override
  void increase() {
    _count++;
  }
}
