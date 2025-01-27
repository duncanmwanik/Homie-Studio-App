import '../_widgets/others/toast.dart';

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
