import 'package:flutter/material.dart';
import 'package:mind_arena/design/tokens/mind_colors.dart';
import 'package:mind_arena/design/tokens/mind_spacing.dart';
import 'package:mind_arena/design/typography/mind_typography.dart';

/// Primary action button for Quiet Orbit design system.
/// Implements 48px minimum touch target, visible focus ring, and single keyboard stop.
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

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: MindSpacing.space48,
        minWidth: 120.0,
      ),
      child: Container(
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
            backgroundColor: MindColors.actionPrimary,
            foregroundColor: MindColors.canvasBase,
            disabledBackgroundColor: MindColors.borderQuiet,
            disabledForegroundColor: MindColors.textMuted,
            minimumSize: const Size(120.0, MindSpacing.space48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(MindSpacing.radiusControl),
            ),
            elevation: 0,
          ),
          child: Text(
            widget.label,
            style: MindTypography.label(context, color: MindColors.canvasBase),
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

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: MindSpacing.space48,
        minWidth: 100.0,
      ),
      child: Container(
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
            backgroundColor: MindColors.surfaceDefault,
            foregroundColor: MindColors.textPrimary,
            side: const BorderSide(color: MindColors.borderQuiet),
            minimumSize: const Size(100.0, MindSpacing.space48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(MindSpacing.radiusControl),
            ),
          ),
          child: Text(
            widget.label,
            style: MindTypography.label(context, color: MindColors.textPrimary),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
