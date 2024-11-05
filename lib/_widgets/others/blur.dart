import 'dart:ui';

import 'package:flutter/material.dart';

class Blur extends StatelessWidget {
  const Blur({
    super.key,
    this.enabled = true,
    this.blur = 80,
    this.radius,
    this.borderRadius,
    required this.child,
  });

  final bool enabled;
  final double blur;
  final double? radius;
  final BorderRadius? borderRadius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: enabled ? (borderRadius ?? (radius != null ? BorderRadius.circular(radius!) : BorderRadius.zero)) : BorderRadius.zero,
      child: BackdropFilter(
        filter: enabled ? ImageFilter.blur(sigmaX: blur, sigmaY: blur) : ImageFilter.blur(),
        child: child,
      ),
    );
  }
}
