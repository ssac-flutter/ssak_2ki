import 'package:storage_firestore_example/core/result.dart';
import 'package:storage_firestore_example/domain/model/doc.dart';

abstract class DbRepository {
  Future<Result> insert(Map<String, dynamic> json);
  Future<Result<List<Doc>>> fetch();
}
