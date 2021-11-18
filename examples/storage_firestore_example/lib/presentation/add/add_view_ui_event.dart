import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_view_ui_event.freezed.dart';

@freezed
abstract class AddViewUiEvent with _$AddViewUiEvent {
  const factory AddViewUiEvent.success() = Success;
  const factory AddViewUiEvent.showSnackBar(String message) = ShowSnackBar;
}

