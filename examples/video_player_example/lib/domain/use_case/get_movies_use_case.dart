import 'package:video_player_example/core/result.dart';
import 'package:video_player_example/domain/model/movie.dart';
import 'package:video_player_example/domain/repository/movie_repository.dart';

class GetMoviesUseCase {
  final MovieRepository repository;

  GetMoviesUseCase(this.repository);

  Future<Result<List<Movie>>> call() async {
    return repository.getMovies();
  }
}
