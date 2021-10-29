import 'package:pixabay_mvvm/data/data_source/pixabay_dio_api.dart';
import 'package:pixabay_mvvm/data/repository/pixabay_photo_repository_impl.dart';
import 'package:pixabay_mvvm/domain/repository/photo_repository.dart';
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
  Provider<PixabayDioApi>(
    create: (context) => PixabayDioApi(),
  ),
];

// 3. 2에 등록한 클래스에 의존하는 Model
List<SingleChildWidget> dependentModels = [
  ProxyProvider<PixabayDioApi, PhotoRepository>(
    update: (context, api, _) => PixabayPhotoRepositoryImpl(api),
  ),
];

// 4. ViewModels
// View가 사용. 2, 3에 등록한 클래스를 사용할 수 있음
List<SingleChildWidget> viewModels = [
  ChangeNotifierProvider<MainViewModel>(
    create: (context) => MainViewModel(
      Provider.of<PhotoRepository>(context, listen: false),
    ),
  ),
];
