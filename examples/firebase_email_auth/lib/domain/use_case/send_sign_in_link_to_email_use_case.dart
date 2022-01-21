import 'package:firebase_auth/firebase_auth.dart';

class SendSignInLinkToEmailUseCase {
  final acs = ActionCodeSettings(
      // URL you want to redirect back to. The domain (www.example.com) for this
      // URL must be whitelisted in the Firebase Console.
      url: 'https://survivalcoding.page.link/home',
      // This must be true
      handleCodeInApp: true,
      iOSBundleId: 'com.example.emailauth',
      androidPackageName: 'com.example.firebase_email_auth',
      // installIfNotAvailable
      androidInstallApp: true,
      // minimumVersion
      androidMinimumVersion: '1');

  Future<void> call(String emailAuth) async {
    // 이메일 검사
    if (!emailAuth.endsWith('gmail.com')) {
      throw InvalidEduDomainException('학교 이메일이 아닙니다');
    }

    return FirebaseAuth.instance
        .sendSignInLinkToEmail(email: emailAuth, actionCodeSettings: acs);
  }
}

class InvalidEduDomainException implements Exception {
  final String message;

  InvalidEduDomainException(this.message);
}
