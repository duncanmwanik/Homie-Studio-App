import 'package:flutter/material.dart';

import '../../../common_variables/globals.dart';
import '../../../common_variables/state_providers.dart';
import '../../../widgets/other_widgets.dart';
import '../../../theme/theme.dart';

void showChangeDeviceNameDialog(BuildContext context,
    {required TextEditingController textController, required int maxLength, required GestureTapCallback onTap}) {
  showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: secondaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            infoText("Rename your lamp"),
            Container(
              width: w * 0.8,
              padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
              margin: EdgeInsets.only(left: 5, right: 5, bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(
                  width: 0.5,
                  color: primaryColor,
                ),
              ),
              child: TextField(
                controller: textController,
                maxLines: 2,
                maxLength: maxLength,
                style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black87),
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                  backgroundColor: themeColors[themeWatch.selectedTheme],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  )),
              child: const Text(
                'Done',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      );
    },
  );
}
