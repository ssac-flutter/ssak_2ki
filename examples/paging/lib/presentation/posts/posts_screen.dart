import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:json_pagenation_sample/domain/model/post.dart';
import 'package:json_pagenation_sample/presentation/posts/posts_view_model.dart';
import 'package:provider/provider.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  final _pagingController = PagingController<int, Post>(firstPageKey: 1);

  final _expandTiles = <int>{};

  @override
  void initState() {
    Future.microtask(() {
      final viewModel = context.read<PostsViewModel>();

      _pagingController.addPageRequestListener((pageKey) {
        viewModel.fetchPage(pageKey);
      });

      viewModel.pagingController = _pagingController;

      viewModel.fetchPage(1);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: PagedListView<int, Post>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Post>(
          itemBuilder: (context, post, index) => ListTile(
            onTap: () {
              setState(() {
                if (_expandTiles.contains(post.id)) {
                  _expandTiles.remove(post.id);
                } else {
                  _expandTiles.add(post.id);
                }
              });
            },
            title:
                Text(post.title, style: Theme.of(context).textTheme.headline6),
            subtitle: Column(
              children: [
                Text(post.name, style: Theme.of(context).textTheme.bodyText1),
                Text(
                  post.body,
                  style: Theme.of(context).textTheme.bodyText2,
                  overflow: _expandTiles.contains(post.id) ? null : TextOverflow.ellipsis,
                  maxLines: _expandTiles.contains(post.id) ? null : 2,
                  
                ),
              ],
            ),
            leading: Text('${post.id}'),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
