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

  /// Elevated card surface with subtle ambient depth (#182A44)
  static const Color surfaceElevated = Color(0xFF182A44);

  /// Structural borders and quiet boundaries (#36506F)
  static const Color borderQuiet = Color(0xFF36506F);

  /// Active glowing border highlight (#5078A8)
  static const Color borderGlow = Color(0xFF5078A8);

  /// Primary high-contrast reading text (#F5F7FA)
  static const Color textPrimary = Color(0xFFF5F7FA);

  /// Supporting copy text (#C0CAD8)
  static const Color textSecondary = Color(0xFFC0CAD8);

  /// Readable metadata text (#94A4B8)
  static const Color textMuted = Color(0xFF94A4B8);

  /// Participant action focus and accent (#62D7CD)
  static const Color actionPrimary = Color(0xFF62D7CD);

  /// Hover state for primary action (#7EE8DF)
  static const Color actionPrimaryHover = Color(0xFF7EE8DF);

  /// Real human perspective provenance (#B8A7FF)
  static const Color humanPrimary = Color(0xFFB8A7FF);

  /// World consequence and caution (#F0BE72)
  static const Color worldConsequence = Color(0xFFF0BE72);

  /// Destructive, report, or critical safety warning (#FF8F8F)
  static const Color safetyCritical = Color(0xFFFF8F8F);

  /// Visible keyboard focus ring (#8DDEFF)
  static const Color focusVisible = Color(0xFF8DDEFF);

  /// Role visual category accents
  static const Color roleEngineering = Color(0xFFFF9E64);
  static const Color roleMedical = Color(0xFF7AA2F7);
  static const Color roleFlight = Color(0xFF7DCFFF);
  static const Color roleBiology = Color(0xFF9ECE6A);
  static const Color roleGuardian = Color(0xFFF7768E);
  static const Color roleGovernance = Color(0xFFBB9AF7);

  /// Background radial gradient background
  static const RadialGradient cosmicRadialBackground = RadialGradient(
    center: Alignment(0.0, -0.4),
    radius: 1.4,
    colors: [Color(0xFF0F223D), Color(0xFF0A1628), Color(0xFF050C16)],
    stops: [0.0, 0.5, 1.0],
  );

  /// Card subtle gradient overlay
  static const LinearGradient cardSurfaceGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF162740), Color(0xFF101C2E)],
  );
}
