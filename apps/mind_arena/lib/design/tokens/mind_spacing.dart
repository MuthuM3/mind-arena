import 'package:flutter/widgets.dart';

/// Geometry, spacing, radii, and touch-target tokens for Mind Arena.
abstract final class MindSpacing {
  static const double space4 = 4.0;
  static const double space8 = 8.0;
  static const double space12 = 12.0;
  static const double space16 = 16.0;
  static const double space24 = 24.0;
  static const double space32 = 32.0;
  static const double space48 = 48.0;
  static const double space64 = 64.0;

  /// Minimum accessible touch target constraint (48x48 logical pixels).
  static const double minTouchTarget = 48.0;

  /// Card corner radius for compact viewports.
  static const double radiusCardCompact = 20.0;

  /// Card corner radius for medium and expanded viewports.
  static const double radiusCardExpanded = 24.0;

  /// Control/button corner radius.
  static const double radiusControl = 14.0;

  /// Status badge / pill radius.
  static const double radiusPill = 999.0;

  /// Focus ring stroke width.
  static const double focusRingWidth = 3.0;

  /// Focus ring offset from component edge.
  static const double focusRingOffset = 2.0;

  /// Edge padding per window class.
  static EdgeInsets edgeInsetsFor(double width) {
    if (width < 600) {
      return const EdgeInsets.all(space16);
    } else if (width < 1024) {
      return const EdgeInsets.all(space24);
    } else {
      return const EdgeInsets.symmetric(horizontal: space48, vertical: space32);
    }
  }
}
