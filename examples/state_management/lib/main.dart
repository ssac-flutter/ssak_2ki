import 'package:flutter/material.dart';
import 'package:state_management/inherited_widget/my_color.dart';
import 'package:state_management/stream/counter.dart';
import 'package:state_management/stream/counter_inherited_widget.dart';
import 'package:state_management/stream/stream_sample.dart';

void main() {
  runApp(const MyColor(
    color: Colors.red,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterInheritedWidget(
        counter: Counter(),
        child: const StreamSample(),
      ),
    );
  }
}
