import 'package:firebase_auth/firebase_auth.dart';
import 'package:kakao_login/data/data_source/local/token_local_data_source.dart';
import 'package:kakao_login/data/data_source/remote/firebase_auth_remote_data_source.dart';
import 'package:kakao_login/data/data_source/remote/kakao_remote_data_source.dart';
import 'package:kakao_login/domain/model/token_response.dart';
import 'package:kakao_login/domain/model/user_model.dart';
import 'package:kakao_login/domain/repository/auth_repository.dart';

class KakaoAuthRepositoryImpl implements AuthRepository {
  final KakaoRemoteDataSource kakaoRemoteDataSource;
  final FirebaseAuthRemoteDataSource firebaseAuthRemoteDataSource;
  final TokenLocalDataSource tokenLocalDataSource;

  KakaoAuthRepositoryImpl(
    this.kakaoRemoteDataSource,
    this.firebaseAuthRemoteDataSource,
    this.tokenLocalDataSource,
  );

  @override
  Future<TokenResponse> login() async {
    // 인가
    final String code =
        await kakaoRemoteDataSource.requestAuthorizationCode();

    // 토큰 발급
    final TokenResponse tokenResponse =
        await kakaoRemoteDataSource.requestToken(code);

    return tokenResponse;
  }

  @override
  Future<void> logout() async {
    // 로그아웃
    final token = await tokenLocalDataSource.loadAccessToken();
    await kakaoRemoteDataSource.logout(token);

    // 토큰 삭제
    await tokenLocalDataSource.saveAccessToken('');
    await tokenLocalDataSource.saveRefreshToken('');

    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<String> createCustomToken(UserModel user) async {
    return await firebaseAuthRemoteDataSource.createCustomToken(user);
  }
}
