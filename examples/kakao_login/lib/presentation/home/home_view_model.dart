import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kakao_login/data/data_source/local/token_local_data_source.dart';
import 'package:kakao_login/data/data_source/remote/firebase_auth_remote_data_source.dart';
import 'package:kakao_login/data/data_source/remote/kakao_remote_data_source.dart';
import 'package:kakao_login/data/repository/kakao_auth_repository_impl.dart';
import 'package:kakao_login/domain/model/user_model.dart';
import 'package:kakao_login/domain/use_case/logout_use_case.dart';

class HomeViewModel with ChangeNotifier {
  final LogoutUseCase _logoutUseCase = LogoutUseCase(
    KakaoAuthRepositoryImpl(
      KakaoRemoteDataSource(),
      FirebaseAuthRemoteDataSource(),
      TokenLocalDataSource(),
    ),
  );

  UserModel get userModel => UserModel(
        uid: FirebaseAuth.instance.currentUser!.uid,
        displayName: FirebaseAuth.instance.currentUser!.displayName ?? '',
        photoURL: FirebaseAuth.instance.currentUser!.photoURL ?? '',
        email: FirebaseAuth.instance.currentUser!.email ?? '',
      );

  void logout() {
    _logoutUseCase();
  }
}
