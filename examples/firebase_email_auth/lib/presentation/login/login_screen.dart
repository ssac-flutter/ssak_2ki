import 'dart:async';

import 'package:firebase_email_auth/presentation/home/home_screen.dart';
import 'package:firebase_email_auth/presentation/login/login_event.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final viewModel = LoginViewModel();

  final textController = TextEditingController();
  StreamSubscription? _streamSubscription;

  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // String? email = prefs.getString('email');
      String? email = Hive.box('settings').get('email');
      if (email != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }

      // 구독
      _streamSubscription = viewModel.eventStream.listen((event) {
        event.when(loginSuccess: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        }, showSnackBar: (message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message)),
          );
        });
      });
    });
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email Link 샘플'),
      ),
      body: StreamBuilder<Object>(
        stream: viewModel.eventStream,
        builder: (context, snapshot) {
          return Center(
            child: Column(
              children: [
                TextField(
                  controller: textController,
                ),
                ElevatedButton(
                  onPressed: () {
                    viewModel.onEvent(
                      LoginEvent.sendSignInLinkToEmail(textController.text),
                    );
                  },
                  child: const Text('이메일 링크 전송'),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
