import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kakao_login/data/repository/kakao_talk_with_auth_repository_impl.dart';
import 'package:kakao_login/presentation/login/login_event.dart';
import 'package:kakao_login/presentation/login/login_ui_event.dart';
import 'package:kakao_login/service/auth_service.dart';

class LoginViewModel with ChangeNotifier {

  bool isLogined = false;
  String errorMessage = '';

  final _eventController = StreamController<LoginUiEvent>.broadcast();
  Stream<LoginUiEvent> get eventStream => _eventController.stream;

  void onEvent(LoginEvent event) {
    event.when(
      login: _login,
      logout: () {

      },
    );
  }

  _login() async {
    AuthService.instance.login();
    // final result = await _auth.login();
    // result.when(
    //   success: (_) {
    //     isLogined = true;
    //     errorMessage = '';
    //   },
    //   error: (e) {
    //     if (e is KakaoTalkCancelException) {
    //       //
    //     } else {
    //       //
    //     }
    //     isLogined = false;
    //     errorMessage = e.toString();
    //   },
    // );

    notifyListeners();
  }
}
