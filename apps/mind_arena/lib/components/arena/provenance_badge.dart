import 'package:flutter/widgets.dart';
import 'package:mind_arena/design/tokens/mind_colors.dart';
import 'package:mind_arena/design/tokens/mind_spacing.dart';
import 'package:mind_arena/design/typography/mind_typography.dart';

/// Trust / provenance badge tag used across Mind Arena.
class ProvenanceBadge extends StatelessWidget {
  const ProvenanceBadge({
    super.key,
    required this.label,
    this.color = MindColors.actionPrimary,
    this.backgroundColor = MindColors.surfaceEmphasis,
  });

  final String label;
  final Color color;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: label,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: MindSpacing.space12,
          vertical: MindSpacing.space4,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(MindSpacing.radiusPill),
          border: Border.all(color: color.withValues(alpha: 0.4), width: 1.0),
        ),
        child: Text(
          label,
          style: MindTypography.supporting(
            context,
            color: color,
          ).copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
