import 'package:flutter/services.dart';

import '../_widgets/others/toast.dart';
import 'debug.dart';

Future<void> copyText(String? text, {String? description, bool toast = true}) async {
  safeRun(
    where: 'copyText',
    () async {
      await Clipboard.setData(ClipboardData(text: text ?? '')).then((value) {
        if (toast) showToast(1, description ?? 'Copied link.');
      });
    },
  );
}
