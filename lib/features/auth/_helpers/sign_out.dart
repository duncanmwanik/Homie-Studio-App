import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

import '../../../_variables/navigation.dart';
import '../../../_widgets/dialogs/confirmation_dialog.dart';

Future<void> signOutUser() async {
  await showConfirmationDialog(
      title: 'Are you sure you want to sign out?',
      yeslabel: 'Sign Out',
      onAccept: () async {
        await FirebaseAuth.instance.signOut();
        navigatorState.currentContext!.go('/welcome');
      });
}
