import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';

import '../_providers/_providers.dart';

void onResumedAppState(AppLifecycleState lifecycleState) {
  if (lifecycleState == AppLifecycleState.resumed && !kIsWeb) state.theme.enableThemeType();
}
