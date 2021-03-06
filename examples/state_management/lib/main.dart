import 'package:flutter/material.dart';
import 'package:state_management/inherited_widget/my_color.dart';
import 'package:state_management/stream/counter.dart';
import 'package:state_management/stream/counter_inherited_widget.dart';
import 'package:state_management/stream/counter_view_model_inherited_widget.dart';
import 'package:state_management/stream/inherited_sample_2.dart';
import 'package:state_management/stream/stream_sample.dart';
import 'package:state_management/stream/stream_sample_view_model.dart';

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
      home: CounterViewModelInheritedWidget(
        viewModel: StreamSampleViewModel(),
        child: const StreamSample(),
      ),
    );
  }
}
