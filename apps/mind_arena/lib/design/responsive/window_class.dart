import 'package:flutter/widgets.dart';

/// Window width classification tokens.
enum WindowClass {
  compact,
  medium,
  expanded;

  static WindowClass fromWidth(double width) {
    if (width < 600.0) {
      return WindowClass.compact;
    } else if (width < 1024.0) {
      return WindowClass.medium;
    } else {
      return WindowClass.expanded;
    }
  }

  static WindowClass of(BuildContext context) {
    return fromWidth(MediaQuery.sizeOf(context).width);
  }

  bool get isCompact => this == WindowClass.compact;
  bool get isMedium => this == WindowClass.medium;
  bool get isExpanded => this == WindowClass.expanded;
}

/// Helper widget to build responsive layouts based on current [WindowClass].
class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.compact,
    this.medium,
    this.expanded,
  });

  final WidgetBuilder compact;
  final WidgetBuilder? medium;
  final WidgetBuilder? expanded;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final windowClass = WindowClass.fromWidth(constraints.maxWidth);
        switch (windowClass) {
          case WindowClass.compact:
            return compact(context);
          case WindowClass.medium:
            return (medium ?? compact)(context);
          case WindowClass.expanded:
            return (expanded ?? medium ?? compact)(context);
        }
      },
    );
  }
}
