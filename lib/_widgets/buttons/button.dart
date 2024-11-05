import 'package:flutter/material.dart';

import '../../_helpers/navigation.dart';
import '../../_theme/helpers.dart';
import '../../_theme/spacing.dart';
import '../../_theme/variables.dart';
import '../menu/menu.dart';
import '../others/blur.dart';
import '../others/icons.dart';
import '../others/others/dry_intrinsic_size.dart';
import '../others/text.dart';
import '../others/tooltip.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.enabled = true,
    this.onPressed,
    this.onLongPress,
    this.onHover,
    this.showMenuOnLongPress = false,
    this.leading,
    this.content,
    this.trailing,
    this.child,
    this.iconSize = 18,
    this.textSize,
    this.borderRadius,
    this.radius,
    this.customBorder,
    this.color,
    this.hoverColor,
    this.bgColor,
    this.textColor,
    this.borderColor,
    this.showBorder = false,
    this.isRound = false,
    this.isSquare = false,
    this.faded = false,
    this.margin,
    this.padding,
    this.slp = false,
    this.srp = false,
    this.svp = false,
    this.isDropDown = false,
    this.dryWidth = false,
    this.noStyling = false,
    this.expand = false,
    this.blur = false,
    this.borderWidth,
    this.maxWidth,
    this.maxHeight,
    this.width,
    this.height,
    this.tooltip,
    this.tooltipDirection,
    this.menuItems = const [],
    this.menuWidth,
    this.keepMenuPosition = false,
    this.popMenu = false,
    this.mouseCursor,
  });

  final bool enabled;
  final Function()? onPressed;
  final Function()? onLongPress;
  final Function(bool)? onHover;
  final bool showMenuOnLongPress;
  final dynamic leading;
  final dynamic content;
  final dynamic trailing;
  final Widget? child;
  final double iconSize;
  final double? textSize;
  final Color? color;
  final Color? hoverColor;
  final Color? textColor;
  final String? bgColor;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final double? radius;
  final ShapeBorder? customBorder;
  final bool showBorder;
  final bool isRound;
  final bool isSquare;
  final bool faded;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final bool slp;
  final bool srp;
  final bool svp;
  final bool isDropDown;
  final bool dryWidth;
  final bool noStyling;
  final bool expand;
  final bool blur;
  final double? borderWidth;
  final double? maxWidth;
  final double? maxHeight;
  final double? width;
  final double? height;
  final String? tooltip;
  final AxisDirection? tooltipDirection;
  final List<Widget>? menuItems;
  final double? menuWidth;
  final bool popMenu;
  final bool keepMenuPosition;
  final MouseCursor? mouseCursor;

  @override
  Widget build(BuildContext context) {
    bool isMenu = menuItems != null && menuItems!.isNotEmpty;
    bool hasBgColor = bgColor != null;

    Widget button = IgnorePointer(
      ignoring: !enabled,
      child: Blur(
        enabled: blur,
        radius: isRound ? borderRadiusCrazy : borderRadiusTiny,
        child: Material(
          color: noStyling ? transparent : color ?? (hasBgColor ? Colors.white24 : styler.appColor(styler.isDark ? 1.3 : 1.5)),
          shape: customBorder ??
              RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(radius ?? (isRound ? borderRadiusCrazy : borderRadiusTiny)),
                side: showBorder
                    ? BorderSide(
                        color: borderColor ?? (hasBgColor ? Colors.black38 : Colors.grey.withOpacity(0.3)),
                        width: borderWidth ?? (isDark() ? 0.4 : 0.8),
                      )
                    : BorderSide.none,
              ),
          child: InkWell(
            onTap: isMenu ? () {} : onPressed,
            onLongPress: showMenuOnLongPress
                ? () {
                    if (popMenu) popWhatsOnTop(); //pops popupmenu
                    showAppMenu(Offset(0, 0), menuItems!, width: menuWidth, keepMenuPosition: keepMenuPosition);
                  }
                : onLongPress,
            onHover: onHover,
            onTapDown: isMenu
                ? (details) {
                    if (popMenu) popWhatsOnTop(); //pops popupmenu
                    showAppMenu(details.globalPosition, menuItems!, width: menuWidth, keepMenuPosition: keepMenuPosition);
                  }
                : null,
            customBorder: customBorder,
            borderRadius: customBorder != null
                ? null
                : borderRadius ?? BorderRadius.circular(radius ?? (isRound ? borderRadiusCrazy : borderRadiusTiny)),
            hoverColor: hoverColor,
            highlightColor: hoverColor,
            splashColor: hoverColor,
            mouseCursor: mouseCursor,
            child: Container(
              constraints: BoxConstraints(
                minHeight: height ?? 0,
                minWidth: width ?? 0,
                maxWidth: maxWidth ?? double.infinity,
                maxHeight: maxHeight ?? double.infinity,
              ),
              padding: padding ??
                  (isRound
                      ? const EdgeInsets.all(6)
                      : EdgeInsets.only(
                          left: slp || isSquare ? 8 : 12,
                          right: srp || isSquare ? 8 : (isDropDown ? 9 : 12),
                          top: svp ? 3 : 5,
                          bottom: svp ? 3 : 5,
                        )),
              child: child ??
                  Row(
                    mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
                    mainAxisAlignment: expand ? MainAxisAlignment.start : MainAxisAlignment.center,
                    children: [
                      // leading
                      if (leading != null)
                        Padding(
                          padding: leading != null && content != null ? padM('r') : noPadding,
                          child: leading.runtimeType == String
                              ? AppText(text: leading, size: textSize, faded: faded, color: textColor, bgColor: bgColor)
                              : leading.runtimeType == IconData
                                  ? AppIcon(leading, size: iconSize, faded: faded, color: textColor, bgColor: bgColor)
                                  : leading,
                        ),
                      // content
                      if (content != null)
                        Flexible(
                          fit: expand ? FlexFit.tight : FlexFit.loose,
                          child: content.runtimeType == String
                              ? AppText(text: content, size: textSize, faded: faded, color: textColor, bgColor: bgColor)
                              : content.runtimeType == IconData
                                  ? AppIcon(content, size: iconSize, faded: faded, color: textColor, bgColor: bgColor)
                                  : content,
                        ),
                      if (expand) Spacer(),
                      // trailing
                      if (trailing != null)
                        Padding(
                          padding: trailing != null && content != null ? padM('l') : noPadding,
                          child: trailing.runtimeType == String
                              ? AppText(text: trailing, size: textSize, faded: faded, color: textColor, bgColor: bgColor)
                              : trailing.runtimeType == IconData
                                  ? AppIcon(trailing, size: iconSize, faded: faded, color: textColor, bgColor: bgColor)
                                  : trailing,
                        ),
                    ],
                  ),
            ),
          ),
        ),
      ),
    );

    return Padding(
      padding: margin ?? noPadding,
      child: AppTooltip(
        message: tooltip,
        axisDirection: tooltipDirection,
        child: dryWidth ? DryIntrinsicWidth(child: button) : button,
      ),
    );
  }
}
