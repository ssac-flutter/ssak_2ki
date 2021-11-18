import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:storage_firestore_example/data/repository/firebase_storage_repository.dart';
import 'package:storage_firestore_example/data/repository/firestore_db_repository.dart';
import 'package:storage_firestore_example/domain/use_case/upload_use_case.dart';
import 'package:storage_firestore_example/presentation/add/add_view_model.dart';

Future<List<SingleChildWidget>> getProviders() async {
  final useCase = UploadUseCase(
    FirestoreDbRepository(),
    FirebaseStorageRepository(),
  );

  return [
    ChangeNotifierProvider<AddViewModel>(create: (context) => AddViewModel(useCase)),
  ];
}
