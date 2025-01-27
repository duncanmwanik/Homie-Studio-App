import 'debug.dart';

void safeRun(Function() operation, {String where = 'app-run', Function()? onError}) {
  try {
    operation();
  } catch (e) {
    if (onError != null) onError();
    logError(where, e);
  }
}
