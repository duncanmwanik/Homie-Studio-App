import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../../_helpers/extentions/strings.dart';
import '../../_providers/theme.dart';
import '../../_providers/views.dart';
import '../../_services/hive/local_storage_service.dart';
import '../../_theme/breakpoints.dart';
import '../../_theme/spacing.dart';
import '../../_theme/variables.dart';
import '../../_widgets/others/background.dart';
import '../../_widgets/others/others/scroll.dart';
import '../user/_helpers/helpers.dart';
import 'appbar.dart';
import 'navbars/navbar_horizontal.dart';
import 'panel/panel.dart';
import 'view.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: globalBox.listenable(keys: ['${liveUser()}_currentSpaceId']),
        builder: (context, box, widget) {
          return Consumer2<ThemeProvider, ViewsProvider>(builder: (context, theme, views, child) {
            return AppBackground(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //
                  if (isSmallPC()) Panel(),
                  //
                  Expanded(
                    child: SafeArea(
                      child: Column(
                        children: [
                          //
                          Expanded(
                            child: Title(
                              title: 'Homie • ${(views.view).cap()}',
                              color: styler.accentColor(),
                              child: NoScrollBars(
                                child: Column(
                                  children: [
                                    //
                                    CustomAppBar(),
                                    msph(),
                                    Expanded(child: AppView(view: views.view)),
                                    //
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // bottom navbar
                          if (!isSmallPC()) HorizontalNavigationBox(),
                          //
                        ],
                      ),
                    ),
                  ),
                  //
                ],
              ),
            );
          });
        });
  }
}
