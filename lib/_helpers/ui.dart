import 'package:flutter/services.dart';

import '../_providers/_providers.dart';
import '../_theme/variables.dart';
import 'extentions/strings.dart';

void setWindowTitle(String title) {
  SystemChrome.setApplicationSwitcherDescription(
    ApplicationSwitcherDescription(label: title, primaryColor: styler.accentColor().value),
  );
}

void resetWindowTitle() => setWindowTitle('Sayari • ${state.views.view.cap()}');
