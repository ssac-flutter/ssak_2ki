
import 'package:flutter/material.dart';
import 'package:provider_sample/data/counter.dart';

class HomeViewModel with ChangeNotifier {
  final counter = Counter();

  int get count => counter.count;

  void increase() {
    counter.increase();
    notifyListeners();
  }
}