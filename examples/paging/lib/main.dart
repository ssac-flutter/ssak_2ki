import 'package:flutter/material.dart';
import 'package:json_pagenation_sample/presentation/posts/posts_screen.dart';
import 'package:provider/provider.dart';

import 'di/provider_setup.dart';

void main() {
  runApp(MultiProvider(
    providers: viewModels,
    child: const MyApp(),
  ));
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
      home: const PostsScreen(),
    );
  }
}
