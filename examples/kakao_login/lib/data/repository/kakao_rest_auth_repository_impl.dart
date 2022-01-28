import 'package:kakao_login/core/result.dart';
import 'package:kakao_login/domain/model/token_response.dart';
import 'package:kakao_login/domain/repository/auth_repository.dart';

class KakaoRestAuthRepositoryImpl implements AuthRepository {
  @override
  Future<TokenResponse> login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
