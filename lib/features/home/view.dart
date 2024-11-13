import 'package:flutter/material.dart';

import '../../_theme/spacing.dart';
import '../../_variables/features.dart';
import '../colors/colors_view.dart';
import '../favorites/favorite.dart';
import '../mixer/mixer_view.dart';
import '../music/music_view.dart';
import '../patterns/pattern_view.dart';

class AppView extends StatelessWidget {
  const AppView({super.key, required this.view});

  final String view;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        padding: padM(),
        child: view.isColors()
            ? ColorsView()
            : view.isPatterns()
                ? PatternView()
                : view.isMusic()
                    ? MusicView()
                    : view.isMixer()
                        ? MixerView()
                        : view.isFavorites()
                            ? FavoriteView()
                            : ColorsView(),
      ),
    );
  }
}
