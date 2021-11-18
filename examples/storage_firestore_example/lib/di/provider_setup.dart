import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:storage_firestore_example/data/repository/firebase_storage_repository.dart';
import 'package:storage_firestore_example/data/repository/firestore_db_repository.dart';
import 'package:storage_firestore_example/domain/use_case/fetch_use_case.dart';
import 'package:storage_firestore_example/domain/use_case/upload_use_case.dart';
import 'package:storage_firestore_example/presentation/add/add_view_model.dart';
import 'package:storage_firestore_example/presentation/home/home_view_model.dart';

Future<List<SingleChildWidget>> getProviders() async {
  final dbRepository = FirestoreDbRepository();

  final uploadUseCase = UploadUseCase(
    dbRepository,
    FirebaseStorageRepository(),
  );

  final fetchUseCase = FetchUseCase(
    dbRepository,
  );

  return [
    ChangeNotifierProvider<AddViewModel>(
        create: (context) => AddViewModel(uploadUseCase)),
    ChangeNotifierProvider<HomeViewModel>(
        create: (context) => HomeViewModel(fetchUseCase)),
  ];
}
