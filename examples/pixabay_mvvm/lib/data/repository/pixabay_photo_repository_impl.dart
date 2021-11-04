import 'package:pixabay_mvvm/data/data_source/api.dart';
import 'package:pixabay_mvvm/domain/model/photo.dart';
import 'package:pixabay_mvvm/domain/repository/photo_repository.dart';
import 'package:pixabay_mvvm/domain/repository/result.dart';

class PixabayPhotoRepositoryImpl implements PhotoRepository {
  final Api api;

  PixabayPhotoRepositoryImpl(this.api);

  @override
  Future<Result<List<Photo>>> getPhotos(String query) async {
    return await api.fetch(query);
  }
}
