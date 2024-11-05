import 'package:flutter/material.dart';

import '../../_helpers/navigation.dart';
import '../../_theme/spacing.dart';
import '../../_theme/variables.dart';
import '../buttons/button.dart';
import '../others/icons.dart';
import '../others/others/divider.dart';
import '../others/text.dart';

class MenuItem extends StatefulWidget {
  const MenuItem({
    super.key,
    required this.label,
    this.onTap,
    this.menuItems,
    this.menuWidth,
    this.leading,
    this.trailing,
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
  final List<Widget>? menuItems;
  final double? menuWidth;
  final IconData? trailing;
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
    return MouseRegion(
      onEnter: (event) => setState(() => isHovered = true),
      onExit: (event) => setState(() => isHovered = false),
      child: AppButton(
        onPressed: widget.onTap != null
            ? () {
                if (widget.pop) popWhatsOnTop(); //pops popupmenu
                Future.delayed(const Duration(seconds: 0), widget.onTap); // Future.delayed prevents onTap not working
              }
            : null,
        menuWidth: widget.menuWidth,
        menuItems: widget.menuItems,
        keepMenuPosition: widget.menuItems != null,
        popMenu: widget.menuItems != null,
        padding: pad(
          l: 8,
          t: widget.smallHeight ? 1 : 6,
          b: widget.smallHeight ? 1 : 6,
          r: widget.trailing != null ? 8 : (widget.popTrailing ? 2 : 8),
        ),
        hoverColor: widget.hoverColor,
        noStyling: true,
        child: Row(
          children: [
            if (widget.leading != null)
              AppIcon(
                widget.leading,
                size: widget.leadingSize ?? normal,
                faded: true,
                color: widget.color ?? (widget.isSelected ? styler.accentColor() : null),
              ),
            if (widget.leading != null) spw(),
            Expanded(
              child: AppText(
                text: widget.label,
                size: widget.labelSize,
                color: widget.color ?? (widget.isSelected ? styler.accentColor() : null),
                faded: widget.faded,
                textAlign: widget.center ? TextAlign.center : null,
              ),
            ),
            if (widget.trailing != null || widget.popTrailing) spw(),
            if (widget.trailing != null)
              AppIcon(
                widget.trailing,
                size: widget.trailingSize ?? 16,
                faded: true,
                color: widget.color ?? (widget.isSelected ? styler.accentColor() : widget.trailingColor),
              ),
            if (widget.popTrailing)
              AppButton(
                onPressed: () => popWhatsOnTop(),
                padding: padS(),
                noStyling: true,
                isSquare: true,
                child: AppIcon(closeIcon, size: widget.trailingSize ?? 16, faded: true),
              ),
          ],
        ),
      ),
    );
  }
}

Widget menuDivider({Color? color}) => AppDivider(height: tinyHeight(), color: color);
