import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pixabay_mvvm/data/data_source/pixabay_api.dart';
import 'package:pixabay_mvvm/presentation/main/main_screen.dart';
import 'package:pixabay_mvvm/presentation/main/main_view_model.dart';
import 'package:provider/provider.dart';

import 'data/repository/pixabay_photo_repository_impl.dart';
import 'domain/repository/photo_repository.dart';

void main() {
  final PhotoRepository repository = PixabayPhotoRepositoryImpl(PixabayApi(http.Client()));
  // final repository = FakePhotoRepositoryImpl();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: MainViewModel(repository),
        ),
      ],
      child: const MyApp(),
    ),
  );
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
