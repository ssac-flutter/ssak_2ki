import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_email_auth/presentation/connectivity/connectivity_screen.dart';
import 'package:firebase_email_auth/presentation/login/login_screen.dart';
import 'package:firebase_email_auth/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'firebase_options.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  await Hive.initFlutter();
  await Hive.openBox('settings');

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
      home: const ConnectivityScreen(),
    );
  }
}
