import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../_theme/spacing.dart';
import '../../../_widgets/others/icons.dart';

class PanelPlaceholder extends StatelessWidget {
  const PanelPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pad(t: 35.h),
      child: AppIcon(Icons.bolt, size: 5.h, extraFaded: true),
    );
  }
}
