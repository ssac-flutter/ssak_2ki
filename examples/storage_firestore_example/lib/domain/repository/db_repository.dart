import 'package:storage_firestore_example/core/result.dart';

abstract class DbRepository {
  Future<Result> insert(Map<String, dynamic> json);
}
