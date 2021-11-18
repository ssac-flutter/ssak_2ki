import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storage_firestore_example/presentation/add/add_view_model.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  StreamSubscription? _streamSubscription;

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      final viewModel = context.read<AddViewModel>();

      // 구독
      _streamSubscription = viewModel.eventStream.listen((event) {
        event.when(success: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('업로드 성공!!!')),
          );
          Navigator.pop(context, true);
        }, showSnackBar: (message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message)),
          );
        });
      });
    });
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    final viewModel = context.read<AddViewModel>();
    viewModel.destroy();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AddViewModel>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (viewModel.fileName.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('파일을 선택하세요')),
            );
          }
          viewModel.upload();
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
                viewModel.setFileName(result.files.single.path!);
              } else {
                viewModel.setFileName(null);
              }
            },
            child: const Text('파일 선택'),
          ),
          Text(viewModel.fileName),
        ],
      ),
    );
  }
}
