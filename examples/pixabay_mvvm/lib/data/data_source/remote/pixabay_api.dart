import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pixabay_mvvm/data/data_source/api.dart';
import 'package:pixabay_mvvm/domain/model/photo.dart';
import 'package:pixabay_mvvm/domain/repository/result.dart';

class PixabayApi implements Api {
  final http.Client _client;

  PixabayApi({http.Client? client}) : _client = client ?? http.Client();

  @override
  Future<Result<List<Photo>>> fetch(String query) async {
    try {
      final response = await _client.get(Uri.parse(
          '${Api.baseUrl}?key=17828481-17c071c7f8eadf406822fada3&q=$query&image_type=photo'));

      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      Iterable hits = jsonResponse['hits'];
      return Result.success(hits.map((e) => Photo.fromJson(e)).toList());
    } catch (e) {
      return const Result.error('네트워크 에러');
    }
  }
}
