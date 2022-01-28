import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kakao_login/service/auth_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
                AuthService.instance.logout();
              },
              child: const Text('로그아웃'),
            ),
          ],
        ),
      ),
    );
  }
}
