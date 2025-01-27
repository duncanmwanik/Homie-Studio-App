import 'package:flutter/material.dart';

import '../../_helpers/navigation.dart';
import '../../_theme/colors.dart';
import '../../_theme/variables.dart';
import '../buttons/planet.dart';
import 'icons.dart';

class ColorItem extends StatefulWidget {
  const ColorItem({super.key, this.selectedColor, required this.color, this.onSelect});

  final String? selectedColor;
  final String color;
  final Function(String newColor)? onSelect;

  @override
  State<ColorItem> createState() => _ColorItemState();
}

class _ColorItemState extends State<ColorItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Planet(
      onPressed: () => popWhatsOnTop(todo: () => widget.onSelect!(widget.color)),
      onHover: (value) => setState(() => isHovered = value),
      isRound: true,
      width: 30,
      height: 30,
      dryWidth: true,
      padding: noPadding,
      color: backgroundColors[widget.color]!.color,
      child: Center(
        child: AppIcon(
          isHovered ? Icons.lens : Icons.done_rounded,
          size: isHovered ? 10 : 15,
          faded: true,
          color: widget.selectedColor == widget.color || isHovered ? backgroundColors[widget.color]!.textColor : transparent,
        ),
      ),
    );
  }
}
