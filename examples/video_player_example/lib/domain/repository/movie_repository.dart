import 'package:video_player_example/core/result.dart';
import 'package:video_player_example/domain/model/movie.dart';

abstract class MovieRepository {
  Future<Result<List<Movie>>> getMovies();
}
