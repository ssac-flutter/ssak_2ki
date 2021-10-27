import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pixabay_mvvm/data/pixabay_photo_repository_impl.dart';

import 'pixabay_photo_repository_impl_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  test('pixabay 데이터를 잘 가져와야 한다', () async {
    final client = MockClient();
    final repository = PixabayPhotoRepositoryImpl(client);

    // 가정
    when(client.get(Uri.parse(
            '${PixabayPhotoRepositoryImpl.baseUrl}?key=17828481-17c071c7f8eadf406822fada3&q=iphone&image_type=photo')))
        .thenAnswer((realInvocation) async => http.Response(testResults, 200));

    // 수행
    final results = await repository.getPhotos('iphone');

    expect(results.length, 10);

    verify(client.get(Uri.parse(
        '${PixabayPhotoRepositoryImpl.baseUrl}?key=17828481-17c071c7f8eadf406822fada3&q=iphone&image_type=photo')));
  });
}

const testResults = """
{
  "hits": [
    {
      "previewURL": "http://aaa",
      "tags": "test"
    },
    {
      "previewURL": "http://aaa",
      "tags": "test"
    },
    {
      "previewURL": "http://aaa",
      "tags": "test"
    },
    {
      "previewURL": "http://aaa",
      "tags": "test"
    },
    {
      "previewURL": "http://aaa",
      "tags": "test"
    },
    {
      "previewURL": "http://aaa",
      "tags": "test"
    },
    {
      "previewURL": "http://aaa",
      "tags": "test"
    },
    {
      "previewURL": "http://aaa",
      "tags": "test"
    },
    {
      "previewURL": "http://aaa",
      "tags": "test"
    },
    {
      "previewURL": "http://aaa",
      "tags": "test"
    }
  ]
}
""";
