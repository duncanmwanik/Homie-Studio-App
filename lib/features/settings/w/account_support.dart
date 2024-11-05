import 'package:flutter/material.dart';

import '../../../_helpers/url_launcher.dart';
import '../../../_theme/spacing.dart';
import '../../../_theme/variables.dart';
import '../../../_widgets/buttons/button.dart';
import '../../auth/_helpers/sign_out.dart';
import 'title.dart';

class AccountSupport extends StatelessWidget {
  const AccountSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //
        SettingTitle('SUPPORT'),
        sph(),
        AppButton(
          onPressed: () => sendFeedbackDialog(),
          leading: 'Send Feedback',
          trailing: Icons.keyboard_arrow_right_rounded,
          expand: true,
          color: styler.appColor(0.7),
          height: 35,
        ),
        tsph(),
        AppButton(
          onPressed: () => signOutUser(),
          leading: 'Sign Out',
          trailing: Icons.exit_to_app_rounded,
          faded: true,
          expand: true,
          color: styler.appColor(0.7),
          height: 35,
        ),
        //
      ],
    );
  }
}
