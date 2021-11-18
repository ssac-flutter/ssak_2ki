import 'package:storage_firestore_example/core/result.dart';
import 'package:storage_firestore_example/domain/model/doc.dart';
import 'package:storage_firestore_example/domain/repository/db_repository.dart';

class FetchUseCase {
  final DbRepository _dbRepository;

  FetchUseCase(this._dbRepository);

  Future<Result<List<Doc>>> call() async {
    return _dbRepository.fetch();
  }
}