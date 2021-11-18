import 'dart:io';

import 'package:storage_firestore_example/core/result.dart';
import 'package:storage_firestore_example/domain/model/doc.dart';
import 'package:storage_firestore_example/domain/repository/db_repository.dart';
import 'package:storage_firestore_example/domain/repository/storage_repository.dart';
import 'package:path/path.dart';

class UploadUseCase {
  final DbRepository _dbRepository;
  final StorageRepository _storageRepository;

  UploadUseCase(this._dbRepository, this._storageRepository);

  Future<Result<String>> call(String fileName) async {
    Result result = await _storageRepository.uploadFile(File(fileName));

    return result.when(success: (downloadUrl) async {
      final doc = Doc(
        fileName: basename(downloadUrl),
        downloadUrl: downloadUrl,
      );

      Result dbResult = await _dbRepository.insert(doc.toJson());
      return dbResult.when(
        success: (message) {
          return const Result.success('DB 작성 성공!!!');
        },
        error: (message) {
          return const Result.error('DB 작성 실패!!!');
        },
      );
    }, error: (String message) {
      return Result.error(message);
    });
  }
}
