import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:http/http.dart' as http;
import 'package:kakao_login/domain/model/token_response.dart';
import 'package:kakao_login/domain/model/user_model.dart';

class KakaoRemoteDataSource {
  final _clientId = dotenv.env['KAKAO_CLIENT_ID'] as String;
  final _redirectUri = dotenv.env['KAKAO_REDIRECT_URL'] as String;

  final http.Client _client;

  KakaoRemoteDataSource({
    http.Client? client,
    FirebaseAuth? firebaseAuth,
  }) : _client = client ?? http.Client();

  Future<void> logout(String accessToken) async {
    await _client.post(
      Uri.parse('https://kapi.kakao.com/v1/user/logout'),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );
  }

  // 3. 유저 정보
  Future<UserModel> getUser(String accessToken) async {
    final response = await _client.get(
      Uri.parse('https://kapi.kakao.com/v2/user/me'),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );
    final responseJson = jsonDecode(response.body);

    final id = responseJson['id'] as int;
    final displayName = responseJson['properties']['nickname'] as String;
    final email = responseJson['kakao_account']['email'] as String;
    final photoURL = responseJson['properties']['profile_image'] as String;

    return UserModel(
      uid: id.toString(),
      displayName: displayName,
      email: email,
      photoURL: photoURL,
    );
  }

  // 2. 토큰
  Future<TokenResponse> requestToken(String authorizationCode) async {
    final response = await _client
        .post(Uri.parse('https://kauth.kakao.com/oauth/token'), body: {
      'client_id': _clientId,
      'redirect_uri': _redirectUri,
      'grant_type': 'authorization_code',
      'code': authorizationCode,
    });

    final responseJson = jsonDecode(response.body);
    final accessToken = responseJson['access_token'] as String;
    final refreshToken = responseJson['refresh_token'] as String;

    print('accessToken: $accessToken');
    print('refreshToken: $refreshToken');

    return TokenResponse(accessToken: accessToken, refreshToken: refreshToken);
  }

  // 1. 인가
  Future<String> requestAuthorizationCode() async {
    final url = Uri.https('kauth.kakao.com', '/oauth/authorize', {
      'response_type': 'code',
      'client_id': _clientId,
      'redirect_uri': _redirectUri,
      'scope': 'account_email profile_nickname profile_image',
    });

    final result = await FlutterWebAuth.authenticate(
        url: url.toString(), callbackUrlScheme: 'webauthcallback');

    final code = Uri.parse(result).queryParameters['code'];
    if (code == null) {
      throw Exception('code 없음');
    }
    return code;
  }

// TODO: RefreshToken
}
