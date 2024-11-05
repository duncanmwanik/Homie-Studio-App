import 'package:responsive_sizer/responsive_sizer.dart';

import 'variables.dart';

bool isPhone() => 100.w <= 500;
bool isNotPhone() => 100.w > 500;
bool isTabAndBelow() => 100.w <= 768;
bool isSmallPC() => 100.w > 768;
bool isLargdePC() => 100.w > 1200;
bool showPanelOptions() => 100.w >= 840;
bool showFloatingSheet() => 100.w > webMaxWidth;
