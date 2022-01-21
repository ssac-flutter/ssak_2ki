import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_email_auth/presentation/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('로그인 성공!!'),
            ElevatedButton(
              onPressed: () async {
                Hive.box('settings').put('email', null);

                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: const Text('로그아웃'),
            ),
          ],
        ),
      ),
    );
  }
}
