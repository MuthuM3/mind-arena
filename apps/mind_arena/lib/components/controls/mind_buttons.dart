import 'package:flutter/material.dart';
import 'package:mind_arena/design/tokens/mind_colors.dart';
import 'package:mind_arena/design/tokens/mind_spacing.dart';
import 'package:mind_arena/design/typography/mind_typography.dart';

/// Primary action button for Quiet Orbit design system.
/// Implements 48px minimum touch target, glowing cyan shadow, and visible focus ring.
class PrimaryActionButton extends StatefulWidget {
  const PrimaryActionButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.focusNode,
    this.autofocus = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final FocusNode? focusNode;
  final bool autofocus;

  @override
  State<PrimaryActionButton> createState() => _PrimaryActionButtonState();
}

class _PrimaryActionButtonState extends State<PrimaryActionButton> {
  bool _isFocused = false;
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MindSpacing.radiusControl),
          border: _isFocused
              ? Border.all(
                  color: MindColors.focusVisible,
                  width: MindSpacing.focusRingWidth,
                )
              : null,
          boxShadow: [
            if (widget.onPressed != null)
              BoxShadow(
                color: MindColors.actionPrimary.withValues(
                  alpha: _isHovered || _isFocused ? 0.45 : 0.2,
                ),
                blurRadius: _isHovered || _isFocused ? 16.0 : 8.0,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        padding: EdgeInsets.all(_isFocused ? MindSpacing.focusRingOffset : 0),
        child: ElevatedButton(
          focusNode: widget.focusNode,
          autofocus: widget.autofocus,
          onFocusChange: (focused) {
            setState(() {
              _isFocused = focused;
            });
          },
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: _isHovered
                ? MindColors.actionPrimaryHover
                : MindColors.actionPrimary,
            foregroundColor: MindColors.canvasBase,
            disabledBackgroundColor: MindColors.borderQuiet,
            disabledForegroundColor: MindColors.textMuted,
            minimumSize: const Size(120.0, MindSpacing.space48),
            padding: const EdgeInsets.symmetric(
              horizontal: MindSpacing.space24,
              vertical: MindSpacing.space12,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(MindSpacing.radiusControl),
            ),
            elevation: 0,
          ),
          child: Text(
            widget.label,
            style: MindTypography.label(
              context,
              color: MindColors.canvasBase,
            ).copyWith(fontWeight: FontWeight.w700, letterSpacing: 0.2),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

/// Secondary action button for Quiet Orbit design system.
class SecondaryActionButton extends StatefulWidget {
  const SecondaryActionButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.focusNode,
    this.autofocus = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final FocusNode? focusNode;
  final bool autofocus;

  @override
  State<SecondaryActionButton> createState() => _SecondaryActionButtonState();
}

class _SecondaryActionButtonState extends State<SecondaryActionButton> {
  bool _isFocused = false;
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MindSpacing.radiusControl),
          border: _isFocused
              ? Border.all(
                  color: MindColors.focusVisible,
                  width: MindSpacing.focusRingWidth,
                )
              : null,
        ),
        padding: EdgeInsets.all(_isFocused ? MindSpacing.focusRingOffset : 0),
        child: OutlinedButton(
          focusNode: widget.focusNode,
          autofocus: widget.autofocus,
          onFocusChange: (focused) {
            setState(() {
              _isFocused = focused;
            });
          },
          onPressed: widget.onPressed,
          style: OutlinedButton.styleFrom(
            backgroundColor: _isHovered
                ? MindColors.surfaceEmphasis
                : MindColors.surfaceDefault,
            foregroundColor: MindColors.textPrimary,
            side: BorderSide(
              color: _isHovered
                  ? MindColors.actionPrimary
                  : MindColors.borderQuiet,
              width: 1.0,
            ),
            minimumSize: const Size(100.0, MindSpacing.space48),
            padding: const EdgeInsets.symmetric(
              horizontal: MindSpacing.space16,
              vertical: MindSpacing.space12,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(MindSpacing.radiusControl),
            ),
          ),
          child: Text(
            widget.label,
            style: MindTypography.label(
              context,
              color: _isHovered
                  ? MindColors.actionPrimary
                  : MindColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
