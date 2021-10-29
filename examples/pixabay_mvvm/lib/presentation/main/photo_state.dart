import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pixabay_mvvm/domain/model/photo.dart';

part 'photo_state.freezed.dart';

part 'photo_state.g.dart';

@freezed
class PhotoState with _$PhotoState {
  factory PhotoState(
      {@Default([]) List<Photo> photos,
      @Default(false) bool isLoading}) = _PhotoState;

  factory PhotoState.fromJson(Map<String, dynamic> json) =>
      _$PhotoStateFromJson(json);
}
