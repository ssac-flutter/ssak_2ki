import 'package:firebase_auth/firebase_auth.dart';
import 'package:kakao_login/domain/model/user_model.dart';
import 'package:kakao_login/domain/repository/auth_repository.dart';
import 'package:kakao_login/domain/repository/token_repository.dart';
import 'package:kakao_login/domain/repository/user_repository.dart';

class OAuthLoginUseCase {
  final AuthRepository _authRepository;
  final TokenRepository _tokenRepository;
  final UserRepository _userRepository;

  OAuthLoginUseCase(
    this._authRepository,
    this._tokenRepository,
    this._userRepository,
  );

  Future<void> call() async {
    // 로그인
    final tokenResponse = await _authRepository.login();

    // 토큰 저장
    await _tokenRepository.saveAccessToken(tokenResponse.accessToken);
    await _tokenRepository.saveRefreshToken(tokenResponse.refreshToken);

    // 유저 정보
    final UserModel user = await _userRepository.getUser();

    // 커스텀 토큰 발급
    final String customToken = await _authRepository.createCustomToken(user);

    // Firebase 연동
    await FirebaseAuth.instance.signInWithCustomToken(customToken);
  }
}
