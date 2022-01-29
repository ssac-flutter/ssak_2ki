abstract class TokenRepository {
  Future<String> loadAccessToken();

  Future<String> loadRefreshToken();

  Future<void> saveAccessToken(String token);

  Future<void> saveRefreshToken(String token);
}
