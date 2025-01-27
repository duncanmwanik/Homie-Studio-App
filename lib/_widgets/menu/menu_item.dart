import 'package:flutter/material.dart';

import '../../_helpers/navigation.dart';
import '../../_models/menu.dart';
import '../../_theme/spacing.dart';
import '../../_theme/variables.dart';
import '../buttons/planet.dart';
import '../others/icons.dart';
import '../others/others/divider.dart';
import '../others/text.dart';

class MenuItem extends StatefulWidget {
  const MenuItem({
    super.key,
    required this.label,
    this.onTap,
    this.menu,
    this.menuWidth,
    this.leading,
    this.trailing,
    this.noStyling = true,
    this.color,
    this.trailingColor,
    this.hoverColor,
    this.labelSize,
    this.leadingSize,
    this.trailingSize,
    this.smallHeight = false,
    this.faded = false,
    this.isSelected = false,
    this.center = false,
    this.pop = true,
    this.popTrailing = false,
  });

  final String label;
  final IconData? leading;
  final Function()? onTap;
  final Menu? menu;
  final double? menuWidth;
  final IconData? trailing;
  final bool noStyling;
  final Color? color;
  final Color? trailingColor;
  final Color? hoverColor;
  final double? labelSize;
  final double? leadingSize;
  final double? trailingSize;
  final bool smallHeight;
  final bool faded;
  final bool isSelected;
  final bool center;
  final bool pop;
  final bool popTrailing;

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    if (widget.menu != null) {
      widget.menu?.pop = true;
    }

    return MouseRegion(
      onEnter: (event) => setState(() => isHovered = true),
      onExit: (event) => setState(() => isHovered = false),
      child: Planet(
        onPressed: widget.onTap != null
            ? () {
                if (widget.pop) popWhatsOnTop(); //pops popupmenu
                Future.delayed(const Duration(seconds: 0), widget.onTap); // Future.delayed prevents onTap not working
              }
            : null,
        width: widget.menuWidth,
        menu: widget.menu,
        padding: pad(
          l: 8,
          t: widget.smallHeight ? 1 : 6,
          b: widget.smallHeight ? 1 : 6,
          r: widget.trailing != null ? 8 : (widget.popTrailing ? 0 : 8),
        ),
        hoverColor: widget.hoverColor,
        noStyling: !widget.isSelected && widget.noStyling,
        child: Row(
          children: [
            // leading
            if (widget.leading != null)
              AppIcon(
                widget.leading,
                size: widget.leadingSize ?? normal,
                faded: true,
                color: widget.color ?? (widget.isSelected ? styler.accentColor() : null),
              ),
            // text
            if (widget.leading != null) spw(),
            Expanded(
              child: AppText(
                widget.label,
                size: widget.labelSize,
                color: widget.color ?? (widget.isSelected ? styler.accentColor() : null),
                weight: widget.isSelected ? ft6 : null,
                faded: widget.faded,
                textAlign: widget.center ? TextAlign.center : null,
              ),
            ),
            // trailing
            if (widget.trailing != null || widget.popTrailing) spw(),
            if (widget.trailing != null)
              AppIcon(
                widget.trailing,
                size: widget.trailingSize ?? 16,
                faded: true,
                color: widget.color ?? (widget.isSelected ? styler.accentColor() : widget.trailingColor),
              ),
            // pop
            if (widget.popTrailing)
              Planet(
                onPressed: () => popWhatsOnTop(),
                padding: padS(),
                noStyling: true,
                isRound: true,
                child: AppIcon(closeIcon, size: widget.trailingSize ?? 16, faded: true),
              ),
          ],
        ),
      ),
    );
  }
}

Widget menuDivider({Color? color}) => AppDivider(height: tinyHeight(), color: color);
