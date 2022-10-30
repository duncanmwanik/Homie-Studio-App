import 'package:flutter/material.dart';
import 'package:homie_ble/models/globals.dart';
import 'package:provider/provider.dart';

Widget loadingWidget(BuildContext context) {
  return Consumer<GlobalModel>(builder: (context, global, child) {
    return Visibility(
        visible: global.showLoading,
        child: const LinearProgressIndicator(
          backgroundColor: Colors.white,
          valueColor: AlwaysStoppedAnimation(Colors.redAccent),
        ));
  });
}
