import 'package:json_pagenation_sample/core/result.dart';
import 'package:json_pagenation_sample/data/data_source/json_placeholder_api.dart';
import 'package:json_pagenation_sample/domain/model/post.dart';
import 'package:json_pagenation_sample/domain/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final JsonPlaceholderApi _api = JsonPlaceholderApi();

  @override
  Future<Result<List<Post>>> getPosts(int page, int limit) {
    return _api.getPosts(page, limit);
  }
}
