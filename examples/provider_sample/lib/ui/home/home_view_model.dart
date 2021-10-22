
import 'package:flutter/material.dart';
import 'package:provider_sample/data/counter_repository.dart';

class HomeViewModel with ChangeNotifier {
  final CounterRepository counter;

  HomeViewModel(this.counter);

  int get count => counter.count;

  void increase() {
    counter.increase();
    notifyListeners();
  }
}