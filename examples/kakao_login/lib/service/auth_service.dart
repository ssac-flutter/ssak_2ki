import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kakao_login/domain/model/user_model.dart';


class AuthService {
  static final AuthService instance = AuthService._internal();

  factory AuthService() => instance;

  AuthService._internal();

  final secureStorage = const FlutterSecureStorage();
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> login() async {
    // 인가
    final url = Uri.https('kauth.kakao.com', '/oauth/authorize', {
      'response_type': 'code',
      'client_id': '776149c5b579ed8938aae9974f31e747',
      'redirect_uri':
          'http://10.0.2.2:5001/fir-test-b1efc/us-central1/kakaologin',
      'scope': 'account_email profile_nickname profile_image',
    });

    final result = await FlutterWebAuth.authenticate(
        url: url.toString(),
        callbackUrlScheme:
            'webauthcallback');

    final code = Uri.parse(result).queryParameters['code'];

    // 토큰
    final response = await http.post(Uri.parse('https://kauth.kakao.com/oauth/token'), body: {
      'client_id': '776149c5b579ed8938aae9974f31e747',
      'redirect_uri': 'http://10.0.2.2:5001/fir-test-b1efc/us-central1/kakaologin',
      'grant_type': 'authorization_code',
      'code': code,
    });

    final responseJson = jsonDecode(response.body);
    final accessToken = responseJson['access_token'] as String;
    final refreshToken = responseJson['refresh_token'] as String;

    print('accessToken: $accessToken');
    print('refreshToken: $refreshToken');

    // 유저 정보
    final userResponse = await http.get(Uri.parse('https://kapi.kakao.com/v2/user/me'), headers: {
      'Authorization': 'Bearer $accessToken',
    });

    final userResponseJson = jsonDecode(userResponse.body);
    final id = userResponseJson['id'] as int;
    final displayName = userResponseJson['properties']['nickname'] as String;
    final photoUrl = userResponseJson['properties']['profile_image'] as String;
    final email = userResponseJson['kakao_account']['email'] as String;

    print({
      'id': id,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'email': email
    });

    // Firebase 토큰
    final customTokenResponse = await http.post(Uri.parse('http://10.0.2.2:5001/fir-test-b1efc/us-central1/createCustomToken'),
      body: {
        'id': id.toString(),
        'displayName': displayName,
        'photoUrl': photoUrl,
        'email': email
      }
    );
    print('customToken : ${customTokenResponse.body}');
    final userCredential = await FirebaseAuth.instance.signInWithCustomToken(customTokenResponse.body);
  }
}
