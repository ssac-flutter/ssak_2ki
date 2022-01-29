import 'package:http/http.dart' as http;
import 'package:kakao_login/domain/model/user_model.dart';

class FirebaseAuthRemoteDataSource {
  static const createCustomTokenUrl =
      'http://10.0.2.2:5001/fir-test-b1efc/us-central1/createCustomToken';

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
