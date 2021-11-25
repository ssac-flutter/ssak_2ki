import 'package:flutter/material.dart';
import 'package:local_auth_exam/service/auth_service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isAuthenticated = false;

  @override
  Widget build(BuildContext context) {
    final authService = context.read<AuthService>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              final result = await authService.authenticate();
              result.when(
                success: () {
                  setState(() {
                    isAuthenticated = true;
                  });
                },
                error: (message) {
                  isAuthenticated = false;
                  final snackBar = SnackBar(content: Text(message));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              );
            },
            child: const Text('인증'),
          ),
          Text('인증 상태 : $isAuthenticated'),
        ],
      ),
    );
  }
}
