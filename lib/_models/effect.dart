import 'package:flutter/material.dart';

import '../_theme/variables.dart';

class Effect {
  const Effect({
    required this.title,
    required this.code,
    this.color = transparent,
  });

  final String title;
  final String code;
  final Color color;

  bool isFav() => code.isEmpty;
}
