import 'package:pixabay_mvvm/domain/repository/result.dart';
import 'package:pixabay_mvvm/domain/model/photo.dart';

abstract class PhotoRepository {
  Future<Result<List<Photo>>> getPhotos(String query);
}
