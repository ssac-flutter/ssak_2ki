import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:subway/data/subway_info_repository.dart';
import 'package:subway/data/subway_info_repository_dio_impl.dart';
import 'package:subway/viewmodel/main_view_model.dart';

List<SingleChildWidget> globalProviders = [
  ...independentModels,
  ...viewModels,
];

List<SingleChildWidget> independentModels = [
  Provider<SubwayInfoRepository>(
    create: (context) => SubwayInfoRepositoryDioImpl(),
  ),
];

List<SingleChildWidget> viewModels = [
  ChangeNotifierProvider<MainViewModel>(
    create: (context) => MainViewModel(
      repository: Provider.of<SubwayInfoRepository>(context, listen: false),
    ),
  ),
];
