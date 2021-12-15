import 'package:json_pagenation_sample/core/result.dart';
import 'package:json_pagenation_sample/data/data_source/json_placeholder_api.dart';
import 'package:json_pagenation_sample/domain/model/post.dart';
import 'package:json_pagenation_sample/domain/model/user.dart';
import 'package:json_pagenation_sample/domain/repository/post_repository.dart';
import 'package:json_pagenation_sample/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final JsonPlaceholderApi _api = JsonPlaceholderApi();

  @override
  Future<Result<List<User>>> getUsers() async {
    return await _api.getUsers();
  }
}
