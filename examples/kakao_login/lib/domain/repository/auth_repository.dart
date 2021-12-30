
import 'package:kakao_login/core/result.dart';

abstract class AuthRepository {
  Future<Result> login();

  Future<Result> logout();
}
