import 'dart:math';

import 'package:pixabay_mvvm/core/use_case.dart';
import 'package:pixabay_mvvm/domain/model/photo.dart';
import 'package:pixabay_mvvm/domain/repository/photo_repository.dart';
import 'package:pixabay_mvvm/domain/repository/result.dart';

class GetPhotos extends UseCase<Result<List<Photo>>, String> {
  PhotoRepository repository;

  GetPhotos(this.repository);

  @override
  Future<Result<List<Photo>>> call(String query) async {
    final Result<List<Photo>> photos = await repository.getPhotos(query);

    return photos.when(success: (photos) {
      final results = photos
          .getRange(
        0,
        min(10, photos.length),
      ).toList();
      return Result.success(results);
    }, error: (e) {
      return Result.error(e);
    });
  }
}