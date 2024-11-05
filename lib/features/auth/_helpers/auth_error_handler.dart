import 'package:firebase_auth/firebase_auth.dart';

import '../../../_helpers/debug.dart';

String handleFirebaseAuthError(FirebaseAuthException e, {String process = 'process'}) {
  String message = e.message ?? '';
  logError('sign-in-firebaseAuth: code: ${e.code}', e);

  if (e.code == 'user-not-found' || e.code == 'invalid-login-credentials') {
    return 'No account found for that email.';
  }
  //
  else if (e.code == 'wrong-password' || message.contains('auth/wrong-password')) {
    return 'Wrong password.';
  }
  //
  else if (e.code == 'invalid-email') {
    return 'Email is invalid.';
  }
  //
  else if (e.code == 'user-disabled') {
    return 'Account has been disabled.';
  }
  //
  else if (e.code == 'too-many-requests') {
    return 'Please try again after some time.';
  }
  //
  else if (e.code == 'operation-not-allowed') {
    return 'Could not sign in. Try again later.';
  }
  //
  else if (e.code == 'weak-password') {
    return 'Password is too weak.';
  }
  //
  else if (e.code == 'email-already-in-use') {
    return 'Acccount already exists.';
  }
  //
  else if (e.code == 'invalid-credential') {
    return 'Incorrect email or password.';
  }
  //
  else if (e.code == 'network-request-failed' || message.startsWith('A network AuthError ')) {
    return 'Check your internet connection.';
  }
  //
  else {
    return 'Could not $process. Please try again.';
  }
}

String handleOtherErrors(dynamic error, {String process = 'process'}) {
  String message = error.toString();
  logError(process, message);

  if (message.contains('firebase_database/permission-denied')) {
    return 'No access.';
  } else {
    return 'Could not $process. Please try again.';
  }
}
