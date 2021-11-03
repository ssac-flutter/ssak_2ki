import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pixabay_mvvm/data/data_source/api.dart';
import 'package:pixabay_mvvm/data/data_source/network/pixabay_api.dart';
import 'package:pixabay_mvvm/data/repository/pixabay_photo_repository_impl.dart';
import 'package:pixabay_mvvm/domain/model/photo.dart';
import 'package:pixabay_mvvm/domain/repository/result.dart';
import 'package:pixabay_mvvm/domain/use_case/get_photos.dart';

import 'pixabay_photo_repository_impl_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  test('pixabay 데이터를 잘 가져와야 한다', () async {
    final client = MockClient();
    final api = PixabayApi(client: client);
    final repository = PixabayPhotoRepositoryImpl(api);
    final getPhotosUseCase = GetPhotos(repository);

    // 가정
    when(client.get(Uri.parse(
            '${Api.baseUrl}?key=17828481-17c071c7f8eadf406822fada3&q=iphone&image_type=photo')))
        .thenAnswer((realInvocation) async => http.Response(testResults, 200));

    // 수행
    final results = await getPhotosUseCase.call('iphone');

    expect(results, isA<Success<List<Photo>>>()); // 타입 매칭

    expect((results as Success<List<Photo>>).data.length, 10);

    verify(client.get(Uri.parse(
        '${Api.baseUrl}?key=17828481-17c071c7f8eadf406822fada3&q=iphone&image_type=photo')));
  });

  test('pixabay 데이터를 잘 가져와야 한다 2', () async {});
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
