import 'dart:io';
import 'package:path/path.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:storage_firestore_example/core/result.dart';
import 'package:storage_firestore_example/domain/repository/storage_repository.dart';

class FirebaseStorageRepository implements StorageRepository {
  @override
  Future<Result<String>> uploadFile(File file) async {
    UploadTask task = FirebaseStorage.instance
        .ref('uploads/${basename(file.path)}')
        .putFile(file);

    try {
      TaskSnapshot snapshot = await task;
      String downloadUrl = await snapshot.ref.getDownloadURL();

      return Result.success(downloadUrl);
    } on FirebaseException catch (e) {
      return const Result.error('업로드에 실패했습니다');
    }
  }
}
