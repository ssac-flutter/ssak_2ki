import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kakao_login/domain/model/user_model.dart';

part 'login_ui_event.freezed.dart';

@freezed
abstract class LoginUiEvent with _$LoginUiEvent {
  const factory LoginUiEvent.login(UserModel userModel) = Login;
  const factory LoginUiEvent.showSnackBar(String message) = ShowSnackBar;
}

