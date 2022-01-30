import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kakao_login/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('${viewModel.userModel.displayName}님 안녕하세요'),
            Image.network(
              viewModel.userModel.photoURL,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            Text(viewModel.userModel.email),
            ElevatedButton(
              onPressed: () {
                // AuthService.instance.logout();
                viewModel.logout();
              },
              child: const Text('로그아웃'),
            ),
          ],
        ),
      ),
    );
  }
}
