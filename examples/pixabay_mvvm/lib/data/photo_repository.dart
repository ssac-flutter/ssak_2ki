import 'package:pixabay_mvvm/model/photo.dart';

abstract class PhotoRepository {
  Future<List<Photo>> getPhotos(String query);
}
