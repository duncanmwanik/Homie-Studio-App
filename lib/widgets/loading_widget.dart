import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common_variables/state_providers.dart';
import '../state/global_state.dart';
import '../theme/theme.dart';

Widget loadingWidget(BuildContext context) {
  return Consumer<GlobalModel>(
      builder: (context, global, child) => Visibility(
          visible: globalWatch.showLoading,
          child: LinearProgressIndicator(
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation(themeColors[themeWatch.selectedTheme]),
          )));
}
