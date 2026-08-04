import 'package:flutter/widgets.dart';

/// Semantic colors for the Quiet Orbit design system.
/// Defined in docs/frontend/mind-design-bible.md.
abstract final class MindColors {
  /// Deep neutral primary background (#07111F)
  static const Color canvasBase = Color(0xFF07111F);

  /// Secondary navigation and stage background (#0D1A2B)
  static const Color canvasRaised = Color(0xFF0D1A2B);

  /// Thought cards and default surface (#142338)
  static const Color surfaceDefault = Color(0xFF142338);

  /// Active decision object surface (#1B2E48)
  static const Color surfaceEmphasis = Color(0xFF1B2E48);

  /// Structural borders and quiet boundaries (#36506F)
  static const Color borderQuiet = Color(0xFF36506F);

  /// Primary high-contrast reading text (#F5F7FA)
  static const Color textPrimary = Color(0xFFF5F7FA);

  /// Supporting copy text (#C0CAD8)
  static const Color textSecondary = Color(0xFFC0CAD8);

  /// Readable metadata text (#94A4B8)
  static const Color textMuted = Color(0xFF94A4B8);

  /// Participant action focus and accent (#62D7CD)
  static const Color actionPrimary = Color(0xFF62D7CD);

  /// Real human perspective provenance (#B8A7FF)
  static const Color humanPrimary = Color(0xFFB8A7FF);

  /// World consequence and caution (#F0BE72)
  static const Color worldConsequence = Color(0xFFF0BE72);

  /// Destructive, report, or critical safety warning (#FF8F8F)
  static const Color safetyCritical = Color(0xFFFF8F8F);

  /// Visible keyboard focus ring (#8DDEFF)
  static const Color focusVisible = Color(0xFF8DDEFF);
}
