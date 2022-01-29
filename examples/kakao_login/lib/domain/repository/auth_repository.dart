import 'package:kakao_login/domain/model/token_response.dart';
import 'package:kakao_login/domain/model/user_model.dart';

abstract class AuthRepository {
  Future<TokenResponse> login();

  Future<void> logout();

  Future<String> createCustomToken(UserModel userModel);
}
