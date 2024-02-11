import 'package:flutter/material.dart';

import '../../../../common_variables/globals.dart';

class FavoriteOptions extends StatelessWidget {
  const FavoriteOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: h * 0.7,
      ),
      child: Column(
        children: [
          SizedBox(height: 50),
          Text("Ha! Not yet...\nCoffee ran out!", style: TextStyle(color: Colors.white)),
          // ----------- COLORS
          // title("COLORS", null),
          // favoriteColors(),

          // // // ----------- PATTERNS
          // title("PATTERNS", null),
          // favoritePatterns(),

          // // // ----------- MUSIC VU
          // title("MUSIC", null),
          // favoriteMusic(),
        ],
      ),
    );
  }
}
