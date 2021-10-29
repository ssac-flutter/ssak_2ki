import 'package:pixabay_mvvm/data/data_source/pixabay_api.dart';
import 'package:pixabay_mvvm/data/data_source/pixabay_dio_api.dart';
import 'package:pixabay_mvvm/domain/repository/photo_repository.dart';
import 'package:pixabay_mvvm/domain/repository/result.dart';
import 'package:pixabay_mvvm/domain/model/photo.dart';

class PixabayPhotoRepositoryImpl implements PhotoRepository {
  final PixabayDioApi api;

  PixabayPhotoRepositoryImpl(this.api);

  @override
  Future<Result<List<Photo>>> getPhotos(String query) async {
    try {
      List<Photo> results = await api.fetch(query);
      return Result.success(results);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
