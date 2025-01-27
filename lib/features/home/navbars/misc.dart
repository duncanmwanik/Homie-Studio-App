import 'package:flutter/material.dart';

import '../../../_helpers/global.dart';
import '../../../_theme/variables.dart';
import '../../../_widgets/buttons/planet.dart';
import '../../../_widgets/others/text.dart';

class CalendarNavIcon extends StatelessWidget {
  const CalendarNavIcon({
    super.key,
    required this.isSelected,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 21,
      width: 21,
      child: Planet(
        padding: noPadding,
        color: styler.textColor(faded: !isSelected),
        radius: borderRadiusLarge,
        child: Center(
          child: AppText(
            now().day.toString(),
            size: 11,
            bold: true,
            color: styler.invertedTextColor(),
          ),
        ),
      ),
    );
  }
}
