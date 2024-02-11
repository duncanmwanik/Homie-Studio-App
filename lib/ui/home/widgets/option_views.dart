import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../state/global_state.dart';
import '../views/colors/color_view.dart';
import '../views/favorites/favorites_view.dart';
import '../views/music/music_view.dart';
import '../views/other/extra_view.dart';
import '../views/patterns/pattern_view.dart';

// ignore: must_be_immutable
class OptionViews extends StatelessWidget {
  OptionViews({super.key});

  List views = [
    PatternOptions(),
    ColorOptions(),
    FavoriteOptions(),
    MusicOptions(),
    ExtraOptions(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<GlobalModel>(builder: (context, global, child) {
      return GestureDetector(
        // onHorizontalDragEnd: (details) => changePageViewOnSwipe(details),
        child: views[global.selectedView],
      );
    });
  }
}
