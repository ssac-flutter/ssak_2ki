import 'package:video_player_example/core/result.dart';
import 'package:video_player_example/domain/model/movie.dart';
import 'package:video_player_example/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  @override
  Future<Result<List<Movie>>> getMovies() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return Result.success([
      Movie(
          title: '나비',
          url:
              'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
      Movie(
          title: '벌',
          url:
              'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
      Movie(
          title: 'BigBuckBunny',
          url:
              'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'),
    ]);
  }
}
