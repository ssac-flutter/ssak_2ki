import 'package:flutter/material.dart';
import 'package:kakao_login/presentation/login_event.dart';
import 'package:kakao_login/presentation/login_view_model.dart';
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
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              viewModel.onEvent(const LoginEvent.login());
            },
            child: const Text('로그인'),
          ),
          Text('로그인 : ${viewModel.isLogined}'),
          Text(viewModel.errorMessage),
        ],
      ),
    );
  }
}
