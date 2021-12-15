import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_pagenation_sample/domain/model/post.dart';

part 'posts_state.freezed.dart';

part 'posts_state.g.dart';

@freezed
class PostsState with _$PostsState {
  factory PostsState({
    required List<Post> posts,
  }) = _PostsState;

  factory PostsState.fromJson(Map<String, dynamic> json) => _$PostsStateFromJson(json);
}