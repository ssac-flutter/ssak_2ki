import 'package:flutter/material.dart';
import 'package:kakao_login/data/remote/kakao_auth_repository.dart';
import 'package:kakao_login/domain/repository/auth_repository.dart';
import 'package:kakao_login/presentation/login_event.dart';

class LoginViewModel with ChangeNotifier {
  final AuthRepository _auth = KakaoAuthRepository();

  bool isLogined = false;
  String errorMessage = '';

  void onEvent(LoginEvent event) {
    event.when(
      login: _login,
      logout: () {},
    );
  }

  _login() async {
    final result = await _auth.login();
    result.when(
      success: (_) {
        isLogined = true;
        errorMessage = '';
      },
      error: (e) {
        if (e is KakaoTalkCancelException) {
          //
        } else {
          //
        }
        isLogined = false;
        errorMessage = e.toString();
      },
    );

    notifyListeners();
  }
}
