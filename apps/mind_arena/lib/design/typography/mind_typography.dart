import 'package:flutter/widgets.dart';
import 'package:mind_arena/design/tokens/mind_colors.dart';

/// Typography hierarchy and type styles for Mind Arena.
abstract final class MindTypography {
  static const List<String> _systemFontFallbacks = [
    '.SF Pro Text',
    '-apple-system',
    'BlinkMacSystemFont',
    'Segoe UI',
    'Roboto',
    'Helvetica Neue',
    'Arial',
    'sans-serif',
  ];

  /// Display text style.
  static TextStyle display(
    BuildContext context, {
    Color? color,
    double? fontSize,
  }) {
    final width = MediaQuery.sizeOf(context).width;
    final defaultSize = width < 1024 ? 32.0 : 44.0;
    return TextStyle(
      fontSize: fontSize ?? defaultSize,
      fontWeight: FontWeight.w700,
      height: 1.25,
      color: color ?? MindColors.textPrimary,
      fontFamilyFallback: _systemFontFallbacks,
    );
  }

  /// Scene title style.
  static TextStyle sceneTitle(
    BuildContext context, {
    Color? color,
    double? fontSize,
  }) {
    final width = MediaQuery.sizeOf(context).width;
    final defaultSize = width < 1024 ? 24.0 : 32.0;
    return TextStyle(
      fontSize: fontSize ?? defaultSize,
      fontWeight: FontWeight.w600,
      height: 1.3,
      color: color ?? MindColors.textPrimary,
      fontFamilyFallback: _systemFontFallbacks,
    );
  }

  /// Card title style.
  static TextStyle cardTitle(
    BuildContext context, {
    Color? color,
    double? fontSize,
  }) {
    final width = MediaQuery.sizeOf(context).width;
    final defaultSize = width < 1024 ? 18.0 : 20.0;
    return TextStyle(
      fontSize: fontSize ?? defaultSize,
      fontWeight: FontWeight.w600,
      height: 1.35,
      color: color ?? MindColors.textPrimary,
      fontFamilyFallback: _systemFontFallbacks,
    );
  }

  /// Primary reading body style (line height >= 1.4).
  static TextStyle body(
    BuildContext context, {
    Color? color,
    double? fontSize,
  }) {
    final width = MediaQuery.sizeOf(context).width;
    final defaultSize = width < 1024 ? 16.0 : 17.0;
    return TextStyle(
      fontSize: fontSize ?? defaultSize,
      fontWeight: FontWeight.w400,
      height: 1.45,
      color: color ?? MindColors.textPrimary,
      fontFamilyFallback: _systemFontFallbacks,
    );
  }

  /// Supporting context and provenance copy.
  static TextStyle supporting(
    BuildContext context, {
    Color? color,
    double? fontSize,
  }) {
    final width = MediaQuery.sizeOf(context).width;
    final defaultSize = width < 1024 ? 14.0 : 15.0;
    return TextStyle(
      fontSize: fontSize ?? defaultSize,
      fontWeight: FontWeight.w400,
      height: 1.4,
      color: color ?? MindColors.textSecondary,
      fontFamilyFallback: _systemFontFallbacks,
    );
  }

  /// Controls, buttons, and short labels.
  static TextStyle label(
    BuildContext context, {
    Color? color,
    double? fontSize,
  }) {
    final width = MediaQuery.sizeOf(context).width;
    final defaultSize = width < 1024 ? 13.0 : 14.0;
    return TextStyle(
      fontSize: fontSize ?? defaultSize,
      fontWeight: FontWeight.w600,
      height: 1.3,
      color: color ?? MindColors.textPrimary,
      fontFamilyFallback: _systemFontFallbacks,
    );
  }
}
