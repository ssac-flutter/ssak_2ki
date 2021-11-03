import 'package:pixabay_mvvm/data/data_source/api.dart';
import 'package:pixabay_mvvm/data/data_source/remote/pixabay_dio_api.dart';
import 'package:pixabay_mvvm/data/repository/pixabay_photo_repository_impl.dart';
import 'package:pixabay_mvvm/domain/repository/photo_repository.dart';
import 'package:pixabay_mvvm/domain/use_case/get_photos_use_case.dart';
import 'package:pixabay_mvvm/domain/use_case/main_use_cases.dart';
import 'package:pixabay_mvvm/presentation/main/main_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

// 1. Provider 전체
List<SingleChildWidget> globalProviders = [
  ...independentModels,
  ...dependentModels,
  ...viewModels,
];

// 2. 다른 클래스에 의존하지 않는 Model
List<SingleChildWidget> independentModels = [
  Provider<Api>(
    create: (context) => PixabayDioApi(),
  ),
];

// 3. 2에 등록한 클래스에 의존하는 Model
List<SingleChildWidget> dependentModels = [
  ProxyProvider<Api, PhotoRepository>(
    update: (context, api, _) => PixabayPhotoRepositoryImpl(api),
  ),
  ProxyProvider<PhotoRepository, MainUseCases>(
    update: (context, repository, _) =>
        MainUseCases(getPhotos: GetPhotosUseCase(repository)),
  ),
];

// 4. ViewModels
// View가 사용. 2, 3에 등록한 클래스를 사용할 수 있음
List<SingleChildWidget> viewModels = [
  ChangeNotifierProvider<MainViewModel>(
    create: (context) => MainViewModel(context.read<MainUseCases>()
        // Provider.of<GetPhotosUseCase>(context, listen: false),
        ),
  ),
];
