import 'dart:async';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_email_auth/domain/use_case/send_sign_in_link_to_email_use_case.dart';
import 'package:firebase_email_auth/domain/use_case/sign_in_with_email_link_use_case.dart';
import 'package:firebase_email_auth/presentation/login_event.dart';
import 'package:firebase_email_auth/presentation/login_ui_event.dart';
import 'package:flutter/material.dart';

class LoginViewModel with ChangeNotifier {
  final _sendSignInLinkToEmailUseCase = SendSignInLinkToEmailUseCase();
  final _signInWithEmailLinkUseCase = SignInWithEmailLinkUseCase();

  final _eventController = StreamController<LoginUiEvent>.broadcast();

  StreamSubscription? subscription;

  Stream<LoginUiEvent> get eventStream => _eventController.stream;

  void onEvent(LoginEvent event) {
    event.when(
      sendSignInLinkToEmail: (email) async {
        try {
          await _sendSignInLinkToEmailUseCase(email);
          print('Successfully sent email verification');
          _eventController.add(const LoginUiEvent.showSnackBar(
              'Successfully sent email verification'));

          subscription?.cancel();
          subscription = FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) async {

            final emailLink = dynamicLinkData.link.toString();

            // Confirm the link is a sign-in with email link.
            final result = await _signInWithEmailLinkUseCase(email, emailLink);
            result.when(
              success: (email) {
                print('로그인 성공');
                _eventController.add(const LoginUiEvent.loginSuccess());
              },
              error: (message) {
                print(message);
                _eventController.add(LoginUiEvent.showSnackBar(message));
              },
            );
          })..onError((error) {
            // Handle errors
            print(error.toString());
            _eventController.add(LoginUiEvent.showSnackBar(error.toString()));
          });

        } on InvalidEduDomainException {
          print('학교 계정이 아님');
          _eventController.add(const LoginUiEvent.showSnackBar('학교 계정이 아님'));
        } catch (e) {
          print('Error sending email verification $e');
          _eventController.add(
              LoginUiEvent.showSnackBar('Error sending email verification $e'));
        }
      },
    );
  }
}
