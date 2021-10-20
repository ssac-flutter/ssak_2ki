import 'package:flutter/material.dart';
import 'package:state_management/stream/counter_view_model_inherited_widget.dart';

class StreamSample extends StatelessWidget {
  const StreamSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = CounterViewModelInheritedWidget.of(context).viewModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text('StreamSample'),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder<int>(
                initialData: 0,
                stream: viewModel.countStream,
                builder: (context, snapshot) {
                  return Text('${snapshot.data!}');
                },
              ),
              ElevatedButton(
                onPressed: () {
                  viewModel.countIncrement();
                },
                child: const Text('클릭!!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
