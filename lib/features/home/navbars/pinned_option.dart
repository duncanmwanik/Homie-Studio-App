import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../_helpers/extentions/strings.dart';
import '../../../_services/hive/local_storage_service.dart';
import '../../../_theme/variables.dart';
import '../../../_widgets/menu/menu_item.dart';

class PinnedNavOption extends StatelessWidget {
  const PinnedNavOption({
    super.key,
    required this.type,
    this.isDefault = false,
  });

  final String type;
  final bool isDefault;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: settingBox.listenable(keys: ['showNavItem_$type']),
        builder: (context, box, widget) {
          bool show = box.get('showNavItem_$type', defaultValue: '1') == '1';

          return MenuItem(
            onTap: isDefault ? null : () => box.put('showNavItem_$type', show ? '0' : '1'),
            label: type.cap(),
            trailing: show ? Icons.push_pin : Icons.push_pin_outlined,
            trailingColor: isDefault
                ? styler.appColor(3)
                : show
                    ? styler.accent
                    : null,
            trailingSize: 14,
            pop: false,
          );
        });
  }
}
