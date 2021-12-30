import 'package:kakao_flutter_sdk/user.dart';
import 'package:kakao_login/core/result.dart';
import 'package:kakao_login/domain/repository/auth_repository.dart';

class KakaoAuthRepository extends AuthRepository {
  KakaoAuthRepository() {
    KakaoContext.clientId = '18957827f73b2d48ba1cb62c92417477';
  }

  @override
  Future<Result> login() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();
      if (isInstalled) {
        try {
          await UserApi.instance.loginWithKakaoTalk();
        } catch (e) {
          return Result.error(KakaoTalkCancelException('취소되었습니다'));
        }
      } else {
        await UserApi.instance.loginWithKakaoAccount();
      }
      return const Result.success(true);
    } on KakaoException catch (e) {
      return Result.error(e);
    }
  }



  @override
  Future<Result<bool>> logout() {
    // TODO: implement logout
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

