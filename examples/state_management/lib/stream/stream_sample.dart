import 'package:flutter/material.dart';
import 'package:state_management/stream/counter_inherited_widget.dart';

class StreamSample extends StatefulWidget {
  const StreamSample({Key? key}) : super(key: key);

  @override
  State<StreamSample> createState() => _StreamSampleState();
}

class _StreamSampleState extends State<StreamSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InheritedWidgetSample'),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${CounterInheritedWidget.of(context).counter.count}'),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    CounterInheritedWidget.of(context).counter.count++;
                  });
                },
                child: const Text('클릭!!'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (innerContext) => NextPage(
                          count:
                              CounterInheritedWidget.of(context).counter.count),
                    ),
                  );
                },
                child: const Text('다음 화면'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  final int count;

  const NextPage({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: Text('$count'),
      ),
    );
  }
}
