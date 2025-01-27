import 'package:flutter/material.dart';

import '../../_theme/variables.dart';
import '../../_widgets/others/text.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //
        Center(
          child: AppText('Favorites', faded: true, size: title),
        ),
        //
      ],
    );
  }
}
