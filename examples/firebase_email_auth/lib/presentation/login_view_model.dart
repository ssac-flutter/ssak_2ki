import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
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

  Stream<LoginUiEvent> get eventStream => _eventController.stream;

  LoginViewModel() {
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) async {
      // Navigator.pushNamed(context, dynamicLinkData.link.path);
      print(dynamicLinkData.link.path);

// Retrieve the email from wherever you stored it
      var emailAuth = 'a811219@gmail.com';

      final emailLink = dynamicLinkData.link.toString();
      print(dynamicLinkData.link.toString());

// Confirm the link is a sign-in with email link.
      final result = await _signInWithEmailLinkUseCase(emailAuth, emailLink);
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
    }).onError((error) {
      // Handle errors
      print(error.toString());
      _eventController.add(LoginUiEvent.showSnackBar(error.toString()));
    });
  }

  void onEvent(LoginEvent event) {
    event.when(
      sendSignInLinkToEmail: (email) async {
        try {
          await _sendSignInLinkToEmailUseCase(email);
          print('Successfully sent email verification');
          _eventController.add(const LoginUiEvent.showSnackBar(
              'Successfully sent email verification'));
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
