import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kakao_login/data/data_source/local/token_local_data_source.dart';
import 'package:kakao_login/data/data_source/remote/firebase_auth_remote_data_source.dart';
import 'package:kakao_login/data/data_source/remote/kakao_remote_data_source.dart';
import 'package:kakao_login/data/repository/kakao_auth_repository_impl.dart';
import 'package:kakao_login/domain/use_case/logout_use_case.dart';
import 'package:kakao_login/service/auth_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final LogoutUseCase _logoutUseCase = LogoutUseCase(
    KakaoAuthRepositoryImpl(
      KakaoRemoteDataSource(),
      FirebaseAuthRemoteDataSource(),
      TokenLocalDataSource(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${FirebaseAuth.instance.currentUser?.displayName}님 안녕하세요'),
            Image.network(
              FirebaseAuth.instance.currentUser?.photoURL ?? '',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            Text('${FirebaseAuth.instance.currentUser?.email}'),
            ElevatedButton(
              onPressed: () {
                // AuthService.instance.logout();
                _logoutUseCase();
              },
              child: const Text('로그아웃'),
            ),
          ],
        ),
      ),
    );
  }
}
