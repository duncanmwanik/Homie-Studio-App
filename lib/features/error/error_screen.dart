import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../_providers/theme.dart';
import '../../_theme/background.dart';
import '../../_theme/spacing.dart';
import '../../_theme/variables.dart';
import '../../_widgets/buttons/planet.dart';
import '../../_widgets/others/images.dart';
import '../../_widgets/others/text.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        backgroundColor: transparent,
        body: Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // appbar
              Padding(
                padding: padM(),
                child: Planet(
                  onPressed: () async => context.go('/'),
                  isSquare: true,
                  leading: Icons.arrow_back_rounded,
                ),
              ),
              // content
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppImage('oops.png', height: 25.h, fit: BoxFit.fitHeight),
                        sph(),
                        AppText(size: normal, 'Lost in space :(', textAlign: TextAlign.center),
                        mph(),
                        Planet(
                          onPressed: () => context.go('/'),
                          srp: true,
                          color: styler.accentColor(),
                          radius: borderRadiusCrazy,
                          textColor: white,
                          leading: 'Go back',
                          trailing: Icons.arrow_forward_rounded,
                        ),
                        elph(),
                      ],
                    ),
                  ),
                ),
              ),
              //
            ],
          );
        }),
      ),
    );
  }
}
