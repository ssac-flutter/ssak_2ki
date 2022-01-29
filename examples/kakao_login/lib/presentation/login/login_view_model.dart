import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kakao_login/data/data_source/local/token_local_data_source.dart';
import 'package:kakao_login/data/data_source/remote/firebase_auth_remote_data_source.dart';
import 'package:kakao_login/data/data_source/remote/kakao_remote_data_source.dart';
import 'package:kakao_login/data/repository/kakao_auth_repository_impl.dart';
import 'package:kakao_login/data/repository/kakao_user_repository_impl.dart';
import 'package:kakao_login/data/repository/token_repository_impl.dart';
import 'package:kakao_login/domain/use_case/login_use_case.dart';
import 'package:kakao_login/presentation/login/login_event.dart';
import 'package:kakao_login/presentation/login/login_ui_event.dart';

class LoginViewModel with ChangeNotifier {
  final LoginUseCase kakaoLoginUseCase = LoginUseCase(
      KakaoAuthRepositoryImpl(
        KakaoRemoteDataSource(),
        FirebaseAuthRemoteDataSource(),
        TokenLocalDataSource(),
      ),
      TokenRepositoryImpl(TokenLocalDataSource()),
      KakaoUserRepositoryImpl(
        KakaoRemoteDataSource(),
        TokenLocalDataSource(),
      ));

  bool isLogined = false;
  String errorMessage = '';

  final _eventController = StreamController<LoginUiEvent>.broadcast();

  Stream<LoginUiEvent> get eventStream => _eventController.stream;

  void onEvent(LoginEvent event) {
    event.when(
      login: _login,
      logout: () {},
    );
  }

  _login() async {
    kakaoLoginUseCase();
    // AuthService.instance.login();
  }
}
