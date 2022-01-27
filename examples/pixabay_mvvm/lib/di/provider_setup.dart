import 'package:pixabay_mvvm/data/data_source/api.dart';
import 'package:pixabay_mvvm/data/data_source/remote/pixabay_dio_api.dart';
import 'package:pixabay_mvvm/data/repository/pixabay_photo_repository_impl.dart';
import 'package:pixabay_mvvm/domain/repository/photo_repository.dart';
import 'package:pixabay_mvvm/domain/use_case/get_photos_use_case.dart';
import 'package:pixabay_mvvm/domain/use_case/main_use_cases.dart';
import 'package:pixabay_mvvm/presentation/main/main_view_model.dart';

// 2. 다른 클래스에 의존하지 않는 Model
final Api _pixaBayApi = PixabayDioApi();

// 3. 2에 등록한 클래스에 의존하는 Model
final PhotoRepository _photoRepository =
    PixabayPhotoRepositoryImpl(_pixaBayApi);
final MainUseCases _mainUseCases =
    MainUseCases(getPhotos: GetPhotosUseCase(_photoRepository));

// 4. ViewModels
// View가 사용. 2, 3에 등록한 클래스를 사용할 수 있음
final mainViewModel = MainViewModel(_mainUseCases);
