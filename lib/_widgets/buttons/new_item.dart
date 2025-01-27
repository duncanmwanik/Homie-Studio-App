import 'package:flutter/material.dart';

import '../../_theme/spacing.dart';
import '../../_theme/variables.dart';
import '../others/icons.dart';
import 'planet.dart';

class NewItem extends StatelessWidget {
  const NewItem({
    super.key,
    required this.label,
    this.onPressed,
  });

  final String label;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Planet(
      margin: padM('r'),
      onPressed: onPressed,
      radius: borderRadiusLarge,
      child: AppIcon(Icons.add, color: styler.accent),
    );
  }
}
