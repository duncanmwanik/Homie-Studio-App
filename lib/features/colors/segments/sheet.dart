import 'package:flutter/material.dart';

import '../../../_widgets/buttons/close.dart';
import '../../../_widgets/others/text.dart';
import '../../../_widgets/sheets/bottom_sheet.dart';

void showSegmentsSheet() async {
  await showAppBottomSheet(
    showTopDivider: false,
    header: Row(
      children: [
        AppCloseButton(isX: false),
        Expanded(child: AppText('Segments')),
        AppCloseButton(),
      ],
    ),
    content: SingleChildScrollView(
      child: Column(
        children: [],
      ),
    ),
  );
}
