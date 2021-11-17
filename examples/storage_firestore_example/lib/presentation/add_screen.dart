import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:storage_firestore_example/data/repository/firebase_storage_repository.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  String? _fileName;

  final storageRepository = FirebaseStorageRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_fileName == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('파일을 선택하세요')),
            );
          }

          storageRepository.uploadFile(File(_fileName!)).then((result) {
            result.when(success: (downloadUrl) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(downloadUrl)),
              );
            }, error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message)),
              );
            });
          });
        },
        child: const Icon(Icons.upload),
      ),
      appBar: AppBar(),
      body: Row(
        children: [
          ElevatedButton(
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles();

              if (result != null && result.files.single.path != null) {
                setState(() {
                  _fileName = result.files.single.path!;
                });
              } else {
                _fileName = null;
              }
            },
            child: const Text('파일 선택'),
          ),
          Text(_fileName != null ? basename(_fileName!) : ''),
        ],
      ),
    );
  }
}
