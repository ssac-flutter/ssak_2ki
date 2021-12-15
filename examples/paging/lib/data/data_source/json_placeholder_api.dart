import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:json_pagenation_sample/core/result.dart';
import 'package:json_pagenation_sample/domain/model/post.dart';
import 'package:json_pagenation_sample/domain/model/user.dart';

class JsonPlaceholderApi {
  static String baseUrl = 'https://jsonplaceholder.typicode.com';

  final http.Client _client;

  JsonPlaceholderApi({http.Client? client}) : _client = client ?? http.Client();

  Future<Result<List<Post>>> getPosts(int page, int limit) async {
    try {
      final response = await _client
          .get(Uri.parse('$baseUrl/posts?_page=$page&_limit=$limit'));

      Iterable jsonResponse = jsonDecode(response.body);
      return Result.success(jsonResponse.map((e) => Post.fromJson(e)).toList());
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<List<User>>> getUsers() async {
    try {
      final response = await _client.get(Uri.parse('$baseUrl/users/'));

      Iterable jsonResponse = jsonDecode(response.body);
      return Result.success(jsonResponse.map((e) => User.fromJson(e)).toList());
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
