import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_email_auth/presentation/error/error_screen.dart';
import 'package:firebase_email_auth/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class ConnectivityScreen extends StatelessWidget {
  const ConnectivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ConnectivityResult>(
      stream: Connectivity().onConnectivityChanged,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const ErrorScreen();
        }

        if (snapshot.data! == ConnectivityResult.mobile ||
            snapshot.data! == ConnectivityResult.wifi) {
          return const SplashScreen();
        } else {
          return const ErrorScreen();
        }
      },
    );
  }
}
