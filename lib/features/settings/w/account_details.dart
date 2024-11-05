import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../_services/hive/local_storage_service.dart';
import '../../../_theme/spacing.dart';
import '../../../_theme/variables.dart';
import '../../../_widgets/buttons/button.dart';
import '../../../_widgets/others/text.dart';
import '../../user/_helpers/helpers.dart';
import 'title.dart';

class AccountDetails extends StatelessWidget {
  const AccountDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: settingBox.listenable(),
        builder: (context, box, widget) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              SettingTitle('ACCOUNT'),
              sph(),
              AppButton(
                leading: 'Name',
                trailing: AppText(text: liveUserName()),
                expand: true,
                color: styler.appColor(0.7),
                height: 35,
              ),
              tsph(),
              AppButton(
                leading: 'Email',
                trailing: liveEmail(),
                expand: true,
                color: styler.appColor(0.7),
                height: 35,
              ),
              //
            ],
          );
        });
  }
}
