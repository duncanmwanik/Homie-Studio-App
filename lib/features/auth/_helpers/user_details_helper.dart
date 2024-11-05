import 'package:firebase_auth/firebase_auth.dart';

import '../../../_theme/helpers.dart';

Future<bool> isFirstTimer() async {
  try {
    User? user = FirebaseAuth.instance.currentUser;
    bool isFirstTime = user == null;
    changeStatusAndNavigationBarColor(getThemeType());
    return isFirstTime;
  } catch (_) {
    return true;
  }
}
