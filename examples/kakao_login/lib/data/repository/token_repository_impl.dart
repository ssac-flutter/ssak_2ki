import 'package:kakao_login/data/data_source/local/token_local_data_source.dart';
import 'package:kakao_login/domain/repository/token_repository.dart';

class TokenRepositoryImpl implements TokenRepository {
  final TokenLocalDataSource tokenLocalDataSource;

  TokenRepositoryImpl(this.tokenLocalDataSource);

  @override
  Future<String> loadAccessToken() async {
    return await tokenLocalDataSource.loadAccessToken();
  }

  @override
  Future<String> loadRefreshToken() async {
    return await tokenLocalDataSource.loadRefreshToken();
  }

  @override
  Future<void> saveAccessToken(String token) async {
    return await tokenLocalDataSource.saveAccessToken(token);
  }

  @override
  Future<void> saveRefreshToken(String token) async {
    return await tokenLocalDataSource.saveRefreshToken(token);
  }
}
