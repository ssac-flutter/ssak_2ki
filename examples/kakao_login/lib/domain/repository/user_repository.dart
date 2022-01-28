import 'package:kakao_login/domain/model/user_model.dart';

abstract class UserRepository {
  Future<UserModel> getUser();
}
