import 'package:pixabay_mvvm/domain/model/photo.dart';

abstract class Api {
  static const baseUrl = 'https://pixabay.com/api/';

  Future<List<Photo>> fetch(String query);
}
