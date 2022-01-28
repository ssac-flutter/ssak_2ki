import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kakao_login/domain/model/user_model.dart';

class KakaoApi {
  final http.Client _client;

  KakaoApi({http.Client? client}) : _client = client ?? http.Client();

  Future<UserModel> getUser(String accessToken) async {
    final response =
        await _client.get(Uri.parse('https://kapi.kakao.com/v2/user/me'));
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);

    final email = jsonResponse['kakao_account']['email'];
    final displayName = jsonResponse['properties']['nickname'];
    final photoUrl = jsonResponse['properties']['profile_image'];

    return UserModel(
        displayName: displayName, email: email, photoUrl: photoUrl);
  }
}
