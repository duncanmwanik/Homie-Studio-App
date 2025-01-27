import 'package:flutter/material.dart';

import '../../_helpers/navigation.dart';
import '../../_models/menu.dart';
import '../../_theme/helpers.dart';
import '../../_theme/spacing.dart';
import '../../_theme/variables.dart';
import '../menu/menu.dart';
import '../others/blur.dart';
import '../others/icons.dart';
import '../others/others/dry_intrinsic_size.dart';
import '../others/text.dart';
import '../others/tooltip.dart';

class Planet extends StatelessWidget {
  const Planet({
    super.key,
    this.enabled = true,
    this.onPressed,
    this.onDoublePress,
    this.onLongPress,
    this.onHover,
    this.leading,
    this.content,
    this.trailing,
    this.child,
    this.iconSize = 18,
    this.textSize,
    this.gradient,
    this.borderRadius,
    this.borderSide,
    this.radius,
    this.customBorder,
    this.color,
    this.hoverColor,
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
    this.minWidth,
    this.minHeight,
    this.maxWidth,
    this.maxHeight,
    this.width,
    this.height,
    this.tooltip,
    this.tooltipDirection,
    this.menu,
    this.keepMenuPosition = false,
    this.mouseCursor,
  });

  final bool enabled;
  final Function()? onPressed;
  final Function()? onDoublePress;
  final Function()? onLongPress;
  final Function(bool)? onHover;
  final dynamic leading;
  final dynamic content;
  final dynamic trailing;
  final Widget? child;
  final double iconSize;
  final double? textSize;
  final Color? color;
  final Color? hoverColor;
  final Color? textColor;
  final Gradient? gradient;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final BoxBorder? borderSide;
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
  final double? minWidth;
  final double? minHeight;
  final double? maxWidth;
  final double? maxHeight;
  final double? width;
  final double? height;
  final String? tooltip;
  final AxisDirection? tooltipDirection;
  final Menu? menu;
  final bool keepMenuPosition;
  final MouseCursor? mouseCursor;

  @override
  Widget build(BuildContext context) {
    bool isMenu = menu != null;

    Widget button = Blur(
      enabled: blur,
      radius: radius ?? (isRound ? borderRadiusCrazy : borderRadiusTiny),
      child: Material(
        color: transparent,
        child: InkWell(
          onTap: !enabled ? null : (isMenu ? () {} : onPressed),
          onDoubleTap: !enabled ? null : (isMenu ? () {} : onDoublePress),
          onLongPress: !enabled ? null : onLongPress,
          onHover: !enabled ? null : onHover,
          onTapDown: !enabled
              ? null
              : isMenu
                  ? (details) {
                      if (menu!.pop) popWhatsOnTop(); //pops popupmenu
                      showAppMenu(details.globalPosition, menu);
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
            height: height,
            width: width,
            constraints: BoxConstraints(
              minHeight: minHeight ?? 0,
              minWidth: minWidth ?? 0,
              maxWidth: maxWidth ?? double.infinity,
              maxHeight: maxHeight ?? double.infinity,
            ),
            padding: padding ??
                (isRound
                    ? const EdgeInsets.all(6)
                    : EdgeInsets.only(
                        left: slp ? 6 : (isSquare ? 6 : 12),
                        right: srp ? 6 : (isSquare ? 6 : 12),
                        top: svp ? 3 : 5,
                        bottom: svp ? 3 : 5,
                      )),
            decoration: BoxDecoration(
              color: noStyling ? transparent : color ?? (styler.appColor(isDarkOnly() ? 1 : 2)),
              borderRadius: borderRadius ?? BorderRadius.circular(radius ?? (isRound ? borderRadiusCrazy : borderRadiusTiny)),
              border: borderSide ??
                  (showBorder
                      ? Border.all(
                          color: borderColor ?? (Colors.grey.withOpacity(0.3)),
                          width: borderWidth ?? 0.7,
                        )
                      : null),
              gradient: gradient,
            ),
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
                            ? AppText(leading, size: textSize, faded: faded, color: textColor)
                            : leading.runtimeType == IconData
                                ? AppIcon(leading, size: iconSize, faded: faded, color: textColor)
                                : leading,
                      ),
                    // content
                    if (content != null)
                      Flexible(
                        fit: expand ? FlexFit.tight : FlexFit.loose,
                        child: content.runtimeType == String
                            ? AppText(content, size: textSize, faded: faded, color: textColor)
                            : content.runtimeType == IconData
                                ? AppIcon(content, size: iconSize, faded: faded, color: textColor)
                                : content,
                      ),
                    if (expand) Spacer(),
                    // trailing
                    if (trailing != null)
                      Padding(
                        padding: trailing != null && content != null ? padM('l') : noPadding,
                        child: trailing.runtimeType == String
                            ? AppText(trailing, size: textSize, faded: faded, color: textColor)
                            : trailing.runtimeType == IconData
                                ? AppIcon(trailing, size: iconSize, faded: faded, color: textColor)
                                : trailing,
                      ),
                  ],
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
