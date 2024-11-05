import 'package:flutter/material.dart';

import '../../_theme/spacing.dart';
import '../../_theme/variables.dart';
import '../../_widgets/buttons/button.dart';
import '../../_widgets/others/images.dart';
import '../../_widgets/others/loader.dart';
import '../../_widgets/others/text.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,
    required this.label,
    this.imagePath,
    required this.onPressed,
    this.isBusy = false,
  });

  final String label;
  final String? imagePath;
  final Function() onPressed;
  final bool isBusy;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: onPressed,
      height: 33,
      color: styler.appColor(0.5),
      child: isBusy
          ? Center(child: AppLoader(color: styler.accentColor()))
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (imagePath != null) AppImage(imagePath ?? '', size: normal),
                if (imagePath != null) spw(),
                Flexible(child: AppText(text: label)),
              ],
            ),
    );
  }
}
