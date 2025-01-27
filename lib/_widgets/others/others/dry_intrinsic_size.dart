import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// NOTE ref: https://github.com/flutter/flutter/issues/71687 & https://gist.github.com/matthew-carroll/65411529a5fafa1b527a25b7130187c6
/// Same as `IntrinsicWidth` except that when this widget is instructed
/// to `computeDryLayout()`, it doesn't invoke that on its child, instead
/// it computes the child's intrinsic width.
///
/// This widget is useful in situations where the `child` does not
/// support dry layout, e.g., `TextField` as of 01/02/2021.
class DryIntrinsicWidth extends SingleChildRenderObjectWidget {
  const DryIntrinsicWidth({super.key, super.child});

  @override
  RenderDryIntrinsicWidth createRenderObject(BuildContext context) => RenderDryIntrinsicWidth();
}

class RenderDryIntrinsicWidth extends RenderIntrinsicWidth {
  @override
  Size computeDryLayout(BoxConstraints constraints) {
    if (child != null) {
      final width = child!.computeMinIntrinsicWidth(constraints.maxHeight);
      final height = child!.computeMinIntrinsicHeight(width);
      return Size(width, height);
    } else {
      return Size.zero;
    }
  }
}

class DryIntrinsicHeight extends SingleChildRenderObjectWidget {
  const DryIntrinsicHeight({super.key, super.child});

  @override
  RenderDryIntrinsicHeight createRenderObject(BuildContext context) => RenderDryIntrinsicHeight();
}

class RenderDryIntrinsicHeight extends RenderIntrinsicHeight {
  @override
  Size computeDryLayout(BoxConstraints constraints) {
    if (child != null) {
      final height = child!.computeMinIntrinsicHeight(constraints.maxWidth);
      final width = child!.computeMinIntrinsicWidth(height);
      return Size(width, height);
    } else {
      return Size.zero;
    }
  }
}
