import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../_providers/theme.dart';
import '../../_theme/background.dart';
import '../../_theme/breakpoints.dart';
import '../../_widgets/others/others/scroll.dart';
import 'appbar.dart';
import 'panel/panel.dart';
import 'view.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Consumer<ThemeProvider>(builder: (context, theme, child) {
        return SafeArea(
          child: Column(
            children: [
              //
              CustomAppBar(),
              //
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isSmallPC()) Panel(),
                    Expanded(
                      child: NoScrollBars(child: AppView()),
                    ),
                  ],
                ),
              ),
              //
            ],
          ),
        );
      }),
    );
  }
}
