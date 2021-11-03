import 'package:pixabay_mvvm/data/data_source/api.dart';
import 'package:pixabay_mvvm/domain/model/photo.dart';
import 'package:pixabay_mvvm/domain/repository/photo_repository.dart';
import 'package:pixabay_mvvm/domain/repository/result.dart';

class PixabayPhotoRepositoryImpl implements PhotoRepository {
  final Api api;

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
