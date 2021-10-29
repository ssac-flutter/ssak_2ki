import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pixabay_mvvm/domain/model/photo.dart';

import 'exceptions.dart';

class PixabayApi {
  final http.Client _client;
  static const baseUrl = 'https://pixabay.com/api/';

  PixabayApi({http.Client? client}) : _client = client ?? http.Client();

  Future<List<Photo>> fetch(String query) async {
    try {
      final response = await _client.get(Uri.parse(
          '$baseUrl?key=17828481-17c071c7f8eadf406822fada3&q=$query&image_type=photo'));

      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      Iterable hits = jsonResponse['hits'];
      return hits.map((e) => Photo.fromJson(e)).toList();
    } catch (e) {
      throw IllegalStateException('네트워크 에러');
    }
  }
}
