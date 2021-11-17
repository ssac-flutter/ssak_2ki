import 'dart:io';

import 'package:storage_firestore_example/core/result.dart';

abstract class StorageRepository {
  Future<Result> uploadFile(File file);
}
