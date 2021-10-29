import 'package:dio/dio.dart';
import 'package:pixabay_mvvm/domain/model/photo.dart';

import 'exceptions.dart';

class PixabayDioApi {
  Dio dio;

  PixabayDioApi(this.dio);

  static const baseUrl = 'https://pixabay.com/api/';

  Future<List<Photo>> fetch(String query) async {
    try {
      Response<dynamic> response = await dio.get(
          '$baseUrl?key=17828481-17c071c7f8eadf406822fada3&q=$query&image_type=photo');
      Map<String, dynamic> result = response.data;
      Iterable hits = result['hits'];
      return hits.map((e) => Photo.fromJson(e)).toList();
    } catch (e) {
      throw IllegalStateException('네트워크 에러');
    }
  }
}
