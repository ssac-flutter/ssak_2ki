import 'dart:convert';

import 'package:pixabay_mvvm/data/photo_repository.dart';
import 'package:pixabay_mvvm/data/result.dart';
import 'package:pixabay_mvvm/model/photo.dart';
import 'package:http/http.dart' as http;

class PixabayPhotoRepositoryImpl implements PhotoRepository {
  final http.Client client;
  static const baseUrl = 'https://pixabay.com/api/';

  PixabayPhotoRepositoryImpl(this.client);

  @override
  Future<Result<List<Photo>>> getPhotos(String query) async {
    try {
      final response = await client.get(Uri.parse(
          '$baseUrl?key=17828481-17c071c7f8eadf406822fada3&q=$query&image_type=photo'));

      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      Iterable hits = jsonResponse['hits'];
      return Result.success(hits.map((e) => Photo.fromJson(e)).toList());
    } catch (e) {
      return Result.error(IllegalStateException('너는 뭔가를 잘 못 했다!!!!!'));
    }
  }
}

class IllegalStateException implements Exception {
  final String message;

  IllegalStateException(this.message);

  @override
  String toString() {
    return 'IllegalStateException{message: $message}';
  }
}