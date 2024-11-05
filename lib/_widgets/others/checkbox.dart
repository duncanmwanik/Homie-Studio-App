import 'package:flutter/material.dart';

import '../../_theme/variables.dart';
import 'icons.dart';
import 'others/other.dart';

class AppCheckBox extends StatefulWidget {
  const AppCheckBox({
    super.key,
    required this.isChecked,
    this.onTap,
    this.smallPadding = false,
    this.padding,
    this.margin,
  });

  final bool isChecked;
  final Function()? onTap;
  final bool smallPadding;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  State<AppCheckBox> createState() => _AppCheckBoxState();
}

class _AppCheckBoxState extends State<AppCheckBox> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin ?? noPadding,
      child: IgnorePointer(
        ignoring: widget.onTap == null,
        child: Material(
          color: transparent,
          child: InkWell(
            onTap: widget.onTap,
            onHover: (value) => setState(() => isHovered = value),
            borderRadius: BorderRadius.circular(borderRadiusSuperTiny),
            child: Container(
              width: 15,
              height: 15,
              margin: widget.padding ?? EdgeInsets.all(widget.smallPadding ? 2 : 7),
              decoration: BoxDecoration(
                color: widget.isChecked ? styler.accentColor() : null,
                borderRadius: BorderRadius.circular(borderRadiusSuperTiny),
                border: Border.all(
                  color: widget.isChecked ? transparent : Colors.grey,
                  width: 1.5,
                ),
              ),
              child: Center(
                child: widget.isChecked || isHovered
                    ? AppIcon(
                        Icons.done_rounded,
                        size: 12,
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
