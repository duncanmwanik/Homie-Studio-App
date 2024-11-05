import 'package:firebase_auth/firebase_auth.dart';

import '../../../_helpers/debug.dart';
import '../../../_helpers/internet.dart';
import '../../../_helpers/navigation.dart';
import '../../../_services/hive/store.dart';
import '../../../_widgets/others/toast.dart';
import '../../auth/_helpers/auth_error_handler.dart';
import 'helpers.dart';

Future<void> editUserDetails(String userName, String password) async {
  try {
    showToast(2, 'Updating details...');
    if (await noInternet()) return;

    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user != null) {
      AuthCredential credential = EmailAuthProvider.credential(email: liveEmail(), password: password);
      await user.reauthenticateWithCredential(credential);
      await user.updateDisplayName(userName);
      await storage(liveUser()).putAll({'n': userName});
      showToast(1, 'Success. Updated details.');
    }
  } on FirebaseAuthException catch (e) {
    showToast(0, handleFirebaseAuthError(e, process: 'update details'));
  } catch (e) {
    showToast(0, handleOtherErrors(e, process: 'update details'));
  }
}

Future<void> editUserPassword(String currentPassword, String newPassword, String confirmNewPassword) async {
  try {
    hideKeyboard();

    if (newPassword == confirmNewPassword) {
      if (currentPassword != newPassword) {
        if (await noInternet()) return;

        FirebaseAuth auth = FirebaseAuth.instance;
        User? user;

        UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: liveEmail(),
          password: currentPassword,
        );
        user = userCredential.user;

        if (user != null) {
          await user.updatePassword(newPassword);
          showToast(1, 'Success. Password updated...');
        }
      } else {
        showToast(2, 'Current password is same as new password');
      }
    } else {
      showToast(0, 'New passwords not matching');
    }
  } catch (e) {
    logError('change-user-password', e);
    showToast(0, 'Could not change password...');
  }
}
