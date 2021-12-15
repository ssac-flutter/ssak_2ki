import 'package:json_pagenation_sample/core/result.dart';
import 'package:json_pagenation_sample/domain/model/post.dart';

abstract class PostRepository {
  Future<Result<List<Post>>> getPosts(int page, int limit);
}
