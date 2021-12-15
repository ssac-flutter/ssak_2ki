import 'package:json_pagenation_sample/core/result.dart';
import 'package:json_pagenation_sample/domain/model/post.dart';
import 'package:json_pagenation_sample/domain/repository/post_repository.dart';
import 'package:json_pagenation_sample/domain/repository/user_repository.dart';

class GetPosts {
  final PostRepository postRepository;
  final UserRepository userRepository;

  GetPosts({
    required this.postRepository,
    required this.userRepository,
  });

  Future<Result<List<Post>>> call(int page, int limit) async {
    final postResult = await postRepository.getPosts(page, limit);
    final userResult = await userRepository.getUsers();

    return postResult.when(
      success: (posts) {
        return userResult.when(
          success: (users) {
            List<Post> merged = posts.map((post) {
              final userName =
                  users.where((user) => user.id == post.userId).first.name;
              return post.copyWith(
                name: userName,
              );
            }).toList();
            return Result.success(merged);
          },
          error: (e) {
            return Result.error(e);
          },
        );
      },
      error: (e) {
        return Result.error(e);
      },
    );
  }
}
