import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../_providers/focus.dart';
import '../../_theme/spacing.dart';
import '../../_theme/variables.dart';
import '../../_widgets/buttons/button.dart';
import '../../_widgets/others/icons.dart';
import '../../_widgets/others/text.dart';
import 'var/intro_features.dart';

class AuthIntro extends StatelessWidget {
  const AuthIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FocusProvider>(builder: (context, focus, child) {
      int index = focus.index;

      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // previous button
              AppButton(
                onPressed: () => focus.setIndex(index > 0 ? index - 1 : introFeatures.length - 1),
                noStyling: true,
                isSquare: true,
                radius: borderRadiusTinySmall,
                child: AppIcon(Icons.keyboard_arrow_left, extraFaded: true),
              ),
              spw(),
              // feature
              Expanded(
                child: Padding(
                  padding: padM('t'),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppIcon(introFeatures[index].icon, faded: true),
                      sph(),
                      AppText(text: introFeatures[index].title, size: normal, faded: true, weight: FontWeight.bold),
                      tph(),
                      SizedBox(
                        height: 40,
                        child: AppText(
                          size: small,
                          text: introFeatures[index].description,
                          faded: true,
                          weight: FontWeight.w400,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              spw(),
              // next button
              AppButton(
                onPressed: () => focus.setIndex(index < introFeatures.length - 1 ? index + 1 : 0),
                noStyling: true,
                isSquare: true,
                radius: borderRadiusTinySmall,
                child: AppIcon(Icons.keyboard_arrow_right, extraFaded: true),
              ),
            ],
          ),
          //
          msph(),
          //
        ],
      );
    });
  }
}
