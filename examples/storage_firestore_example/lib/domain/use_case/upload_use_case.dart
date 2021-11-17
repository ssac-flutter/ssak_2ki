import 'package:storage_firestore_example/domain/repository/db_repository.dart';
import 'package:storage_firestore_example/domain/repository/storage_repository.dart';

class UploadUseCase {
  DbRepository dbRepository;
  StorageRepository storageRepository;

  UploadUseCase(this.dbRepository, this.storageRepository);
}