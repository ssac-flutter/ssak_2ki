import 'package:flutter/material.dart';
import 'package:kakao_login/presentation/login/login_event.dart';
import 'package:kakao_login/presentation/login/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LoginViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('카카오 로그인'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                viewModel.onEvent(const LoginEvent.login());
              },
              child: const Text('카카오톡으로 로그인'),
            ),
            ElevatedButton(
              onPressed: () {
                viewModel.onEvent(const LoginEvent.login());
              },
              child: const Text('REST API로 로그인'),
            ),
            Text(viewModel.errorMessage),
          ],
        ),
      ),
    );
  }
}
