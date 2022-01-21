import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_ui_event.freezed.dart';

@freezed
abstract class LoginUiEvent with _$LoginUiEvent {
  const factory LoginUiEvent.loginSuccess() = LoginSuccess;
  const factory LoginUiEvent.showSnackBar(String message) = ShowSnackBar;
}

