import 'package:flutter_test/flutter_test.dart';
import 'package:state_management/stream/stream_sample_view_model.dart';

void main() {
  test('Stream이 잘 동작해야 한다', () async {
    final viewModel = StreamSampleViewModel();

    viewModel.countIncrement();
    Future.delayed(const Duration(seconds: 1));

    viewModel.countIncrement();
    Future.delayed(const Duration(seconds: 1));

    viewModel.countIncrement();
    Future.delayed(const Duration(seconds: 1));

    expect(
      viewModel.countStream,
      emitsInOrder([
        isA<int>(),
        isA<int>(),
        isA<int>(),
      ]),
    );

    viewModel.dispose();
  });
}