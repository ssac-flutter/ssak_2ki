import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Storage Sample'),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(onPressed: () {  },
        child: const Icon(Icons.add),
      ),
    );
  }
}
