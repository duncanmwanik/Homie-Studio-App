import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../state/globals.dart';
import '../theme/theme.dart';

Widget loadingWidget(BuildContext context) {
  return Consumer<GlobalModel>(builder: (context, global, child) {
    return Visibility(
        visible: global.showLoading,
        child: LinearProgressIndicator(
          backgroundColor: Colors.white,
          valueColor: AlwaysStoppedAnimation(themeColors[global.themeNo]),
        ));
  });
}
