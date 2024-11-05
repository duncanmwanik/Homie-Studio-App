import 'package:flutter/material.dart';

import '../../../_theme/spacing.dart';
import '../../../_theme/variables.dart';
import '../../../_widgets/buttons/button.dart';
import '../../../_widgets/others/text.dart';
import '../../auth/_helpers/reset_password.dart';
import '../../user/_helpers/helpers.dart';

class PasswordResetWidget extends StatelessWidget {
  const PasswordResetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusSmall),
        side: BorderSide(color: styler.borderColor()),
      ),
      color: transparent,
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        backgroundColor: transparent,
        iconColor: styler.textColor(),
        textColor: styler.textColor(),
        shape: Border(),
        title: AppText(size: normal, text: 'Reset Password', textAlign: TextAlign.start),
        children: [
          sph(),
          //
          AppText(text: 'A password reset link will be sent to your email.', faded: true),
          //
          mph(),
          //
          AppButton(
            onPressed: () async {
              await resetPassword(email: liveEmail(), validate: false);
            },
            color: Colors.red.shade500,
            width: 100,
            child: AppText(text: 'Reset', weight: FontWeight.bold, color: white, textAlign: TextAlign.center),
          ),
          //
          mph(),
          //
        ],
      ),
    );
  }
}
