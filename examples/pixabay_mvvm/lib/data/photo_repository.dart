import 'package:pixabay_mvvm/data/result.dart';
import 'package:pixabay_mvvm/model/photo.dart';

abstract class PhotoRepository {
  Future<Result<List<Photo>>> getPhotos(String query);
}
