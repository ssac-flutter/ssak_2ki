
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

import 'auth_state.dart';

class AuthService {
  final LocalAuthentication auth = LocalAuthentication();

  Future<AuthState> authenticate() async {
    final isDeviceSupported = await auth.isDeviceSupported();

    if (isDeviceSupported) {
      try {
        bool canCheckBiometrics = await auth.canCheckBiometrics;

        if (canCheckBiometrics) {
          List<BiometricType> availableBiometrics =
              await auth.getAvailableBiometrics();

          final result = await auth.authenticate(
              localizedReason: '생체 인증을 시작해 주세요',
              useErrorDialogs: true,
              stickyAuth: true);

          if (result) {
            return const AuthState.success();
          } else {
            return const AuthState.error('생체정보 인증 실패');
          }
        } else {
          return const AuthState.error('생체정보 인증 실패');
        }
      } on PlatformException catch (e) {
        return AuthState.error(e.message ?? '생체정보 인증 실패');
      }
    }

    return const AuthState.error('이 기기에서 로컬 인증을 지원하지 않습니다');
  }
}
