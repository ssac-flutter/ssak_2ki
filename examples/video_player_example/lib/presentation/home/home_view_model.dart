import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_example/domain/model/movie.dart';
import 'package:video_player_example/domain/use_case/get_movies_use_case.dart';

import 'home_state.dart';

class HomeViewModel with ChangeNotifier {
  final GetMoviesUseCase useCase;

  HomeState _state = HomeState();

  HomeState get state => _state;

  late VideoPlayerController _videoPlayerController;

  double get aspectRatio => _videoPlayerController.value.aspectRatio;

  ChewieController? _chewieController;

  ChewieController? get chewieController => _chewieController;

  HomeViewModel(this.useCase) {
    init();
  }

  Future init() async {
    await loadMovies();

    await _setMovie(state.selectedMovie!);
  }

  Future _setMovie(Movie movie) async {
    _videoPlayerController =
        VideoPlayerController.network(movie.url);

    await _videoPlayerController.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: false,
    );
    notifyListeners();
  }

  Future dispose() async {
    _chewieController?.dispose();
    await _videoPlayerController.dispose();
  }

  Future<void> loadMovies() async {
    final result = await useCase();

    result.when(
      success: (movies) {
        _state = state.copyWith(
          movies: movies,
          selectedMovie: movies[0],
        );
        notifyListeners();
      },
      error: (message) {
        print(message);
      },
    );
  }

  void setSelectMovie(Movie movie) async {
    _state = state.copyWith(selectedMovie: movie);

    await dispose();

    await _setMovie(movie);
  }
}
