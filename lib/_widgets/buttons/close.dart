import 'package:flutter/material.dart';

import '../../_helpers/navigation.dart';
import '../../_theme/variables.dart';
import '../others/icons.dart';
import 'button.dart';

class AppCloseButton extends StatelessWidget {
  const AppCloseButton({
    super.key,
    this.onPressed,
    this.faded = false,
    this.noStyling = true,
    this.isX = true,
  });

  final Function()? onPressed;
  final bool faded;
  final bool noStyling;
  final bool isX;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: onPressed ?? () => popWhatsOnTop(),
      noStyling: noStyling,
      isSquare: true,
      child: AppIcon(isX ? closeIcon : Icons.arrow_back_rounded, faded: faded),
    );
  }
}
