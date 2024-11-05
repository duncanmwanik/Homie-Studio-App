import '../_widgets/others/toast.dart';
import 'debug.dart';

void handleUnhandledExceptions(error, StackTrace stackTrace) {
  String message = error.toString();
  String toastMessage = '';

  if (message.startsWith('[firebase_storage/firebase_storage] Object does not exist at location')) {
    toastMessage = 'File is missing.';
  } else if (message.startsWith('com.google.firebase.FirebaseException: An internal error has occurred')) {
    toastMessage = 'Network error. Please check your internet connection.';
  } else {}

  // show('--------------------------- UNHANDLED');
  // show('$error :: $stackTrace');
  // show('--------------------------- UNHANDLED');
  if (toastMessage.isNotEmpty) showToast(0, toastMessage);
}

String handleOtherErrors(dynamic error, {String process = 'process'}) {
  String message = error.toString();
  logError(process, message);

  if (message.contains('firebase_database/permission-denied')) {
    return 'Failed operation.';
  } else {
    return 'Could not $process. Please try again.';
  }
}
