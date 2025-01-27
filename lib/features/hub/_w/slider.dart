import 'package:flutter/material.dart';

import '../../../_theme/spacing.dart';
import '../../../_theme/variables.dart';
import '../../../_widgets/buttons/planet.dart';
import '../../../_widgets/others/icons.dart';
import '../../../_widgets/others/text.dart';

class AppSlider extends StatelessWidget {
  const AppSlider({
    super.key,
    required this.value,
    required this.secondaryValue,
    required this.min,
    required this.max,
    this.divisions,
    this.labels = const [],
    required this.icon,
    this.margin,
    required this.onChanged,
  });

  final double value;
  final double secondaryValue;
  final double min;
  final double max;
  final int? divisions;
  final List<String> labels;
  final IconData icon;
  final EdgeInsets? margin;
  final Function(double) onChanged;

  @override
  Widget build(BuildContext context) {
    return Planet(
      margin: margin,
      padding: padC('l8,b8,t14'),
      maxWidth: webMaxWidth,
      noStyling: true,
      showBorder: true,
      borderColor: styler.appColor(0.5),
      radius: borderRadiusMedium,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //
          AppIcon(icon, tiny: true, faded: true),
          //
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //
                SizedBox(
                  height: 20,
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 1,
                      trackShape: RoundedRectSliderTrackShape(),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 11),
                    ),
                    child: Slider(
                      thumbColor: white,
                      activeColor: styler.accentColor(),
                      inactiveColor: styler.textColor(extraFaded: true),
                      value: value,
                      secondaryTrackValue: secondaryValue,
                      onChanged: onChanged,
                      min: min,
                      max: max,
                      divisions: divisions,
                    ),
                  ),
                ),
                //
                if (labels.isNotEmpty)
                  Padding(
                    padding: padC('l16,r16,t3'),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (String label in labels)
                          Flexible(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Planet(
                                //   width: 1,
                                //   height: 6,
                                //   color: styler.textColor(extraFaded: true),
                                // ),
                                AppText(label, size: tiny, faded: true, textAlign: TextAlign.center),
                              ],
                            ),
                          ),
                      ],
                    ),
                  )
                //
              ],
            ),
          ),
        ],
      ),
    );
  }
}
