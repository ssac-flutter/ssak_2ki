import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pixabay_mvvm/domain/model/photo.dart';
import 'package:pixabay_mvvm/domain/repository/photo_repository.dart';
import 'package:pixabay_mvvm/domain/repository/result.dart';
import 'package:pixabay_mvvm/domain/use_case/get_photos_use_case.dart';
import 'package:pixabay_mvvm/domain/use_case/main_use_cases.dart';
import 'package:pixabay_mvvm/presentation/main/main_view_model.dart';

import 'main_view_model_test.mocks.dart';

@GenerateMocks([PhotoRepository])
void main() {
  final repository = MockPhotoRepository();
  final useCases = MainUseCases(getPhotos: GetPhotosUseCase(repository));
  final viewModel = MainViewModel(useCases);

  test('가져오는 사진 정보는 10개 이하여야 한다', () async {
    // 가정
    when(repository.getPhotos('iphone'))
        .thenAnswer((realInvocation) async => Result.success(test10PhotoList));
    // 실행
    await viewModel.fetch('iphone');
    // 확인
    expect(viewModel.state.value.photos.length, 10);
    // 검증
    verify(repository.getPhotos('iphone'));

    // 가정
    when(repository.getPhotos('iphone'))
        .thenAnswer((realInvocation) async => Result.success(test9PhotoList));
    // 실행
    await viewModel.fetch('iphone');
    // 확인
    expect(viewModel.state.value.photos.length, 9);
    // 검증
    verify(repository.getPhotos('iphone'));

    // 가정
    when(repository.getPhotos('iphone'))
        .thenAnswer((realInvocation) async => Result.success(test11PhotoList));
    // 실행
    await viewModel.fetch('iphone');
    // 확인
    expect(viewModel.state.value.photos.length, 10);
    // 검증
    verify(repository.getPhotos('iphone'));
  });
}

final test10PhotoList = [
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

final test9PhotoList = [
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

final test11PhotoList = [
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
