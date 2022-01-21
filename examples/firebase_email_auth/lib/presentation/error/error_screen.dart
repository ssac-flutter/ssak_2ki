import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: const Center(
          child: Text('인터넷 연결이 없습니다!!!'),
        ),
      ),
    );
  }
}
