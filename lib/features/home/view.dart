import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../_helpers/extentions/strings.dart';
import '../../_providers/views.dart';
import '../../_theme/spacing.dart';
import '../../_theme/variables.dart';
import '../../_widgets/buttons/planet.dart';
import '../colors/colors_view.dart';
import '../favorites/favorite.dart';
import '../mixer/mixer_view.dart';
import '../music/music_view.dart';
import '../patterns/pattern_view.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ViewsProvider>(
      builder: (context, views, child) {
        return Title(
          title: views.view.cap(),
          color: styler.accentColor(),
          child: Planet(
            width: double.infinity,
            padding: noPadding,
            noStyling: true,
            child: SingleChildScrollView(
              padding: padC('l8,r8,t8,b64'),
              child: views.isColors()
                  ? ColorsView()
                  : views.isPatterns()
                      ? PatternView()
                      : views.isMusic()
                          ? MusicView()
                          : views.isMixer()
                              ? MixerView()
                              : views.isFavorites()
                                  ? FavoriteView()
                                  : ColorsView(),
            ),
          ),
        );
      },
    );
  }
}
