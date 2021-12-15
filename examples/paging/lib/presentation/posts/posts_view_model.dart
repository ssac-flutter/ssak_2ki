
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:json_pagenation_sample/domain/model/post.dart';
import 'package:json_pagenation_sample/domain/use_case/get_posts.dart';
import 'package:json_pagenation_sample/presentation/posts/posts_state.dart';

class PostsViewModel with ChangeNotifier {
  static const _pageSize = 20;

  final GetPosts _getPosts;

  PostsState _state = PostsState(posts: []);

  PostsState get state => _state;

  PagingController<int, Post> _pagingController =
      PagingController(firstPageKey: 1);

  set pagingController(PagingController<int, Post> controller) {
    _pagingController = controller;
  }

  PostsViewModel(this._getPosts);

  void fetchPage(int page) async {
    final result = await _getPosts(page, _pageSize);
    result.when(
      success: (newItems) {
        final isLastPage = newItems.length < _pageSize;
        if (isLastPage) {
          _pagingController.appendLastPage(newItems);
        } else {
          final nextPageKey = page + 1;
          _pagingController.appendPage(newItems, nextPageKey);
        }

        _state = state.copyWith(posts: state.posts..addAll(newItems));
      },
      error: (e) {
        print(e);
        _pagingController.error = e;
      },
    );
    notifyListeners();
  }
}
