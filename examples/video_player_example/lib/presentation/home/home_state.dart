import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:video_player_example/domain/model/movie.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    @Default([]) List<Movie> movies,
    Movie? selectedMovie,
  }) = _HomeState;
}