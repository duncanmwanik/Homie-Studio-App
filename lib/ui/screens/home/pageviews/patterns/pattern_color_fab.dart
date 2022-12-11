import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../state/globals.dart';
import '../../../../theme/theme.dart';
import 'color_options_dialog.dart';

Widget patternColorFab() {
  return Consumer<GlobalModel>(
    builder: (context, g, child) => Visibility(
      visible: g.selectedPage == 0,
      child: FloatingActionButton(
        backgroundColor: themeColors[g.themeNo],
        onPressed: () {
          showColorDialogList(context);
        },
        child: Consumer<GlobalModel>(
          builder: (context, g, child) => Visibility(
            visible: g.selectedPage == 0,
            child: Container(
              margin: EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: secondaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      margin: EdgeInsets.only(right: 2),
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.amber),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      margin: EdgeInsets.only(right: 2),
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.greenAccent),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      margin: EdgeInsets.only(right: 2),
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.redAccent),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
