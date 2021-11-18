import 'dart:async';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:storage_firestore_example/domain/use_case/upload_use_case.dart';
import 'package:storage_firestore_example/presentation/add/add_view_ui_event.dart';

class AddViewModel with ChangeNotifier {
  String? _fileName;

  String get fileName => _fileName != null ? basename(_fileName!) : '';

  // 브로드캐스트 스트림
  final _eventController = StreamController<AddViewUiEvent>.broadcast();
  Stream<AddViewUiEvent> get eventStream => _eventController.stream;

  final UploadUseCase _uploadUseCase;

  AddViewModel(this._uploadUseCase);

  void init() {
    _fileName = null;
  }

  void destroy() {
    _fileName = null;
  }

  void setFileName(String? newFileName) {
    _fileName = newFileName;
    notifyListeners();
  }

  void upload() async {
    if (_fileName == null) {
      return;
    }

    final result = await _uploadUseCase(_fileName!);

    result.when(
      success: (message) {
        _eventController.add(const AddViewUiEvent.success());
      },
      error: (message) {
        _eventController.add(AddViewUiEvent.showSnackBar(message));
      },
    );
  }
}
