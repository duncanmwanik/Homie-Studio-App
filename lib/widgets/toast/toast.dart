import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:homie_ble/theme/theme.dart';

import '../../common_variables/globals.dart';
import '../../common_variables/state_providers.dart';

void showToast(int type, String message) {
  BotToast.showAttachedWidget(
      allowClick: true,
      attachedBuilder: (_) => Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(left: w * 0.05, right: w * 0.05, top: 10),
              child: Card(
                color: themeColors[themeWatch.selectedTheme],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        type == 0 ? Icons.sentiment_very_dissatisfied : Icons.sentiment_very_satisfied_rounded,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Text(
                          message,
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      target: Offset(0, 0),
      duration: Duration(seconds: 3));
}
