import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:kakao_login/presentation/home/home_screen.dart';
import 'package:kakao_login/presentation/login/login_view_model.dart';
import 'package:provider/provider.dart';


class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SignInScreen(
              headerBuilder: (context, constraints, _) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                        'https://firebase.flutter.dev/img/flutterfire_300x.png'),
                  ),
                );
              },
              providerConfigs: const [
                EmailProviderConfiguration(),
                GoogleProviderConfiguration(
                  clientId:
                      '160709417805-tt3r14lpqbt6aceemkr4mrffrn6t1c1q.apps.googleusercontent.com',
                ),
              ],
              footerBuilder: (context, _) {
                return ElevatedButton(
                  onPressed: () {
                    context.read<LoginViewModel>().kakaoLoginUseCase();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.yellow,
                  ),
                  child: const Text(
                    '카카오 로그인',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                );
              },
            );
          } else {
            return const HomeScreen();
          }
        });
  }
}
