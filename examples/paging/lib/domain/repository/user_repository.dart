import 'package:json_pagenation_sample/core/result.dart';
import 'package:json_pagenation_sample/domain/model/user.dart';

abstract class UserRepository {
  Future<Result<List<User>>> getUsers();
}
