import 'package:responsive_sizer/responsive_sizer.dart';

bool isPhone() => 100.w <= 500;
bool isNotPhone() => 100.w > 500;
bool isSmallPC() => 100.w > 768;
bool isMediumPC() => 100.w > 868;
bool isLargePC() => 100.w > 1200;
