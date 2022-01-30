import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:kakao_login/domain/model/user_model.dart';

class FirebaseAuthRemoteDataSource {
  final String createCustomTokenUrl =
      dotenv.env['CREATE_CUSTOM_TOKEN_URL'] as String;

  final http.Client _client;

  FirebaseAuthRemoteDataSource({
    http.Client? client,
  }) : _client = client ?? http.Client();

  Future<String> createCustomToken(UserModel userModel) async {
    // Firebase 토큰
    final customTokenResponse = await _client
        .post(Uri.parse(createCustomTokenUrl), body: userModel.toJson());

    print('customToken : ${customTokenResponse.body}');

    return customTokenResponse.body;
  }
}
