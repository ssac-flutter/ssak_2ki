import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_email_auth/core/result.dart';

class SignInWithEmailLinkUseCase {
  Future<Result<String>> call(String emailAuth, String emailLink) async {
    try {
      final auth = FirebaseAuth.instance;
      if (auth.isSignInWithEmailLink(emailLink)) {
        // The client SDK will parse the code from the link for you.
        final userCredential = await auth.signInWithEmailLink(
            email: emailAuth, emailLink: emailLink);

        var userEmail = userCredential.user;
        print('Successfully signed in with email link!');
        return Result.success(emailAuth);
      }
      return const Result.error('잘못된 링크!!!');
    } catch (e) {
      print('Error signing in with email link $e');
      return Result.error('Error signing in with email link $e');
    }
  }
}
