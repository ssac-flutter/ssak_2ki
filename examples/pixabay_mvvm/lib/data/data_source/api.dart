import 'package:pixabay_mvvm/domain/model/photo.dart';
import 'package:pixabay_mvvm/domain/repository/result.dart';

abstract class Api {
  static const baseUrl = 'https://pixabay.com/api/';

  Future<Result<List<Photo>>> fetch(String query);
}
