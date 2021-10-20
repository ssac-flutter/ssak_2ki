import 'package:flutter/material.dart';
import 'package:state_management/stream/counter.dart';

class CounterInheritedWidget extends InheritedWidget {
  final Counter counter;

  const CounterInheritedWidget({
    Key? key,
    required this.counter,
    required Widget child,
  }) : super(key: key, child: child);

  static CounterInheritedWidget of(BuildContext context) {
    final CounterInheritedWidget? result = context.dependOnInheritedWidgetOfExactType<CounterInheritedWidget>();
    assert(result != null, 'No FrogColor found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(CounterInheritedWidget oldWidget) {
    return oldWidget.counter.countStream != counter.countStream;
  }

}
