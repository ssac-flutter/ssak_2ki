import 'package:kakao_login/data/data_source/local/token_local_data_source.dart';
import 'package:kakao_login/data/data_source/remote/kakao_remote_data_source.dart';
import 'package:kakao_login/domain/model/user_model.dart';
import 'package:kakao_login/domain/repository/user_repository.dart';

class KakaoUserRepositoryImpl implements UserRepository {
  final KakaoRemoteDataSource kakaoRemoteDataSource;
  final TokenLocalDataSource tokenLocalDataSource;

  KakaoUserRepositoryImpl(
    this.kakaoRemoteDataSource,
    this.tokenLocalDataSource,
  );

  @override
  Future<UserModel> getUser() async {
    final accessToken = await tokenLocalDataSource.loadAccessToken();
    return await kakaoRemoteDataSource.getUser(accessToken);
  }
}
