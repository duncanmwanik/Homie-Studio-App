import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../_theme/breakpoints.dart';
import '../../../_theme/variables.dart';
import '../../../_widgets/others/background.dart';
import '../../../_widgets/others/others/other.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: isPhone() ? 80.w : 350,
      backgroundColor: transparent,
      elevation: 0,
      surfaceTintColor: transparent,
      shape: RoundedRectangleBorder(),
      child: AppBackground(
        child: NoWidget(),
      ),
    );
  }
}
