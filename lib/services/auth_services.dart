// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:carry_or_drag/common/auth_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';

class AuthService {
  signIn(BuildContext context, TextEditingController emailController,
      TextEditingController passwordController) async {
    final pop = Navigator.pop(context);
    showDialog(
        context: context,
        builder: ((context) => const Center(
            child: SizedBox(
                height: 40, width: 40, child: CircularProgressIndicator()))));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      pop;
    } on FirebaseAuthException catch (e) {
      pop;
      if (e.code == 'user-not-found') {
        await authFunctions.errorMessage(
            "No User Found for that email", context);
      } else if (e.code == 'wrong-password') {
        await authFunctions.errorMessage("Wrong password", context);
      } else if (e.code == 'invalid-credential') {
        await authFunctions.errorMessage("Invalid Credentials", context);
      } else {
        await authFunctions.errorMessage("Login Unsuccessful", context);
      }
    }
  }

  signUpWithEmailPassword(
      BuildContext context,
      TextEditingController emailController,
      TextEditingController passwordController) async {
    showDialog(
        context: context,
        builder: ((context) => const Center(
            child: SizedBox(
                height: 40, width: 40, child: CircularProgressIndicator()))));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        await authFunctions.errorMessage(
            "No User Found for that email", context);
      } else if (e.code == 'wrong-password') {
        await authFunctions.errorMessage("Wrong password", context);
      } else if (e.code == 'invalid-credential') {
        await authFunctions.errorMessage("Invalid Credentials", context);
      } else {
        await authFunctions.errorMessage("Login Unsuccessful", context);
      }
    }
  }

  Future<bool> signInWithGoogle() async {
    try {
      // begin singin process
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      // obtain auth details from request
      final GoogleSignInAuthentication gAuth = await gUser!.authentication;
      // create new credetial for user
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );
      // let sign in
      await FirebaseAuth.instance.signInWithCredential(credential);
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<User> signInWithApple({List<Scope> scopes = const []}) async {
    final result = await TheAppleSignIn.performRequests(
        [AppleIdRequest(requestedScopes: scopes)]);
    switch (result.status) {
      case AuthorizationStatus.authorized:
        final appleIdCredential = result.credential!;
        final oAuthCredential = OAuthProvider('apple.com');
        final credential = oAuthCredential.credential(
            idToken: String.fromCharCodes(appleIdCredential.identityToken!));
        final userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        final firebaseUser = userCredential.user!;
        if (scopes.contains(Scope.fullName)) {
          final fullName = appleIdCredential.fullName;
          if (fullName != null &&
              fullName.givenName != null &&
              fullName.familyName != null) {
            final displayName = '${fullName.givenName}${fullName.familyName}';
            await firebaseUser.updateDisplayName(displayName);
          }
        }
        return firebaseUser;
      case AuthorizationStatus.error:
        throw PlatformException(
            code: 'ERROR_AUTHORIZATION_DENIED',
            message: result.error.toString());

      case AuthorizationStatus.cancelled:
        throw PlatformException(
            code: 'ERROR_ABORTED_BY_USER', message: 'Sign in aborted by user');
      default:
        throw UnimplementedError();
    }
  }

  signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();
    log(loginResult.message!);

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
