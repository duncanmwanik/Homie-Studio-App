import 'package:flutter/material.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

import '../../_theme/spacing.dart';
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
            elevation: 0,
            backgroundColor: styler.tertiaryColor(),
            borderRadius: BorderRadius.circular(borderRadiusLarge),
            waitDuration: const Duration(milliseconds: 500),
            offset: 10,
            content: Padding(
              padding: padC('l12,r12,t2,b2'),
              child: AppText(
                size: small,
                message ?? '',
                color: styler.textColor(),
              ),
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
