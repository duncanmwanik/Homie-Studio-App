import 'package:flutter/material.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

import '../../_theme/spacing.dart';
import '../../_theme/styler.dart';
import '../../_theme/variables.dart';
import 'text.dart';

class AppTooltip extends StatelessWidget {
  const AppTooltip({super.key, this.message, required this.child, this.axisDirection});

  final String? message;
  final Widget child;
  final AxisDirection? axisDirection;

  @override
  Widget build(BuildContext context) {
    return message != null
        ? JustTheTooltip(
            backgroundColor: styler.isDark ? AppColors.lightTertiary : Colors.black.withOpacity(0.8),
            borderRadius: BorderRadius.circular(borderRadiusSuperTiny),
            waitDuration: const Duration(milliseconds: 500),
            offset: 10,
            content: Padding(
              padding: pad(c: 'l5,r5,t2,b2'),
              child: AppText(size: small, text: message ?? '', color: styler.isDark ? black : white),
            ),
            preferredDirection: axisDirection ?? AxisDirection.down,
            tailLength: 0,
            tailBaseWidth: 0,
            shadow: Shadow(blurRadius: 5, color: Colors.grey.withOpacity(0.3)),
            child: child,
          )
        : child;
  }
}
