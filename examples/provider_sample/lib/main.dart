import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/ui/home/home_page.dart';
import 'package:provider_sample/ui/home/home_view_model.dart';

void main() {
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
      home: Provider(
        create: (_) => HomeViewModel(),
        child: const MyHomePage(),
      ),
    );
  }
}
