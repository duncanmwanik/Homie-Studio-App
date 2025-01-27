import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  const AppImage(
    this.path, {
    super.key,
    this.size,
    this.height,
    this.width,
    this.borderRadius = 0,
    this.fit = BoxFit.cover,
    this.margin,
  });

  final String path;
  final double? size;
  final double? height;
  final double? width;
  final double borderRadius;
  final BoxFit fit;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? size,
      width: width ?? size,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        image: DecorationImage(
          image: AssetImage(path.startsWith('assets/') ? path : 'assets/images/$path'),
          fit: fit,
        ),
      ),
    );
  }
}
