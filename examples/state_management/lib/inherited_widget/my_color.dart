import 'package:flutter/material.dart';

class MyColor extends InheritedWidget {
  final Color color;

  const MyColor({
    Key? key,
    required this.color,
    required Widget child,
  }) : super(key: key, child: child);

  static MyColor of(BuildContext context) {
    final MyColor? result = context.dependOnInheritedWidgetOfExactType<MyColor>();
    assert(result != null, 'No FrogColor found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}