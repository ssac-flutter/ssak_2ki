import 'package:dio/dio.dart';
import 'package:pixabay_mvvm/data/data_source/api.dart';
import 'package:pixabay_mvvm/domain/model/photo.dart';
import 'package:pixabay_mvvm/domain/repository/result.dart';

class PixabayDioApi implements Api {
  final Dio _dio;

  PixabayDioApi({Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<Result<List<Photo>>> fetch(String query) async {
    try {
      Response<dynamic> response = await _dio.get(
          '${Api.baseUrl}?key=17828481-17c071c7f8eadf406822fada3&q=$query&image_type=photo');
      Map<String, dynamic> result = response.data;
      Iterable hits = result['hits'];
      return Result.success(hits.map((e) => Photo.fromJson(e)).toList());
    } catch (e) {
      return const Result.error('네트워크 에러');
    }
  }
}
