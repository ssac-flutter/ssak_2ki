import 'package:kakao_login/core/result.dart';
import 'package:kakao_login/data/repository/kakao_talk_with_auth_repository_impl.dart';
import 'package:kakao_login/data/repository/kakao_user_repository_impl.dart';
import 'package:kakao_login/domain/model/user_model.dart';
import 'package:kakao_login/domain/repository/auth_repository.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:kakao_login/domain/repository/user_repository.dart';


class LoginWithKakaoTalkUseCase {
  final AuthRepository _authRepository = KakaoTalkWithAuthRepositoryImpl();
  // final UserRepository _userRepository = KakaoUserRepositoryImpl();

  // Future<Result<UserModel>> call() async {
  //   try {
  //     final tokenResponse = await _auth.login();
  //
  //
  //
  //
  //   } catch (e) {
  //
  //   }
  // }
}
