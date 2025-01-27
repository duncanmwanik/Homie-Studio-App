import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../_providers/_providers.dart';
import '../../_theme/spacing.dart';
import '../../_theme/variables.dart';
import '../../_widgets/buttons/planet.dart';
import '../ble/ble_service.dart';
import 'colorpicker/colorpicker.dart';
import 'colorpicker/palette.dart';
import 'colorpicker/utils.dart';

class AppColorPicker extends StatelessWidget {
  const AppColorPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Planet(
      maxWidth: 300,
      noStyling: true,
      padding: noPadding,
      margin: padM('tb'),
      child: ColorPicker(
        colorPickerWidth: 60.w,
        pickerColor: Color(0xffffffff),
        paletteType: PaletteType.hueWheel,
        enableAlpha: false,
        hexInputBar: false,
        displayThumbColor: false,
        onColorChanged: (color) {
          String hexColor = '0x${color.toHexString().substring(2).toLowerCase()}';
          state.hub.setEffect(hexColor);
          bleService.sendData(hexColor);
        },
      ),
    );
  }
}
