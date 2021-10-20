import 'package:flutter/material.dart';
import 'package:state_management/stream/stream_sample_view_model.dart';

class CounterViewModelInheritedWidget extends InheritedWidget {
  final StreamSampleViewModel viewModel;

  const CounterViewModelInheritedWidget({
    Key? key,
    required this.viewModel,
    required Widget child,
  }) : super(key: key, child: child);

  static CounterViewModelInheritedWidget of(BuildContext context) {
    final CounterViewModelInheritedWidget? result = context.dependOnInheritedWidgetOfExactType<CounterViewModelInheritedWidget>();
    assert(result != null, 'No CounterViewModelInheritedWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(CounterViewModelInheritedWidget oldWidget) {
    return true;
  }

}