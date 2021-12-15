// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostsState _$$_PostsStateFromJson(Map<String, dynamic> json) =>
    _$_PostsState(
      posts: (json['posts'] as List<dynamic>)
          .map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PostsStateToJson(_$_PostsState instance) =>
    <String, dynamic>{
      'posts': instance.posts,
    };
