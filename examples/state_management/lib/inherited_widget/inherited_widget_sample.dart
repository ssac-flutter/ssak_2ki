import 'package:flutter/material.dart';
import 'package:state_management/inherited_widget/my_color.dart';

class InheritedWidgetSample extends StatefulWidget {
  const InheritedWidgetSample({Key? key}) : super(key: key);

  @override
  State<InheritedWidgetSample> createState() => _InheritedWidgetSampleState();
}

class _InheritedWidgetSampleState extends State<InheritedWidgetSample> {
  Color _color = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InheritedWidgetSample'),
      ),
      body: Container(
        color: _color,
        child: Center(
          child: ElevatedButton(onPressed: () {
            setState(() {
              _color = MyColor.of(context).color;
            });
          },
            child: const Text('클릭!!'),),
        ),
      ),
    );
  }
}
