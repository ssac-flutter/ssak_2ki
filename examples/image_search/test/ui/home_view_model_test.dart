import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:image_search/model/hits.dart';
import 'package:image_search/ui/home_view_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_view_model_test.mocks.dart';
import 'test_data.dart';

@GenerateMocks([http.Client])
void main() {
  test('Pixabay 데이터는 1355개여야 한다', () async {
    final viewModel = HomeViewModel();

    final client = MockClient();

    when(client.get(Uri.parse(
            'https://pixabay.com/api/?key=17828481-17c071c7f8eadf406822fada3&q=iphone&image_type=photo')))
        .thenAnswer((_) async => http.Response(testResult, 200));

    List<Hits> results = await viewModel.getImage('iphone', client: client);

    expect(results[0].tags, 'laptop, workspace, desk');
    verify(client.get(Uri.parse(
        'https://pixabay.com/api/?key=17828481-17c071c7f8eadf406822fada3&q=iphone&image_type=photo')));
  });
}
