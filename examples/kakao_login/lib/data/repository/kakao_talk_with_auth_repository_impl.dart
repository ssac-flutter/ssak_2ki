import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:kakao_login/domain/model/token_response.dart';
import 'package:kakao_login/domain/model/user_model.dart';
import 'package:kakao_login/domain/repository/auth_repository.dart';

class KakaoTalkWithAuthRepositoryImpl implements AuthRepository {
  final secureStorage = const FlutterSecureStorage();

  KakaoTalkWithAuthRepositoryImpl() {
    KakaoContext.clientId = '18957827f73b2d48ba1cb62c92417477';
  }

  @override
  Future<TokenResponse> login() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();

      try {
        final OAuthToken token;
        if (isInstalled) {
          token = await UserApi.instance.loginWithKakaoTalk();
        } else {
          token = await UserApi.instance.loginWithKakaoAccount();
        }

        await secureStorage.write(
            key: 'access_token', value: token.accessToken);
        await secureStorage.write(
            key: 'refresh_token', value: token.refreshToken);

        return TokenResponse(
          accessToken: token.accessToken,
          refreshToken: token.refreshToken,
        );
      } catch (e) {
        throw KakaoTalkCancelException('cancel');
      }
    } on KakaoException catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    await secureStorage.delete(key: 'refresh_token');
    await UserApi.instance.logout();
  }

  @override
  Future<String> createCustomToken(UserModel userModel) {
    // TODO: implement createCustomToken
    throw UnimplementedError();
  }
}

class KakaoTalkNotInstallException implements Exception {
  final String message;

  KakaoTalkNotInstallException(this.message);
}

class KakaoTalkCancelException implements Exception {
  final String message;

  KakaoTalkCancelException(this.message);
}
