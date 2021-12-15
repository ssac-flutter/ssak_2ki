import 'package:json_pagenation_sample/data/repository/post_repository_impl.dart';
import 'package:json_pagenation_sample/data/repository/user_repository_impl.dart';
import 'package:json_pagenation_sample/domain/use_case/get_posts.dart';
import 'package:json_pagenation_sample/presentation/posts/posts_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> viewModels = [
  ChangeNotifierProvider<PostsViewModel>(
    create: (context) => PostsViewModel(
      GetPosts(
        postRepository: PostRepositoryImpl(),
        userRepository: UserRepositoryImpl(),
      ),
    ),
  ),
];
