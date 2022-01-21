// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoginEventTearOff {
  const _$LoginEventTearOff();

  SendSignInLinkToEmail sendSignInLinkToEmail(String email) {
    return SendSignInLinkToEmail(
      email,
    );
  }
}

/// @nodoc
const $LoginEvent = _$LoginEventTearOff();

/// @nodoc
mixin _$LoginEvent {
  String get email => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) sendSignInLinkToEmail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email)? sendSignInLinkToEmail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? sendSignInLinkToEmail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendSignInLinkToEmail value)
        sendSignInLinkToEmail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SendSignInLinkToEmail value)? sendSignInLinkToEmail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendSignInLinkToEmail value)? sendSignInLinkToEmail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginEventCopyWith<LoginEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
          LoginEvent value, $Res Function(LoginEvent) then) =
      _$LoginEventCopyWithImpl<$Res>;
  $Res call({String email});
}

/// @nodoc
class _$LoginEventCopyWithImpl<$Res> implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  final LoginEvent _value;
  // ignore: unused_field
  final $Res Function(LoginEvent) _then;

  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class $SendSignInLinkToEmailCopyWith<$Res>
    implements $LoginEventCopyWith<$Res> {
  factory $SendSignInLinkToEmailCopyWith(SendSignInLinkToEmail value,
          $Res Function(SendSignInLinkToEmail) then) =
      _$SendSignInLinkToEmailCopyWithImpl<$Res>;
  @override
  $Res call({String email});
}

/// @nodoc
class _$SendSignInLinkToEmailCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res>
    implements $SendSignInLinkToEmailCopyWith<$Res> {
  _$SendSignInLinkToEmailCopyWithImpl(
      SendSignInLinkToEmail _value, $Res Function(SendSignInLinkToEmail) _then)
      : super(_value, (v) => _then(v as SendSignInLinkToEmail));

  @override
  SendSignInLinkToEmail get _value => super._value as SendSignInLinkToEmail;

  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(SendSignInLinkToEmail(
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendSignInLinkToEmail implements SendSignInLinkToEmail {
  const _$SendSignInLinkToEmail(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'LoginEvent.sendSignInLinkToEmail(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SendSignInLinkToEmail &&
            const DeepCollectionEquality().equals(other.email, email));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(email));

  @JsonKey(ignore: true)
  @override
  $SendSignInLinkToEmailCopyWith<SendSignInLinkToEmail> get copyWith =>
      _$SendSignInLinkToEmailCopyWithImpl<SendSignInLinkToEmail>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) sendSignInLinkToEmail,
  }) {
    return sendSignInLinkToEmail(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String email)? sendSignInLinkToEmail,
  }) {
    return sendSignInLinkToEmail?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? sendSignInLinkToEmail,
    required TResult orElse(),
  }) {
    if (sendSignInLinkToEmail != null) {
      return sendSignInLinkToEmail(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendSignInLinkToEmail value)
        sendSignInLinkToEmail,
  }) {
    return sendSignInLinkToEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SendSignInLinkToEmail value)? sendSignInLinkToEmail,
  }) {
    return sendSignInLinkToEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendSignInLinkToEmail value)? sendSignInLinkToEmail,
    required TResult orElse(),
  }) {
    if (sendSignInLinkToEmail != null) {
      return sendSignInLinkToEmail(this);
    }
    return orElse();
  }
}

abstract class SendSignInLinkToEmail implements LoginEvent {
  const factory SendSignInLinkToEmail(String email) = _$SendSignInLinkToEmail;

  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  $SendSignInLinkToEmailCopyWith<SendSignInLinkToEmail> get copyWith =>
      throw _privateConstructorUsedError;
}
