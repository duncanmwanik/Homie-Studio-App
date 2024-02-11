import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../ble/ble_service.dart';
import '../../../../../common_variables/state_providers.dart';
import '../../../../../state/commands_state.dart';
import '../../../../../theme/theme.dart';

class PatternColorOptions extends StatelessWidget {
  const PatternColorOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CommandModel>(builder: (context, command, child) {
      Widget optionButton(int value, String label, IconData icon) {
        return Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: ElevatedButton(
            onPressed: () {
              command.updateSpeed(value);
              bleService.sendMessageToDevice("s$value");
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: command.speed == value ? themeColors[themeWatch.selectedTheme] : Colors.white12,
                foregroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                )),
            child: FittedBox(
              fit: BoxFit.contain,
              child: Row(
                children: [
                  Visibility(
                      visible: value != 2,
                      child: RotatedBox(
                        quarterTurns: value == 1 ? 2 : 0,
                        child: Icon(
                          icon,
                          color: Colors.white,
                        ),
                      )),
                  Text(
                    label,
                    style: TextStyle(
                      fontWeight: command.speed == value ? FontWeight.w900 : FontWeight.w800,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
      }

      return Container(
        margin: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
        decoration: deco,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 5),
              child: Icon(
                Icons.directions_run_rounded,
                color: Colors.white,
              ),
            ),
            optionButton(0, " 2", Icons.fast_rewind_rounded),
            optionButton(1, " 1", Icons.play_arrow_rounded),
            optionButton(2, "0", Icons.fast_rewind_rounded),
            optionButton(3, " 1", Icons.play_arrow_rounded),
            optionButton(4, " 2", Icons.fast_forward_rounded),
          ],
        ),
      );
    });
  }
}
