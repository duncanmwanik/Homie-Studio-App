import 'package:flutter/material.dart';

import '../../_theme/spacing.dart';
import '../../_theme/variables.dart';
import '../buttons/planet.dart';
import 'icons.dart';
import 'others/other.dart';

class AppCheckBox extends StatefulWidget {
  const AppCheckBox({
    super.key,
    required this.isChecked,
    this.onTap,
    this.size,
    this.margin,
    this.showCheck = false,
  });

  final bool isChecked;
  final Function()? onTap;
  final double? size;
  final EdgeInsets? margin;
  final bool showCheck;

  @override
  State<AppCheckBox> createState() => _AppCheckBoxState();
}

class _AppCheckBoxState extends State<AppCheckBox> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    double size = widget.size ?? normal;

    return Padding(
      padding: widget.margin ?? noPadding,
      child: IgnorePointer(
        ignoring: widget.onTap == null,
        child: Material(
          color: transparent,
          child: InkWell(
            onTap: widget.onTap,
            onHover: (value) => setState(() => isHovered = value),
            borderRadius: BorderRadius.circular(borderRadiusLarge),
            child: Planet(
              width: size,
              height: size,
              margin: padS(),
              padding: noPadding,
              color: widget.isChecked ? styler.accentColor() : transparent,
              borderRadius: BorderRadius.circular(borderRadiusLarge),
              showBorder: !widget.isChecked,
              borderWidth: 1.5,
              borderColor: styler.appColor(5),
              child: Center(
                child: widget.isChecked || widget.showCheck || isHovered
                    ? AppIcon(
                        Icons.done_rounded,
                        size: tinySmall,
                        faded: true,
                        color: widget.isChecked ? white : null,
                      )
                    : const NoWidget(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
