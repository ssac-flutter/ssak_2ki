// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_ui_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoginUiEventTearOff {
  const _$LoginUiEventTearOff();

  LoginSuccess loginSuccess() {
    return const LoginSuccess();
  }

  ShowSnackBar showSnackBar(String message) {
    return ShowSnackBar(
      message,
    );
  }
}

/// @nodoc
const $LoginUiEvent = _$LoginUiEventTearOff();

/// @nodoc
mixin _$LoginUiEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loginSuccess,
    required TResult Function(String message) showSnackBar,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loginSuccess,
    TResult Function(String message)? showSnackBar,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loginSuccess,
    TResult Function(String message)? showSnackBar,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginSuccess value) loginSuccess,
    required TResult Function(ShowSnackBar value) showSnackBar,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoginSuccess value)? loginSuccess,
    TResult Function(ShowSnackBar value)? showSnackBar,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginSuccess value)? loginSuccess,
    TResult Function(ShowSnackBar value)? showSnackBar,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginUiEventCopyWith<$Res> {
  factory $LoginUiEventCopyWith(
          LoginUiEvent value, $Res Function(LoginUiEvent) then) =
      _$LoginUiEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoginUiEventCopyWithImpl<$Res> implements $LoginUiEventCopyWith<$Res> {
  _$LoginUiEventCopyWithImpl(this._value, this._then);

  final LoginUiEvent _value;
  // ignore: unused_field
  final $Res Function(LoginUiEvent) _then;
}

/// @nodoc
abstract class $LoginSuccessCopyWith<$Res> {
  factory $LoginSuccessCopyWith(
          LoginSuccess value, $Res Function(LoginSuccess) then) =
      _$LoginSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoginSuccessCopyWithImpl<$Res> extends _$LoginUiEventCopyWithImpl<$Res>
    implements $LoginSuccessCopyWith<$Res> {
  _$LoginSuccessCopyWithImpl(
      LoginSuccess _value, $Res Function(LoginSuccess) _then)
      : super(_value, (v) => _then(v as LoginSuccess));

  @override
  LoginSuccess get _value => super._value as LoginSuccess;
}

/// @nodoc

class _$LoginSuccess implements LoginSuccess {
  const _$LoginSuccess();

  @override
  String toString() {
    return 'LoginUiEvent.loginSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoginSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loginSuccess,
    required TResult Function(String message) showSnackBar,
  }) {
    return loginSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loginSuccess,
    TResult Function(String message)? showSnackBar,
  }) {
    return loginSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loginSuccess,
    TResult Function(String message)? showSnackBar,
    required TResult orElse(),
  }) {
    if (loginSuccess != null) {
      return loginSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginSuccess value) loginSuccess,
    required TResult Function(ShowSnackBar value) showSnackBar,
  }) {
    return loginSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoginSuccess value)? loginSuccess,
    TResult Function(ShowSnackBar value)? showSnackBar,
  }) {
    return loginSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginSuccess value)? loginSuccess,
    TResult Function(ShowSnackBar value)? showSnackBar,
    required TResult orElse(),
  }) {
    if (loginSuccess != null) {
      return loginSuccess(this);
    }
    return orElse();
  }
}

abstract class LoginSuccess implements LoginUiEvent {
  const factory LoginSuccess() = _$LoginSuccess;
}

/// @nodoc
abstract class $ShowSnackBarCopyWith<$Res> {
  factory $ShowSnackBarCopyWith(
          ShowSnackBar value, $Res Function(ShowSnackBar) then) =
      _$ShowSnackBarCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$ShowSnackBarCopyWithImpl<$Res> extends _$LoginUiEventCopyWithImpl<$Res>
    implements $ShowSnackBarCopyWith<$Res> {
  _$ShowSnackBarCopyWithImpl(
      ShowSnackBar _value, $Res Function(ShowSnackBar) _then)
      : super(_value, (v) => _then(v as ShowSnackBar));

  @override
  ShowSnackBar get _value => super._value as ShowSnackBar;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(ShowSnackBar(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ShowSnackBar implements ShowSnackBar {
  const _$ShowSnackBar(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'LoginUiEvent.showSnackBar(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShowSnackBar &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  $ShowSnackBarCopyWith<ShowSnackBar> get copyWith =>
      _$ShowSnackBarCopyWithImpl<ShowSnackBar>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loginSuccess,
    required TResult Function(String message) showSnackBar,
  }) {
    return showSnackBar(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loginSuccess,
    TResult Function(String message)? showSnackBar,
  }) {
    return showSnackBar?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loginSuccess,
    TResult Function(String message)? showSnackBar,
    required TResult orElse(),
  }) {
    if (showSnackBar != null) {
      return showSnackBar(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginSuccess value) loginSuccess,
    required TResult Function(ShowSnackBar value) showSnackBar,
  }) {
    return showSnackBar(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoginSuccess value)? loginSuccess,
    TResult Function(ShowSnackBar value)? showSnackBar,
  }) {
    return showSnackBar?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginSuccess value)? loginSuccess,
    TResult Function(ShowSnackBar value)? showSnackBar,
    required TResult orElse(),
  }) {
    if (showSnackBar != null) {
      return showSnackBar(this);
    }
    return orElse();
  }
}

abstract class ShowSnackBar implements LoginUiEvent {
  const factory ShowSnackBar(String message) = _$ShowSnackBar;

  String get message;
  @JsonKey(ignore: true)
  $ShowSnackBarCopyWith<ShowSnackBar> get copyWith =>
      throw _privateConstructorUsedError;
}
