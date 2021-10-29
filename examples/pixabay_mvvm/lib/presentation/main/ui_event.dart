import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_event.freezed.dart';

@freezed
abstract class UiEvent with _$UiEvent {
  const factory UiEvent.showSnackBar(String message) = ShowSnackBar;
  const factory UiEvent.endLoading() = EndLoading;
}