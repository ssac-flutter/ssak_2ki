// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'posts_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostsState _$PostsStateFromJson(Map<String, dynamic> json) {
  return _PostsState.fromJson(json);
}

/// @nodoc
class _$PostsStateTearOff {
  const _$PostsStateTearOff();

  _PostsState call({required List<Post> posts}) {
    return _PostsState(
      posts: posts,
    );
  }

  PostsState fromJson(Map<String, Object?> json) {
    return PostsState.fromJson(json);
  }
}

/// @nodoc
const $PostsState = _$PostsStateTearOff();

/// @nodoc
mixin _$PostsState {
  List<Post> get posts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostsStateCopyWith<PostsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostsStateCopyWith<$Res> {
  factory $PostsStateCopyWith(
          PostsState value, $Res Function(PostsState) then) =
      _$PostsStateCopyWithImpl<$Res>;
  $Res call({List<Post> posts});
}

/// @nodoc
class _$PostsStateCopyWithImpl<$Res> implements $PostsStateCopyWith<$Res> {
  _$PostsStateCopyWithImpl(this._value, this._then);

  final PostsState _value;
  // ignore: unused_field
  final $Res Function(PostsState) _then;

  @override
  $Res call({
    Object? posts = freezed,
  }) {
    return _then(_value.copyWith(
      posts: posts == freezed
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
    ));
  }
}

/// @nodoc
abstract class _$PostsStateCopyWith<$Res> implements $PostsStateCopyWith<$Res> {
  factory _$PostsStateCopyWith(
          _PostsState value, $Res Function(_PostsState) then) =
      __$PostsStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Post> posts});
}

/// @nodoc
class __$PostsStateCopyWithImpl<$Res> extends _$PostsStateCopyWithImpl<$Res>
    implements _$PostsStateCopyWith<$Res> {
  __$PostsStateCopyWithImpl(
      _PostsState _value, $Res Function(_PostsState) _then)
      : super(_value, (v) => _then(v as _PostsState));

  @override
  _PostsState get _value => super._value as _PostsState;

  @override
  $Res call({
    Object? posts = freezed,
  }) {
    return _then(_PostsState(
      posts: posts == freezed
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostsState implements _PostsState {
  _$_PostsState({required this.posts});

  factory _$_PostsState.fromJson(Map<String, dynamic> json) =>
      _$$_PostsStateFromJson(json);

  @override
  final List<Post> posts;

  @override
  String toString() {
    return 'PostsState(posts: $posts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostsState &&
            const DeepCollectionEquality().equals(other.posts, posts));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(posts));

  @JsonKey(ignore: true)
  @override
  _$PostsStateCopyWith<_PostsState> get copyWith =>
      __$PostsStateCopyWithImpl<_PostsState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostsStateToJson(this);
  }
}

abstract class _PostsState implements PostsState {
  factory _PostsState({required List<Post> posts}) = _$_PostsState;

  factory _PostsState.fromJson(Map<String, dynamic> json) =
      _$_PostsState.fromJson;

  @override
  List<Post> get posts;
  @override
  @JsonKey(ignore: true)
  _$PostsStateCopyWith<_PostsState> get copyWith =>
      throw _privateConstructorUsedError;
}
