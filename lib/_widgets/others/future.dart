import 'package:flutter/material.dart';

import 'others/other.dart';

class AppFuture extends StatelessWidget {
  const AppFuture({
    super.key,
    required Future<dynamic> this.future,
    required this.widget,
    this.loadingWidget,
    this.errorWidget,
    this.commonWidget,
  });

  final Future<dynamic>? future;
  final Widget Function(dynamic) widget;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final Widget? commonWidget;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return commonWidget ?? (errorWidget ?? NoWidget());
          } else if (snapshot.hasData) {
            return widget(snapshot.data);
          }
        }

        return commonWidget ?? (loadingWidget ?? NoWidget());
      },
    );
  }
}
