import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pixabay_mvvm/data/photo_repository.dart';
import 'package:pixabay_mvvm/model/photo.dart';
import 'package:pixabay_mvvm/ui/main_view_model.dart';

import 'main_view_model_test.mocks.dart';

@GenerateMocks([PhotoRepository])
void main() {
  test('가져오는 사진 정보는 10개여야 한다', () async {
    final repository = MockPhotoRepository();
    final viewModel = MainViewModel(repository);

    // 가정
    when(repository.getPhotos('iphone'))
      .thenAnswer((realInvocation) async => testPhotoList);

    // 실행
    await viewModel.fetch('iphone');

    // 확인
    expect(viewModel.photos.length, min(testPhotoList.length, 10));

    // 검증
    verify(repository.getPhotos('iphone'));
  });
}

final testPhotoList = [
  Photo('test', 'http://aaa'),
  Photo('test', 'http://aaa'),
  Photo('test', 'http://aaa'),
  Photo('test', 'http://aaa'),
  Photo('test', 'http://aaa'),
  Photo('test', 'http://aaa'),
  Photo('test', 'http://aaa'),
  Photo('test', 'http://aaa'),
  Photo('test', 'http://aaa'),
  Photo('test', 'http://aaa'),
  Photo('test', 'http://aaa'),
  Photo('test', 'http://aaa'),
  Photo('test', 'http://aaa'),
];


const testResults = """
[
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
  },
]
""";