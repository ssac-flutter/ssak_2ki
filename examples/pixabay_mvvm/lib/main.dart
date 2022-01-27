import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixabay_mvvm/di/provider_setup.dart';
import 'package:pixabay_mvvm/presentation/main/main_screen.dart';

void main() {
  Get.put(mainViewModel);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}
