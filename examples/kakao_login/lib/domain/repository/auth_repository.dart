import 'package:kakao_login/domain/model/token_response.dart';

abstract class AuthRepository {
  Future<TokenResponse> login();

  Future<void> logout();
}
