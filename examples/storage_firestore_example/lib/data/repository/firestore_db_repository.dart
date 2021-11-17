import 'package:storage_firestore_example/core/result.dart';
import 'package:storage_firestore_example/domain/repository/db_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDbRepository implements DbRepository {
  final _docs = FirebaseFirestore.instance.collection('docs');

  @override
  Future<Result> insert(Map<String, dynamic> json) async {
    try {
      await _docs.add(json);

      return const Result.success('DB Insert 성공!!');
    } on Exception catch (e) {
      return const Result.success('DB Insert 실패!!');
    }
  }
}
