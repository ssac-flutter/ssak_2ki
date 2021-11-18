import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storage_firestore_example/data/repository/firebase_storage_repository.dart';
import 'package:storage_firestore_example/data/repository/firestore_db_repository.dart';
import 'package:storage_firestore_example/domain/use_case/upload_use_case.dart';
import 'package:storage_firestore_example/presentation/add/add_screen.dart';
import 'package:storage_firestore_example/presentation/add/add_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Storage Sample'),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
