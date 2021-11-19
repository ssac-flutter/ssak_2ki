import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:video_player_example/data/repository/movie_repository_impl.dart';
import 'package:video_player_example/domain/use_case/get_movies_use_case.dart';
import 'package:video_player_example/presentation/home/home_view_model.dart';

Future<List<SingleChildWidget>> getProviders() async {
  final repository = MovieRepositoryImpl();

  final getMoviesUseCase = GetMoviesUseCase(repository);

  return [
    ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(getMoviesUseCase),
    ),
  ];
}
